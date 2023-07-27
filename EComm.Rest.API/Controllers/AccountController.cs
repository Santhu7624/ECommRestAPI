using AutoMapper;
using EComm.Model.Entities.Identity;
using EComm.Model.Interfaces;
using EComm.Rest.API.DTO;
using EComm.Rest.API.Errors;
using EComm.Rest.API.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EComm.Rest.API.Controllers
{
    //[Route("api/[controller]")]
    //[ApiController]
    public class AccountController : BaseApiController
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly ITokenService _tokenService;
        private readonly IMapper _mapper;

        public AccountController(UserManager<AppUser> userManager, 
            SignInManager<AppUser> signInManager, 
            ITokenService tokenService,
            IMapper mapper) 
        { 
            _userManager= userManager;
            _signInManager= signInManager;
            _tokenService= tokenService;
            _mapper = mapper;
        }


        [HttpPost("login")]

        public async Task<ActionResult<UserDto>> Login(LoginDto loginDto)
        {
            var user = await _userManager.FindByEmailAsync(loginDto.Email);
            if (user == null) { return Unauthorized(new APIResponse(401)); }
           
            var result = await _signInManager.CheckPasswordSignInAsync(user, loginDto.Password,false);
            if (!result.Succeeded) return Unauthorized(new APIResponse(401));

            return new UserDto
            {
                Email = loginDto.Email,
                Token = _tokenService.GenerateToken(user),
                DisplayName = user.DisplayName
            };
        }

        [HttpPost("register")]
        public async Task<ActionResult<UserDto>> Register(RegisterDto registerDto)
        {
            if (CheckEmailExistsAsync(registerDto.Email).Result.Value)
            {
                return new BadRequestObjectResult(new APIValidationResponse
                {
                    Errors = new[] { "Entered email in use" }
                });
            }
            var user = new AppUser
            {
                Email = registerDto.Email,
                DisplayName = registerDto.DisplayName,
                UserName = registerDto.Email
            };

            var result = await _userManager.CreateAsync(user, registerDto.Password);

            if (!result.Succeeded) return BadRequest(new APIResponse(400));

            return new UserDto {
                Email = user.Email,
                Token = _tokenService.GenerateToken(user),
                DisplayName = user.DisplayName
            };
        }

        [Authorize]
        [HttpGet]
        
        public async Task<ActionResult<UserDto>> GetCurrentUser()
        {
            //var email = HttpContext.User?.Claims?.FirstOrDefault(x => x.Type == ClaimTypes.Email)?.Value;

            var user = await _userManager.FindEmailByClaimsPrinciple(User);

            return new UserDto
            {
                Email = user.Email,
                Token = _tokenService.GenerateToken(user),
                DisplayName = user.DisplayName
            };
        }

        [HttpGet("emailexists")]
        public async Task<ActionResult<bool>> CheckEmailExistsAsync([FromQuery] string email)
        {
            return await _userManager.FindByEmailAsync(email) != null;
        }

        [Authorize]
        [HttpGet("address")]
        
        public async Task<ActionResult<AddressDto>> GetUserAddress()
        {
            //var email = HttpContext.User?.Claims?.FirstOrDefault(x => x.Type == ClaimTypes.Email)?.Value;

            try
            {
                var user = await _userManager.FindUserByClaimsWithAddress(User);
                if (User == null)
                    return BadRequest(new APIResponse(400, "User dont have address"));

                return _mapper.Map<Address, AddressDto>(user.Address);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [Authorize]
        [HttpPut("address")]
        public async Task<ActionResult<AddressDto>> UpdateUserAddress(AddressDto addressDto)
        {
            var user = await _userManager.FindUserByClaimsWithAddress(HttpContext.User);

            user.Address = _mapper.Map<AddressDto, Address>(addressDto);

            var result = await _userManager.UpdateAsync(user);

            if(result.Succeeded)
            {
                return Ok(_mapper.Map<Address,AddressDto>(user.Address));
            }

            return BadRequest("Problem updating user");
        }
    }
}
