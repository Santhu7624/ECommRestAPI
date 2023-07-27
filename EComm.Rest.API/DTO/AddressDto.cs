using System.ComponentModel.DataAnnotations;

namespace EComm.Rest.API.DTO
{
    public class AddressDto
    {
        [Required]
        public string FirstName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        public string Street { get; set; }

        [Required]
        public string City { get; set; }

        [Required]
        public String State { get; set; }

        [Required]
        public string Zipcode { get; set; }
    }
}
