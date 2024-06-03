﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
	public class PartnerImage
	{
        public int Id { get; set; }
        [Required]
        public string ImageUrl { get; set; }
        public int PartnerId { get; set; }
        [ForeignKey("PartnerId")]
        public Partner Partner { get; set; }
    }
}
