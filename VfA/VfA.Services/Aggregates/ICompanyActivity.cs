using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Common.DTO;

namespace VfA.Services.Aggregates
{
    public interface ICompanyActivity
    {
        Task<List<CompanyActivityDTO>> GetAll();
        Task<CompanyActivityDTO> Get(long Id);

    }
}
