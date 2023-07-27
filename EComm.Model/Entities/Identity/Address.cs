using System.ComponentModel.DataAnnotations;
using System.Globalization;

namespace EComm.Model.Entities.Identity
{
    public class Address
    {
        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Street { get; set; }

        public string City { get; set; }

        public String State { get; set; }

        public string ZipCode { get; set; }



        [Required]
        public string AppUserId { get; set; }

        public AppUser AppUser { get; set; }
    }
}