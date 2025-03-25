using EComm.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EComm.Model.Interfaces
{
    public interface IPaymentInterface
    {
        Task<CustomerBasket> CreateOrUpdatePaymentIntent(string basketId);
    }
}
