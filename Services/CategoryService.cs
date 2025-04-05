using Classwork.Models;
using Microsoft.EntityFrameworkCore;


namespace Classwork.Services
{
    public interface ICategoryService
    {
        #region Async Methods
        /// <summary>
        /// Lấy danh sách danh mục (Async)
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<Category>> GetCategoriesAsync();

        /// <summary>
        /// Lấy thông tin danh mục theo ID (Async)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<Category?> GetCategoryByIdAsync(int id);

        /// <summary>
        /// Lấy số lượng sản phẩm theo danh mục (Async)
        /// </summary>
        /// <returns></returns>
        Task<Dictionary<int, int>> GetProductCountByCategoryAsync();

        /// <summary>
        /// Thêm danh mục (Async)
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        Task<bool> AddCategoryAsync(Category category);

        /// <summary>
        /// Cập nhật thông tin danh mục (Async)
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        Task<bool> UpdateCategoryAsync(Category category);

        /// <summary>
        /// Xóa danh mục (Async)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<bool> DeleteCategoryAsync(int id);

        #endregion
    }
    public class CategoryService : ICategoryService
    {
        private readonly TechStoreContext _context;

        public CategoryService(TechStoreContext context)
        {
            _context = context;
        }

        #region Async Methods

        public async Task<IEnumerable<Category>> GetCategoriesAsync()
        {
            return await _context.Categories.ToListAsync();
        }

        public async Task<Category?> GetCategoryByIdAsync(int id)
        {
            return await _context.Categories.FindAsync(id);
        }

        public async Task<Dictionary<int, int>> GetProductCountByCategoryAsync()
        {
            return await _context.Categories
                .GroupJoin(
                    _context.Products,
                    category => category.CategoryId,
                    product => product.CategoryId,
                    (category, products) => new { CategoryId = category.CategoryId, ProductCount = products.Count() }
                )
                .ToDictionaryAsync(g => g.CategoryId, g => g.ProductCount);
        }

        public async Task<bool> AddCategoryAsync(Category category)
        {
            var existingCategory = await _context.Categories.FirstOrDefaultAsync(c => c.CategoryName == category.CategoryName);
            if (existingCategory != null)
            {
                return false;
            }
            await _context.Categories.AddAsync(category);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> UpdateCategoryAsync(Category category)
        {
            var existingCategory = await _context.Categories.FirstOrDefaultAsync(c => c.CategoryName == category.CategoryName);
            if (existingCategory != null)
            {
                return false;
            }
            _context.Categories.Update(category);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteCategoryAsync(int id)
        {
            var existingCategory = await _context.Categories.FindAsync(id);
            if (existingCategory == null)
            {
                return false;
            }
            _context.Categories.Remove(existingCategory);
            await _context.SaveChangesAsync();
            return true;
        }

        #endregion
    }
}
