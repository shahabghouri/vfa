﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations.Schema;

namespace VfA.Models
{

    public class Request
    {

        [Key]
        public int Id { get; set; }

        [Required]

        [MaxLength(30)]
        [DisplayName("Request")]
        public string Name{ get; set; }
        [DisplayName("Category")]
        public int CategoryId { get; set; }
        [ForeignKey("CategoryId")]
        [ValidateNever]
        public Category Category { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at most {1} characters long.")]
        [DisplayName("Description")]
        public string Description { get; set; }

        [ValidateNever]
        public List<RequestImage> RequestImages { get; set; }

        public string? UserId { get; set; }
    }
}
