using Microsoft.EntityFrameworkCore;
using EComm.DataAccess;
using EComm.DataAccess.Data.Identity;
using EComm.Model.Entities.Identity;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace EComm.Rest.API.Extensions
{
    public static class IdentityServiceExtensions
    {

        public static IServiceCollection AddIdentityServices(this IServiceCollection services, IConfiguration config)
        {
            services.AddDbContext<AppIdentityDbContext>(Opt =>
            {
                var connectionString = config.GetConnectionString("DefaultConnection");
                //options.UseSqlite(connectionString);
                Opt.UseSqlServer(connectionString);
            });

            services.AddIdentityCore<AppUser>(Opt =>
            {
                // Options
            })
            .AddEntityFrameworkStores<AppIdentityDbContext>()
            .AddSignInManager<SignInManager<AppUser>>();

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                    .AddJwtBearer(options =>
                    {
                        options.TokenValidationParameters = new TokenValidationParameters
                        {
                            ValidateIssuerSigningKey = true,
                            IssuerSigningKey = new SymmetricSecurityKey( Encoding.UTF8.GetBytes(config["Token:Key"])),
                            ValidateIssuer = true,
                            ValidIssuer = config["Token:Issuer"],
                            ValidateAudience= false,
                        };
                    });
            services.AddAuthorization();

            return services;
        }
    }
}
