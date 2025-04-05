using System.Collections.Generic;

namespace Classwork.ViewModels
{
    public class PaginatedVM<T>
    {
        public required IEnumerable<T> Items { get; set; }
        public int TotalItems { get; set; }
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalPages => (int)Math.Ceiling(decimal.Divide(TotalItems, PageSize));
        public bool HasPrevPage => PageNumber > 1;
        public bool HasNextPage => PageNumber < TotalPages;
    }
}
