using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models.ViewModels
{
    public class ProfileViewModel
    {
        public string? CompnayName { get; set; }
        public string? WilayaName { get; set; }
        public string? CountryName { get; set; }
        public string? ActivityName { get; set; }
        public string? UserType { get; set; }//importer or expoter
        public IEnumerable<Product>? Products { get; set; }
        public IEnumerable<Service>? Services { get; set; }
        public IEnumerable<Request>? Requests { get; set; }
        public string? CompnayLogo { get; set; }
    }
}
