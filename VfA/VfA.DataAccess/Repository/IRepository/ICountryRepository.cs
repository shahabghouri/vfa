using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Models;

namespace VfA.DataAccess.Repository.IRepository
{
    public interface ICountryRepository : IRepository<Country>
    {
        List<Country> GetAll();
    }
}
