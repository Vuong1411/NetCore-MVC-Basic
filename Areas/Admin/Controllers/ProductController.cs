using Microsoft.AspNetCore.Mvc;

using Classwork.Models;
using Classwork.ViewModels;
using Classwork.Services;

using Classwork.Areas.Admin.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Authorization;

namespace Classwork.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "admin")]
    public class ProductController : Controller
    {
        private readonly ILogger<ProductController> _logger;
        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;
        private readonly IImageService _imageService;

        public ProductController(ILogger<ProductController> logger, IProductService productService, ICategoryService categoryService, IImageService imageService)
        {
            _logger = logger;
            _productService = productService;
            _categoryService = categoryService;
            _imageService = imageService;
        }

        public async Task<IActionResult> IndexAsync()
        {
            try
            {
                var products = await _productService.GetProductsAsync();
                var categories = await _categoryService.GetCategoriesAsync();
                var viewModel = from p in products
                                 join c in categories on p.CategoryId equals c.CategoryId
                                 select new ProductVM
                                 {
                                     Id = p.ProductId,
                                     CategoryId = p.CategoryId,
                                     Name = p.Name,
                                     Stock = p.Stock,
                                     Price = p.Price,
                                     CategoryName = c.CategoryName ?? "Unknown",
                                     Description = p.Description ?? "Không có mô tả",
                                     ImageUrlList = p.ImageUrlList
                                 };
                return View(viewModel);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi lấy danh sách sản phẩm");
                return View("Error");
            }
        }

        private async Task<List<SelectListItem>> LoadCategoryListAsync()
        {
            var categories = await _categoryService.GetCategoriesAsync();
            return categories.Select(c => new SelectListItem(c.CategoryName, c.CategoryId.ToString())).ToList();
        }

        public async Task<IActionResult> CreateAsync()
        {
            var viewModel = new ManageProductVM
            {
                CategorySelectList = await LoadCategoryListAsync(),
            };
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateAsync(ManageProductVM model)
        {
            if (!ModelState.IsValid)
            {
                model.CategorySelectList = await LoadCategoryListAsync();
                return View(model);
            }
            try
            {
                Product product = model.Product;
                product.ImageUrlList = _imageService.ValidateAndSaveImages(model.Images, "products");
                if(!product.ImageUrlList.Any())
                {
                    throw new InvalidOperationException("Vui lòng chọn ít nhất 1 hình ảnh!");
                }

                TempData["Message"] = await _productService.AddProductAsync(product)
                    ? $"Thêm sản phẩm '{product.Name}' thành công!"
                    : $"Sản phẩm '{product.Name}' đã tồn tại!";
            }
            catch (InvalidOperationException ex)
            {
                ModelState.AddModelError(string.Empty, ex.Message);
                model.CategorySelectList = await LoadCategoryListAsync();
                return View(model);
            }

            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> EditAsync(int id)
        {
            var product = await _productService.GetProductByIdAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            var viewModel = new ManageProductVM
            {
                Product = product,
                CategorySelectList = await LoadCategoryListAsync(),
            };
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditAsync(ManageProductVM model)
        {
            if (!ModelState.IsValid)
            {
                model.CategorySelectList = await LoadCategoryListAsync();
                return View(model);
            }
            try
            {
                var product = await _productService.GetProductByIdAsync(model.Product.ProductId);
                if (product != null)
                {
                    var imgDel = _imageService.DeleteImages(product.ImageUrlList, "products");
                    Console.WriteLine($"Đã xóa {imgDel} ảnh cũ của sản phẩm {product.Name}");
                }
                model.Product.ImageUrlList = _imageService.ValidateAndSaveImages(model.Images, "products");
                if (!model.Product.ImageUrlList.Any())
                {
                    throw new InvalidOperationException("Vui lòng chọn ít nhất 1 hình ảnh!");
                }
                TempData["Message"] = await _productService.UpdateProductAsync(model.Product)
                    ? $"Cập nhật sản phẩm '{model.Product.Name}' thành công!"
                    : $"Cập nhật sản phẩm '{model.Product.Name}' thất bại!";
            }
            catch (InvalidOperationException ex)
            {
                ModelState.AddModelError(string.Empty, ex.Message);
                model.CategorySelectList = await LoadCategoryListAsync();
                return View(model);
            }

            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteAsync(int id)
        {
            try
            {
                var product = await _productService.GetProductByIdAsync(id);
                if (product != null)
                {
                    var imgDel = _imageService.DeleteImages(product.ImageUrlList, "products");
                    Console.WriteLine($"Đã xóa {imgDel} ảnh cũ của sản phẩm {product.Name}");

                    TempData["Message"] = await _productService.DeleteProductAsync(id)
                    ? $"Xóa sản phẩm '{product.Name}' thành công!"
                    : $"Sản phẩm '{product.Name}' không tồn tại!";
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi xóa sản phẩm");
                return View("Error");
            }
            return RedirectToAction(nameof(Index));
        }




    }
}
