using Microsoft.EntityFrameworkCore;

using Classwork.Models;
using Classwork.Services;
using Microsoft.AspNetCore.Identity;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<TechStoreContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("TechStore"));
});

builder.Services.AddIdentity<AppUser, IdentityRole>(option =>
{
    option.SignIn.RequireConfirmedEmail = false;
})
.AddDefaultUI()
.AddEntityFrameworkStores<TechStoreContext>()
.AddDefaultTokenProviders();
 
builder.Services.AddRazorPages();


builder.Services.AddScoped<IProductService, ProductService>();
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddScoped<IImageService, ImageService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();
app.MapControllerRoute(
    name: "areas",
    pattern: "{area:exists}/{controller=Dashboard}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
