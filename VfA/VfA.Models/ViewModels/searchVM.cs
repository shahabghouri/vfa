using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models.ViewModels
{
    public class searchVM
    {
        public string searchkeyworddd { get; set; }
        public string searchkeyword { get; set; }
        //pblic IEnumerable<object>? list { get; set; }
        public IEnumerable<genericModelPSR>? genericModellst { get; set; }
    }
    public class genericModelPSR
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string CatName { get; set; }
        public string ImgUrl { get; set; }
    }
}
