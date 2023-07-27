using EComm.Model.Entities.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EComm.Model.Interfaces
{
    public interface ITokenService
    {
        string GenerateToken(AppUser user);
    }
}
