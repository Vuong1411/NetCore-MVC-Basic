using Classwork.Models;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Classwork.Areas.Admin.Models
{
    public class ManageProductVM
    {
        public Product Product { get; set; } = new Product();
        public List<IFormFile> Images { get; set; } = new List<IFormFile>();
        public List<SelectListItem> CategorySelectList { get; set; } = new List<SelectListItem>();

    }
}
