using Microsoft.AspNetCore.Mvc;

namespace Classwork.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult SendMessage(string fullname, string email, string message)
        {
            // Here you would typically send the message to an email or save it to a database
            // For this example, we'll just return a success message
            TempData["Message"] = $"Chào <strong>{fullname}</strong>, chúng tôi đã nhận được thông tin của bạn. Chúng tôi sẽ phản hồi qua email <strong>{email}</strong> trong thời gian sớm nhất!";
            return View("Index");
        }
    }
}
