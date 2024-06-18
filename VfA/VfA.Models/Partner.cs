using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
    public class Partner
    {
		public int Id { get; set; }
		[Required]
		public string Name { get; set; }


		
		public List<PartnerImage>? PartnerImages { get; set; }
        
	}
}
