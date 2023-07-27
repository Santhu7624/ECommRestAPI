using AutoMapper;
using EComm.Model.Entities;
using EComm.Model.Interfaces;
using EComm.Rest.API.DTO;
using EComm.Rest.API.Helper;
using Microsoft.AspNetCore.Mvc;

namespace EComm.Rest.API.Controllers
{
    public class BasketController : BaseApiController
    {
        private readonly IBasketRepository _basketRepository;

        private readonly IMapper _mapper;

        public BasketController(IBasketRepository basketRepository, IMapper mapper)
        {
            _basketRepository= basketRepository;
            _mapper = mapper;
        }

        [HttpGet]

        public async Task<ActionResult> GetBasketById(string id)
        {
            var basket = await _basketRepository.GetBasketAsync(id);

            return Ok(basket ?? new Model.Entities.CustomerBasket(id));
        }

        [HttpPost]

        public async Task<ActionResult<CustomerBasket>> UpdateBasket(CustomerBasketDto customerBasket)
        {
            var basketItems = _mapper.Map<CustomerBasketDto, CustomerBasket>(customerBasket);
            
            var updateBasket = await _basketRepository.UpdateAsync(basketItems);

            return Ok(updateBasket);
        }

        [HttpDelete]

        public async Task DeleteBasket(string id)
        {
            await _basketRepository.DeleteAsync(id);
        }
    }
}
