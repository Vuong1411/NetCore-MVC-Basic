using Microsoft.AspNetCore.Mvc;

using Classwork.Services;
using Classwork.ViewModels;

namespace Classwork.Views.Shared.Components.ProductCarousel
{
    public class ProductCarousel : ViewComponent
    {
        private readonly ILogger<ProductCarousel> _logger;
        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;

        public ProductCarousel(ILogger<ProductCarousel> logger, IProductService productService, ICategoryService categoryService)
        {
            _logger = logger;
            _productService = productService;
            _categoryService = categoryService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var products = await _productService.GetProductsAsync();
            var categories = await _categoryService.GetCategoriesAsync();
            try
            {
                var productVMs = from p in products
                                 join c in categories on p.CategoryId equals c.CategoryId
                                 select new ProductVM
                                 {
                                     Id = p.ProductId,
                                     CategoryId = p.CategoryId,
                                     Name = p.Name,
                                     CategoryName = c.CategoryName ?? "Unknown",
                                     Description = p.Description ?? "Không có mô tả",
                                     Price = p.Price,
                                     ImageUrlList = p.ImageUrlList
                                 };
                return View(productVMs);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi tìm kiếm sản phẩm");
                return View("ErrorViewComponent");
            }
        }
    }
}
