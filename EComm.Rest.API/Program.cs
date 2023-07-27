
using EComm.Rest.API.Data;
using Microsoft.EntityFrameworkCore;
using EComm.DataAccess.Data;
using AutoMapper;
using EComm.Rest.API.Helper;
using EComm.Rest.API.Middleware;
using EComm.Rest.API.Extensions;
using Microsoft.Extensions.Options;
using StackExchange.Redis;
using EComm.DataAccess.Data.Identity;
using Microsoft.AspNetCore.Identity;
using EComm.Model.Entities.Identity;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddAutoMapper(typeof(MappingHelper));
builder.Services.AddControllers();

builder.Services.AddApplicationServices(builder.Configuration);
builder.Services.AddIdentityServices(builder.Configuration);

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerDocumentations();
builder.Services.AddCors(opt =>
{
    opt.AddPolicy("CorsPolicy", policy =>
    {
        policy.AllowAnyHeader().AllowAnyMethod().WithOrigins("*");
        
    });
});


var app = builder.Build();
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var loggerFactory = services.GetRequiredService<ILoggerFactory>();
    try
    {

        //====== Create the Database Table
        var context = services.GetRequiredService<StoreContext>();
        var identityContext = services.GetRequiredService<AppIdentityDbContext>();
        var userManager = services.GetRequiredService<UserManager<AppUser>>();
        await context.Database.MigrateAsync();
        await identityContext.Database.MigrateAsync();

        //====== Insert the data from Json files
        await StoreContextSeed.SeedAsync(context, loggerFactory);
        await AppIdentityDbContectSeed.SeedUserAsync(userManager);
    }
    catch (Exception ex)
    {
        var logger = loggerFactory.CreateLogger<Program>();
        logger.LogError(ex, "Error Occured at Database Migration");
    }

}

app.UseMiddleware<ExceptionMiddleware>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    // app.UseDeveloperExceptionPage();
    // app.UseSwagger();
    // app.UseSwaggerUI();
    
}

app.UseStatusCodePagesWithReExecute("/errors/{0}");

app.UseHttpsRedirection();

app.UseRouting();

app.UseStaticFiles();

app.UseCors("CorsPolicy");

app.UseAuthentication(); // Authentication should first place
app.UseAuthorization(); // Authentication should second place

app.UseSwaggerDocumentation();

app.MapControllers();

app.Run();