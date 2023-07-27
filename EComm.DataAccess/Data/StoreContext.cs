
using System.Reflection;
using EComm.Model.Entities.OrderAggregate;
using EComm.Rest.API.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace EComm.Rest.API.Data
{
    //public class StoreContext : DbContext
    public class StoreContext : DbContext
    {
        public StoreContext(DbContextOptions<StoreContext> options) : base(options)
        {

        }
        
        //public StoreContext() : base()
        //{
        //}

        public DbSet<Product> Products {get;set;}

        public DbSet<ProductBrand> ProductBrands {get;set;}

        public DbSet<ProductType> ProductTypes {get;set;}

        public DbSet<Order> Orders { get; set; }

        public DbSet<OrderItem> OrderItems { get; set; }

        public DbSet<DeliveryMethod> DeliveryMethods { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder){

            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

            if(Database.ProviderName == "Microsoft.EntityFrameworkCore.SqlServer")
            {
                foreach(var entityType in modelBuilder.Model.GetEntityTypes())
                {
                    var properties = entityType.ClrType.GetProperties()
                                                .Where(p => p.PropertyType == typeof(decimal));
                    var dateTimeProperties = entityType.ClrType.GetProperties()
                        .Where(p => p.PropertyType == typeof(DateTimeOffset));
                    foreach (var property in properties)
                    {
                        modelBuilder.Entity(entityType.Name)
                                    .Property(property.Name)
                                    .HasConversion<double>();

                        //modelBuilder.Entity<Order>()
                        //            .Property(p => p.Subtotal)
                        //            .HasColumnType("decimal(18,2)");
                    }
                    foreach (var property in dateTimeProperties)
                    {
                        modelBuilder.Entity(entityType.Name).Property(property.Name)
                            .HasConversion(new DateTimeOffsetToBinaryConverter());
                    }
                } 
            }

        }
    }
}