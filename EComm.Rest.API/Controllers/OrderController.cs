using EComm.Model.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using EComm.Model.Entities.OrderAggregate;
using AutoMapper;
using EComm.Rest.API.DTO;
using System.Security.Claims;
using EComm.Rest.API.Extensions;
using EComm.Rest.API.Errors;
using Microsoft.AspNetCore.Authorization;

namespace EComm.Rest.API.Controllers
{

    [Authorize]
    public class OrderController : BaseApiController
    {
        private readonly IOrderService _orderService;
        private readonly IMapper _mapper;

        public OrderController(IOrderService orderService, IMapper mapper)
        {
            _orderService = orderService;
            _mapper = mapper;
        }

        [HttpPost]
        public async Task<ActionResult<Order>> CreateOrder(OrderDto orderDto)
        {
            var email = HttpContext.User.GetEmailfromClaimPrinciple();

            var address = _mapper.Map<AddressDto, Address>(orderDto.ShipToAddress);

            var order = await _orderService.CreateOrderAsync(email, orderDto.DeliveryMethodId, orderDto.BasketId, address);

            if (order == null)
                return BadRequest(new APIResponse(400, "Order creation failed"));
            
            return Ok(order);
        }

        [HttpGet]
        //[Authorize]
        public async Task<ActionResult<IReadOnlyList<OrderDto>>> GetOrdersForUser()
        {
            var email = User.GetEmailfromClaimPrinciple();

            var orders = await _orderService.GetOrderForUserAsync(email);

            return Ok(_mapper.Map<IReadOnlyList<OrderToReturnDto>>(orders));
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<OrderToReturnDto>> GetOrderByIdForUser(int id)
        {
            var email = User.GetEmailfromClaimPrinciple();

            var order = await _orderService.GetOrderByIdAsync(id, email);

            if (order == null) return NotFound(new APIResponse(404));

            return _mapper.Map<OrderToReturnDto>(order);
        }

        [HttpGet("deliveryMethods")]
        public async Task<ActionResult<IReadOnlyList<DeliveryMethod>>> GetDeliveryMethods()
        {
            return Ok(await _orderService.GetDeliveryMethodAsync());
        }
    }
}
