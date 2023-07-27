using System.Security.Claims;

namespace EComm.Rest.API.Extensions
{
    public static class ClaimsPrincipleExtensions
    {
        public static string GetEmailfromClaimPrinciple(this ClaimsPrincipal user)
        {
            var email = user?.Claims?.FirstOrDefault(x => x.Type == ClaimTypes.Email)?.Value;
            return email;
        }
    }
}
