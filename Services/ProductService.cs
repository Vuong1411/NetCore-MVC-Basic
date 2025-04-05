using Classwork.Models;
using Microsoft.EntityFrameworkCore;

namespace Classwork.Services
{
    public interface IProductService
    {

        //Phương thức bất đồng bộ
        #region Async Methods

        /// <summary>
        /// Lấy thông tin sản phẩm theo ID (Async)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<Product?> GetProductByIdAsync(int id);


        /// <summary>
        /// Lấy danh sách sản phẩm (Async)
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<Product>> GetProductsAsync();

        Task<(IEnumerable<Product>, int TotalCount)> GetProductsAsync(string? keywords, int pageNumber, int pageSize);

        /// <summary>
        /// Lấy danh sách sản phẩm theo keywords, filter (Async)
        /// </summary>
        /// <param name="keywords"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        Task<IEnumerable<Product>> GetProductsAsync(string keywords, List<string>? filter = null);

        /// <summary>
        /// Thêm sản phẩm (Async)
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        Task<bool> AddProductAsync(Product product);

        /// <summary>
        /// Cập nhật thông tin sản phẩm (Async)
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        Task<bool> UpdateProductAsync(Product product);

        /// <summary>
        /// Xóa sản phẩm (Async)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<bool> DeleteProductAsync(int id);
        #endregion
    }

    public class ProductService : IProductService
    {
        private readonly TechStoreContext _context;

        public ProductService(TechStoreContext context)
        {
            _context = context;
        }

        //Phương thức bất đồng bộ
        #region Async Methods


        public async Task<IEnumerable<Product>> GetProductsAsync()
        {
            return await _context.Products.ToListAsync();
        }

        public async Task<(IEnumerable<Product>, int TotalCount)> GetProductsAsync(string? keywords, int pageNumber, int pageSize)
        {
            var products = _context.Products.AsQueryable();
            if (!string.IsNullOrEmpty(keywords))
            {
                products = products.Where(p => p.Name.Contains(keywords) ||
                                               p.Category.CategoryName.Contains(keywords));
            }

            var totalCount = await products.CountAsync();
            products = products
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize);
            return (await products.ToListAsync(), totalCount);
        }

        public async Task<IEnumerable<Product>> GetProductsAsync(string? keywords, List<string>? filter = null)
        {
            var products = _context.Products.AsQueryable();
            if (!string.IsNullOrEmpty(keywords))
            {
                products = products.Where(p => p.Name.Contains(keywords) ||
                                               p.Category.CategoryName.Contains(keywords));
            }

            if (filter != null && filter.Any())
            {
                products = products.Where(p => filter.Contains(p.CategoryId.ToString()));
            }

            return await products.ToListAsync();
        }


        public async Task<Product?> GetProductByIdAsync(int id)
        {
            return await _context.Products.FindAsync(id);
        }

        public async Task<bool> AddProductAsync(Product product)
        {
            var existingProduct = await _context.Products.FirstOrDefaultAsync(p => p.Name == product.Name);
            if (existingProduct != null)
            {
                return false;
            }
            await _context.Products.AddAsync(product);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> UpdateProductAsync(Product product)
        {
            var existingProduct = await _context.Products.FindAsync(product.ProductId);
            if (existingProduct != null)
            {
                existingProduct.Name = product.Name;
                existingProduct.CategoryId = product.CategoryId;
                existingProduct.Description = product.Description;
                existingProduct.Price = product.Price;
                existingProduct.ImageUrls = product.ImageUrls;
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<bool> DeleteProductAsync(int id)
        {
            var existingProduct = await _context.Products.FindAsync(id);
            if (existingProduct != null)
            {
                _context.Products.Remove(existingProduct);
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }

        #endregion
    }
}
