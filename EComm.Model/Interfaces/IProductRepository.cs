using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EComm.Rest.API.Entities;

namespace EComm.Model.Interfaces
{
    public interface IProductRepository
    {
        Task<Product> GetProductAsync(int id);

        Task<IReadOnlyList<Product>> GetProductsAsync();
        Task<IReadOnlyList<ProductBrand>> GetProductBrandsAsync();

        Task<IReadOnlyList<ProductType>> GetProductTypessAsync();
    }
}