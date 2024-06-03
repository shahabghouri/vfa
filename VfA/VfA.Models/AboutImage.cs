using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models {
    public class AboutImage {

        public int Id { get; set; }
        [Required]
        public string ImageUrl { get; set; }
        public int AboutId { get; set; }
        [ForeignKey("AboutId")]
        public About About { get; set; }
    }
}
