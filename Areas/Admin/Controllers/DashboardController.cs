using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Classwork.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class DashboardController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
