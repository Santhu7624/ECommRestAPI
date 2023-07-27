using EComm.Model.Entities.OrderAggregate;
using EComm.Model.Interfaces;
using EComm.Model.Specifications;
using EComm.Rest.API.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EComm.DataAccess.Services
{
    public class OrderService : IOrderService
    {
        
        private readonly IBasketRepository _basketRepo;
        private readonly IUnitOfWork _unitOfWork;

        public OrderService( IBasketRepository basketRepo, IUnitOfWork unitOfWork)
        {
            
            _basketRepo = basketRepo;
            _unitOfWork = unitOfWork;
        }

        public async Task<Order> CreateOrderAsync(string buyerEmail, int deliveryMethodId, string basketId, Address shippingAddress)
        {
            // get basket from the basket repo
            var basket = await _basketRepo.GetBasketAsync(basketId);
            
            // get items from product repo
            var items = new List<OrderItem>();
            if (basket != null && basket.Items.Count>0)
            {
                foreach (var item in basket.Items)
                {
                    var productItem = await _unitOfWork.Repository<Product>().GetByIdAsync(item.Id);
                    if (productItem == null) 
                        return null;
                    var itemOrdered = new ProductItemOrdered(productItem.Id, productItem.Name, productItem.PictureUrl);
                    var orderItem = new OrderItem(itemOrdered, productItem.Price, item.Quantity);
                    items.Add(orderItem);
                } 
            }
            
            // get delivery method from repo
            var deliveryMethod = await _unitOfWork.Repository<DeliveryMethod>().GetByIdAsync(deliveryMethodId);
            
            // calc subtotal 
            var subTotal = items.Sum(item => item.Price * item.Quantity);
            
            // create order
            var order = new Order(items,buyerEmail,shippingAddress,deliveryMethod,subTotal);
            
            // save to db
            _unitOfWork.Repository<Order>().Add(order);
            var result = await _unitOfWork.Complete();
            if (result <= 0) return null;

            // delete basket item
            await _basketRepo.DeleteAsync(basketId);

            // return order
            return order;
        }

        public async Task<IReadOnlyList<DeliveryMethod>> GetDeliveryMethodAsync()
        {
            return await _unitOfWork.Repository<DeliveryMethod>().ListAllAsync();
        }

        public async Task<Order> GetOrderByIdAsync(int id, string buyerEmail)
        {
            var spec = new OrderWithItemsAndOrderingSpecification(id, buyerEmail);

            return await _unitOfWork.Repository<Order>().GetEntityWithSpec(spec);
        }

        public async Task<IReadOnlyList<Order>> GetOrderForUserAsync(string buyerEmail)
        {
            var spec = new OrderWithItemsAndOrderingSpecification(buyerEmail);

            return await _unitOfWork.Repository<Order>().ListAsync(spec);
        }
    }
}
