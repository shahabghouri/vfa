using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;

namespace VfA.DataAccess.Repository.IRepository
{
    public interface ICompanyActivityRepository : IRepository<CompanyActivity>
    {
        List<CompanyActivity> GetAll();
    }
}