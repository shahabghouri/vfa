﻿
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace VfA.Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [MaxLength(30)]
        [DisplayName("Category Name")]
        public string Name { get; set; }
        
    }
}
