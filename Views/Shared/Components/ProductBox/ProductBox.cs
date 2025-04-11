using Classwork.Services;
using Classwork.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Classwork.Views.Shared.Components.ProductBox
{
    public class ProductBox : ViewComponent
    {
        private readonly ILogger<ProductBox> _logger;
        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;

        public ProductBox(ILogger<ProductBox> logger, IProductService productService, ICategoryService categoryService)
        {
            _logger = logger;
            _productService = productService;
            _categoryService = categoryService;
        }

        public async Task<IViewComponentResult> InvokeAsync(string keywords, int pageNumber = 1, int pageSize = 9)
        {
            //var products = await _productService.GetProductsAsync(keywords);
            var (products, totalCount) = await _productService.GetProductsAsync(keywords, pageNumber, pageSize);
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
                    PageNumber = pageNumber,
                    PageSize = pageSize,
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi tìm kiếm sản phẩm với từ khóa: {Keywords}", keywords);
                return View("ErrorViewComponent");
            }
        }
    }
}
