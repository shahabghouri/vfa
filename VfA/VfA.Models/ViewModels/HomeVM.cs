using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models.ViewModels
{
    public class HomeVM
    {
        public IEnumerable<Product>? Products { get; set; }
        public IEnumerable<Service>? Services { get; set; }
        public IEnumerable<Request>? Requests { get; set; }
        public IEnumerable<Partner>? Partners { get; set; }
        public IEnumerable<Trust>? Trusts { get; set; }
    }
}
