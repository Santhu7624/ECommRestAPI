﻿using EComm.Model.Entities.OrderAggregate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EComm.Model.Specifications
{
    public class OrderWithItemsAndOrderingSpecification : BaseSpecification<Order>
    {
        public OrderWithItemsAndOrderingSpecification(string email) : base(o => o.BuyerEmail == email)
        {
            AddInclude(o => o.OrderItems);
            AddInclude(o => o.DeliveryMethod);
            AddOrderByDescending(o => o.OrderDate);
        }

        public OrderWithItemsAndOrderingSpecification(int id, string email)
            : base(o => o.Id == id && o.BuyerEmail == email)
        {
            AddInclude(o => o.OrderItems);
            AddInclude(o => o.DeliveryMethod);
        }
    }
}
