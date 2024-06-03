using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models {
    public class PrivacyImage {

        public int Id { get; set; }
        [Required]
        public string ImageUrl { get; set; }
        public int PrivacyId { get; set; }
        [ForeignKey("PrivacyId")]
        public Privacy Privacy { get; set; }
    }
}
