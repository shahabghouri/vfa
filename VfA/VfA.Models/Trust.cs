﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
    public class Trust
    {
		public int Id { get; set; }
		[Required]
		public string Name { get; set; }

		
		public List<TrustImage> TrustImages { get; set; }
        
	}
}
