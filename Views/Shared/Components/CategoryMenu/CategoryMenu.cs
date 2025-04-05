using Microsoft.AspNetCore.Mvc;

using Classwork.Services;
using Classwork.ViewModels;

namespace Classwork.Views.Shared.Components.CategoryMenu
{
    public class CategoryMenu : ViewComponent
    {
        private readonly CategoryService _categoryService;

        public CategoryMenu(CategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var categories = await _categoryService.GetCategoriesAsync();
            var productCount = await _categoryService.GetProductCountByCategoryAsync();
            var viewModel = categories.Select(c => new CategoryVM
            {
                Id = c.CategoryId,
                Name = c.CategoryName,
                Quantity = productCount.ContainsKey(c.CategoryId) ? productCount[c.CategoryId] : 0
            }).ToList();
            return View(viewModel);
        }


    }
}
