using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace VfA.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [MaxLength(30)]
        [DisplayName("Product Name")]
        public string Name { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at most {1} characters long.")]
        public string Description { get; set; }
        [DisplayName("Production Capacity (in thousands) ")]
        [Range(1, 10000, ErrorMessage = "Capacity must be between 1-10000")]
        public int ProductionCapacity { get; set; }
        [Required]
        [DisplayName("Capacity Unit")]
        public string CapacityUnit { get; set; }

        [Required]
        
        [DisplayName("Certificates")]
        public string Certificates { get; set; }

        [Required]
        [DisplayName("Category")]
        public int CategoryId { get; set; }
        [ForeignKey("CategoryId")]
        [ValidateNever]
        public Category Category { get; set; }
        [Required]

        [ValidateNever]
        public List<ProductImage> ProductImages { get; set; }
        public string? UserId { get; set; }
    }
}
