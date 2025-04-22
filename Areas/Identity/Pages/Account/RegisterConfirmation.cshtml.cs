// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Classwork.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using System.Text.Encodings.Web;

namespace Classwork.Areas.Identity.Pages.Account
{
    [AllowAnonymous]
    public class RegisterConfirmationModel : PageModel
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly IEmailSender _emailSender;

        public RegisterConfirmationModel(UserManager<AppUser> userManager, IEmailSender sender)
        {
            _userManager = userManager;
            _emailSender = sender;
        }

        [BindProperty]
        public string Email { get; set; }
        public bool DisplayConfirmAccountLink { get; set; }
        public string EmailConfirmationUrl { get; set; }

        public bool IsExternalLogin { get; set; }

        public async Task<IActionResult> OnGetAsync(string email)
        {
            Email = email;

            // Tìm người dùng theo email
            var user = await _userManager.FindByEmailAsync(email);
            if (user != null)
            {
                // Kiểm tra nếu người dùng đăng nhập qua nhà cung cấp bên ngoài (Google/Facebook)
                var logins = await _userManager.GetLoginsAsync(user);
                IsExternalLogin = logins.Any(login => login.LoginProvider == "Google" || login.LoginProvider == "Facebook");

                // Nếu là đăng nhập qua nhà cung cấp bên ngoài, chuyển hướng đến trang đăng nhập
                if (IsExternalLogin)
                {
                    TempData["Message"] = "Bạn đã đăng ký thành công bằng Google hoặc Facebook. Vui lòng đăng nhập.";
                    return RedirectToPage("./Login");
                }
            }

            // Nếu không phải đăng nhập qua nhà cung cấp bên ngoài, bỏ qua xác thực email và chuyển hướng đến trang đăng nhập
            TempData["Message"] = "Tài khoản của bạn đã được tạo thành công. Vui lòng đăng nhập.";
            return RedirectToPage("./Login");
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (string.IsNullOrEmpty(Email))
            {
                return Page();
            }

            var user = await _userManager.FindByEmailAsync(Email);
            if (user == null)
            {
                return NotFound("Không tìm thấy người dùng.");
            }

            var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
            code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
            var callbackUrl = Url.Page(
                "/Account/ConfirmEmail",
                pageHandler: null,
                values: new { area = "Identity", userId = user.Id, code = code },
                protocol: Request.Scheme);

            await _emailSender.SendEmailAsync(
                Email,
                "Xác thực email",
                $"Vui lòng xác thực tài khoản của bạn <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>tại đây</a>.");

            TempData["Message"] = "Email xác nhận đã được gửi lại. Vui lòng kiểm tra hộp thư của bạn.";
            return RedirectToPage();
        }
    }
}
