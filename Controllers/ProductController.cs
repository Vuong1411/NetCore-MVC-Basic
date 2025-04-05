using Microsoft.AspNetCore.Mvc;

using Classwork.Models;
using Classwork.ViewModels;
using Classwork.Services;

namespace Classwork.Controllers
{
    public class ProductController : Controller
    {
        private readonly ILogger<ProductController> _logger;
        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;

        public ProductController(ILogger<ProductController> logger, ProductService productService, CategoryService categoryService)
        {
            _logger = logger;
            _productService = productService;
            _categoryService = categoryService;
        }

        public async Task<IActionResult> Index(string? keywords, int page = 1, int pageSize = 6)
        {
            var (products, totalCount) = await _productService.GetProductsAsync(keywords, page, pageSize);
            var categories = await _categoryService.GetCategoriesAsync();
            try
            {
                var productVMs = from p in products
                                 join c in categories on p.CategoryId equals c.CategoryId
                                 select new ProductVM
                                 {
                                     Id = p.ProductId,
                                     Name = p.Name,
                                     Description = p.Description,
                                     Price = p.Price,
                                     ImageUrlList = p.ImageUrlList,
                                     CategoryName = c.CategoryName ?? "Unknown"
                                 };
                return View(new PaginatedVM<ProductVM>
                {
                    Items = productVMs,
                    TotalItems = totalCount,
                    PageNumber = page,
                    PageSize = pageSize,
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi tìm kiếm sản phẩm với từ khóa: {Keywords}", keywords);
                return View("Error");
            }
        }

        public async Task<IActionResult> Detail(int id)
        {
            var product = await _productService.GetProductByIdAsync(id);
            if (product == null)
            {
                return View("Error");
            }
            var category = await _categoryService.GetCategoryByIdAsync(product.CategoryId);
            var productVM = new ProductVM
            {
                Id = product.ProductId,
                Name = product.Name,
                Description = product.Description,
                Price = product.Price,
                Stock = product.Stock,
                ImageUrlList = product.ImageUrlList,
                CategoryId = product.CategoryId,
                CategoryName = category?.CategoryName ?? "Unknown"
            };
            return View(productVM);
        }

    }
}
