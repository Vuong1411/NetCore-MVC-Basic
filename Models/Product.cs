using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Classwork.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string Name { get; set; } = string.Empty;

    public int CategoryId { get; set; }

    public decimal Price { get; set; }

    public int Stock { get; set; }

    public string? Description { get; set; } = string.Empty;

    public string? Specifications { get; set; }

    public string? ImageUrls { get; set; }

    [NotMapped]
    public List<string> ImageUrlList
    {
        get => ImageUrls?.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList() ?? new List<string>();
        set => ImageUrls = string.Join(";", value);
    }

    public DateTime? CreatedAt { get; set; }

    public virtual ICollection<Cart> Carts { get; set; } = new List<Cart>();

    public virtual Category? Category { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
