using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EComm.DataAccess.Data;
using EComm.DataAccess.Services;
using EComm.Model.Interfaces;
using EComm.Rest.API.Data;
using EComm.Rest.API.Errors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StackExchange.Redis;

namespace EComm.Rest.API.Extensions
{
    public static class ApplicationServicesExtensions
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration config)
        {
            services.AddDbContext<StoreContext>(options =>
            {
                //var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
                var connectionString = config.GetConnectionString("DefaultConnection");
                //options.UseSqlite(connectionString);
                options.UseSqlServer(connectionString);
            });

            services.AddSingleton<IConnectionMultiplexer>(c =>
            {
                //var connectionString = builder.Configuration.GetConnectionString("Redis");
                var options = config.GetConnectionString("Redis");
                return ConnectionMultiplexer.Connect(options);
            });
            
            services.AddScoped<IBasketRepository, BasketRepository>();
            services.AddScoped<IOrderService, OrderService>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IProductRepository, ProductRepository>();
            services.AddScoped<ITokenService, TokenService>();
            services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));
            services.Configure<ApiBehaviorOptions>(oprtions =>
            {
                oprtions.InvalidModelStateResponseFactory = ActionContext =>
                {
                    var errors = ActionContext.ModelState
                                .Where(e => e.Value.Errors.Count > 0)
                                .SelectMany(x => x.Value.Errors)
                                .Select(x => x.ErrorMessage).ToArray();
                    var errorResponse = new APIValidationResponse
                    {
                        Errors = errors
                    };
                    return new BadRequestObjectResult(errorResponse);
                };
            });

            return services;
        }
    }
}