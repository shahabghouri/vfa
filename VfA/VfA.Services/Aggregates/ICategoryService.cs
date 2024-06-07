using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Common.DTO;

namespace VfA.Services.Aggregates
{
    public interface ICategoryService
    {
        Task<List<CategoryDTO>> GetAll();
        Task<CategoryDTO> Get(long Id);

    }
}
