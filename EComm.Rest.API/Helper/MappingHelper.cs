using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using EComm.Model.Entities;
using EComm.Model.Entities.Identity;
using EComm.Model.Entities.OrderAggregate;
using EComm.Rest.API.DTO;
using EComm.Rest.API.Entities;

namespace EComm.Rest.API.Helper
{
    public class MappingHelper : Profile
    {
        public MappingHelper()
        {
            //SourceMemberNamingConvention = LowerUnderscoreNamingConvention.Instance;
            //DestinationMemberNamingConvention = PascalCaseNamingConvention.Instance;
            
            /*  
             *  CreateMap<SourceObj, DestinationObj>());
             */

            CreateMap<Product, ProductResponseModel>()
                    .ForMember(dest => dest.ProductBrand, opt => opt.MapFrom(source => source.ProductBrand.Name))
                    .ForMember(dest => dest.ProductType, opt => opt.MapFrom(source => source.ProductType.Name))
                    .ForMember(dest => dest.PictureUrl, opt => opt.MapFrom<ProductUrlResolver>());
            
            CreateMap<EComm.Model.Entities.Identity.Address, AddressDto>().ReverseMap();

            CreateMap<AddressDto, EComm.Model.Entities.OrderAggregate.Address>();

            CreateMap<BasketItemDto, BasketItem>();

            CreateMap<CustomerBasketDto, CustomerBasket>();

            CreateMap<Order, OrderToReturnDto>()
                .ForMember(d => d.DeliveryMethod, o => o.MapFrom(s => s.DeliveryMethod.ShortName))
                .ForMember(d => d.ShippingPrice, o => o.MapFrom(s => s.DeliveryMethod.Price));
            
            CreateMap<OrderItem, OrderItemDto>()
                .ForMember(d => d.ProductId, o => o.MapFrom(s => s.ItemOrdered.ProductItemId))
                .ForMember(d => d.ProductName, o => o.MapFrom(s => s.ItemOrdered.ProductName))
                .ForMember(d => d.PictureUrl, o => o.MapFrom(s => s.ItemOrdered.PictureUrl))
                .ForMember(d => d.PictureUrl, o => o.MapFrom<OrderItemUrlResolver>());
        }
    }
}