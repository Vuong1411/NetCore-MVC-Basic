using Microsoft.AspNetCore.Identity;

namespace Classwork.Models
{
    public class AppUser : IdentityUser
    {
        public string FullName { get; set; } = null!;
    }
}
