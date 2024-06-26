using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models.ViewModels
{
    public class SearchVM
    {
        public string SearchKeyword { get; set; }
        public string searchkeyword { get; set; }
        //pblic IEnumerable<object>? list { get; set; }
        public IEnumerable<GenericModelPSR>? GenericModelList { get; set; }
    }
    public class GenericModelPSR
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string CatName { get; set; }
        public string ImgUrl { get; set; }
    }
}
