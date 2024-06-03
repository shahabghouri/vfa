using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
	public class ServiceImage
	{
        public int Id { get; set; }
        [Required]
        public string ImageUrl { get; set; }
        public int ServiceId { get; set; }
        [ForeignKey("ServiceId")]
        public Service Service { get; set; }

        //public List<ServiceImage> ServiceImages { get; set; }
    }
}
