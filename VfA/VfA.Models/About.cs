using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
    public class About
    {
		[Key]
		public int Id { get; set; }
		public string Title { get; set; }
		public string Topic { get; set; }
        public List<AboutImage>? AboutImages { get; set; }
    }
}
