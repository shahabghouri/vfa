using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
	public class TrustImage
	{
        public int Id { get; set; }
        [Required]
        public string ImageUrl { get; set; }
        public int TrustId { get; set; }
        [ForeignKey("TrustId")]
        public Trust Trust { get; set; }
    }
}
