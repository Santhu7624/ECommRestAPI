using EComm.Model.Entities;
using System.ComponentModel.DataAnnotations;

namespace EComm.Rest.API.DTO
{
    public class CustomerBasketDto
    {
        [Required]
        public string Id { get; set; }

        public List<BasketItemDto> Items { get; set; }
    }
}
