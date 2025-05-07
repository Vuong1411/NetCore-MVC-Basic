# 🔐 Hướng dẫn Cấu hình ASP.NET Core Identity

## 1. 📦 Cài đặt Packages

Cần cài đặt các NuGet packages sau:
```
Microsoft.AspNetCore.Identity.EntityFrameworkCore
Microsoft.AspNetCore.Identity.UI
MailKit (Nếu muốn xác thực bằng email)
Microsoft.AspNetCore.Authentication.Facebook (Nếu muốn xác thực bằng facebook)
Microsoft.AspNetCore.Authentication.Google (Nếu muốn xác thực bằng google)
```

## 2. 🗃️ Cấu hình DbContext

### 2.1. 📝 Sửa DbContext
```csharp
// Thay đổi kế thừa từ DbContext sang IdentityDbContext<AppUser>
public class TechStoreContext : IdentityDbContext<AppUser>
{
    public TechStoreContext(DbContextOptions<TechStoreContext> options)
        : base(options)
    {
    }

    // Gọi phương thức cơ sở của Identity trong OnModelCreating
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder); // Quan trọng! Phải gọi phương thức này

        // Cấu hình các entity khác của bạn ở đây
    }
}
```

## 3. 🔄 Tạo và Áp dụng Migration

### 3.1. 📥 Tạo Migration cho Identity
Chạy lệnh sau trong Terminal:
```bash
dotnet ef migrations add InitIdentity
```

### 3.2. ⚠️ Xử lý Conflict (Nếu dùng Database First)
Nếu bạn đang sử dụng Database First và gặp các bảng trùng lặp, cần xóa các bảng cũ (nếu có).

### 3.3. 📤 Update Database
Chạy lệnh sau để áp dụng các thay đổi lên database:
```bash
dotnet ef database update
```

## 4. ⚙️ Cấu hình trong Program.cs

### 4.1. 🔧 Cấu hình Identity Core
```csharp
builder.Services.AddIdentity<AppUser, IdentityRole>(options =>
{
    options.SignIn.RequireConfirmedAccount = true;
    options.SignIn.RequireConfirmedEmail = true;
})
.AddDefaultUI()
.AddEntityFrameworkStores<TechStoreContext>()
.AddDefaultTokenProviders();
```

### 4.2. 🔑 Cấu hình xác thực bên thứ ba (Google, Facebook)
```csharp
builder.Services.AddAuthentication()
    .AddGoogle(googleOptions =>
    {
        googleOptions.ClientId = builder.Configuration["Authentication:Google:ClientId"]!;
        googleOptions.ClientSecret = builder.Configuration["Authentication:Google:ClientSecret"]!;
    })
    .AddFacebook(facebookOptions =>
    {
        facebookOptions.AppId = builder.Configuration["Authentication:Facebook:AppId"]!;
        facebookOptions.AppSecret = builder.Configuration["Authentication:Facebook:AppSecret"]!;
    });
```

### 4.3. 🛡️ Enable Authentication và Authorization
```csharp
app.UseAuthentication();
app.UseAuthorization();
```

## 5. 📄 Cấu hình trong appsettings.json

### 5.1. 🔌 Cấu hình xác thực Google và Facebook
```json
{
  "Authentication": {
    "Google": {
      "ClientId": "your-google-client-id",
      "ClientSecret": "your-google-client-secret"
    },
    "Facebook": {
      "AppId": "your-facebook-app-id",
      "AppSecret": "your-facebook-app-secret"
    }
  }
}
```

### 5.2. 📧 Cấu hình Email (cho xác nhận tài khoản)
```json
{
  "EmailSettings": {
    "SmtpServer": "smtp.gmail.com",
    "SmtpPort": 587,
    "FromName": "YourAppName",
    "FromEmail": "your-email@gmail.com",
    "Password": "your-app-password"
  }
}
```

## 6. 📨 Cấu hình Email Service

### 6.1. 📮 Đăng ký dịch vụ Email
```csharp
builder.Services.Configure<EmailSettings>(builder.Configuration.GetSection("EmailSettings"));
builder.Services.AddTransient<IEmailSender, EmailSenderService>();
```

## 7. ⭐ Tính năng bổ sung

### 7.1. ✉️ Yêu cầu xác nhận email
```csharp
options.SignIn.RequireConfirmedEmail = true;
```

### 7.2. ✅ Yêu cầu xác nhận tài khoản
```csharp
options.SignIn.RequireConfirmedAccount = true;
```

## 8. ❗ Các lưu ý quan trọng

1. 🔗 Đảm bảo đã cấu hình đúng connection string cho database
2. 🔄 Thực hiện migration cho Identity tables
3. 🛡️ Cấu hình và kiểm tra kỹ các thiết lập bảo mật
4. ✅ Test kỹ chức năng xác thực và đăng nhập trước khi deploy
5. 🔒 Đảm bảo sử dụng HTTPS cho các endpoints liên quan đến authentication

## 9. 🔍 Checklist triển khai

- [ ] 📦 Đã cài đặt đầy đủ các packages
- [ ] 🗃️ Đã sửa DbContext để kế thừa IdentityDbContext
- [ ] 📝 Đã gọi base.OnModelCreating trong DbContext
- [ ] 🔄 Đã tạo migration cho Identity
- [ ] ⚠️ Đã xử lý các bảng trùng lặp (nếu có)
- [ ] 📤 Đã update database thành công
- [ ] ⚙️ Đã cấu hình Identity trong Program.cs
- [ ] 🔑 Đã thiết lập các keys cho authentication providers
- [ ] 📧 Đã cấu hình email service
- [ ] 🔒 Đã kiểm tra các vấn đề bảo mật
- [ ] ✅ Đã test toàn bộ quy trình đăng ký/đăng nhập
- [ ] 🛡️ Đã bật HTTPS

_Last updated: 2025-04-22 14:02:38 UTC by @Vuong1411_
