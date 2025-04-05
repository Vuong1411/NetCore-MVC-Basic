using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Classwork.Models;
using Classwork.ViewModels;
using Classwork.Services;

namespace Classwork.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class CategoryController : Controller
    {
        private readonly ILogger<CategoryController> _logger;
        private readonly ICategoryService _categoryService;

        public CategoryController(ILogger<CategoryController> logger, CategoryService categoryService)
        {
            _logger = logger;
            _categoryService = categoryService;
        }

        public async Task<IActionResult> IndexAsync()
        {
            try
            {
                var categories = await _categoryService.GetCategoriesAsync();
                var productCount = await _categoryService.GetProductCountByCategoryAsync();
                var viewModel = from c in categories
                                  select new CategoryVM
                                  {
                                      Id = c.CategoryId,
                                      Name = c.CategoryName,
                                      Quantity = productCount.ContainsKey(c.CategoryId) ? productCount[c.CategoryId] : 0
                                  };
                return View(viewModel);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi lấy danh sách danh mục");
                return View("Error");
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateAsync(Category category)
        {
            if(!ModelState.IsValid)return View(category);

            try
            {
                TempData["Message"] = await _categoryService.AddCategoryAsync(category)
                     ? $"Thêm danh mục '{category.CategoryName}' thành công!"
                     : $"Danh mục '{category.CategoryName}' đã tồn tại!";
            } 
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi thêm danh mục!");
                return View("Error");
            }

            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditAsync(Category category)
        {
            if (!ModelState.IsValid) return View(category);

            try
            {
                TempData["Message"] = await _categoryService.UpdateCategoryAsync(category)
                    ? $"Cập nhật danh mục '{category.CategoryName}' thành công!"
                    : $"Danh mục '{category.CategoryName}' đã tồn tại!";
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi cập nhật danh mục!");
                return View("Error");
            }
            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteAsync(int id)
        {
            try
            {
                var category = await _categoryService.GetCategoryByIdAsync(id);
                if (category != null)
                {
                    TempData["Message"] = await _categoryService.DeleteCategoryAsync(id)
                    ? $"Xóa danh mục '{category.CategoryName}' thành công!"
                    : $"Danh mục '{category.CategoryName}' không tồn tại!";
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi khi xóa danh mục!");
                return View("Error");
            }
            return RedirectToAction(nameof(Index));
        }





    }
}
