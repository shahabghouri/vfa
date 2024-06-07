using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Common.DTO;
using VfA.DataAcess.Data;
using VfA.Services.Aggregates;

namespace VfA.Services.Implements
{
    public class StateProviceService : IStateProviceService
    {
        private readonly ApplicationDbContext ctx;
        private readonly IMapper mapper;
        public StateProviceService(ApplicationDbContext ctx, IMapper mapper)
        {
            this.ctx = ctx;
            this.mapper = mapper;
        }
        public async Task<List<StateProvinceDTO>> GetAll()
        {
            var stateProvinces = await ctx.StateProvince.AsNoTracking().ToListAsync();
            var stateProvinceDTOs = mapper.Map<List<StateProvinceDTO>>(stateProvinces);
            return stateProvinceDTOs;
        }
        public async Task<StateProvinceDTO> GetByCountryId(long countryId)
        {
            var stateProvince = await ctx.StateProvince.Where(x => x.CountryId == countryId).FirstOrDefaultAsync();
            var StateProvinceDTO = mapper.Map<StateProvinceDTO>(stateProvince);
            return StateProvinceDTO;
        }
        public async Task<StateProvinceDTO> Get(long Id)
        {
            var stateProvince = await ctx.StateProvince.Where(x => x.Id == Id).FirstOrDefaultAsync();
            var StateProvinceDTO = mapper.Map<StateProvinceDTO>(stateProvince);
            return StateProvinceDTO;
        }
    }
}
