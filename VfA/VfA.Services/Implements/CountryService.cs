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
    public class CountryService : ICountryService
    {
        private readonly ApplicationDbContext ctx;
        private readonly IMapper mapper;
        public CountryService(ApplicationDbContext ctx, IMapper mapper)
        {
            this.ctx = ctx;
            this.mapper = mapper;
        }
        public async Task<List<CountryDTO>> GetAll()
        {
            var countries = await ctx.Countries.AsNoTracking().ToListAsync();
            var countryDTOs = mapper.Map<List<CountryDTO>>(countries);
            return countryDTOs;
        }
        public async Task<CountryDTO> Get(long Id)
        {
            var countries = await ctx.Countries.Where(x => x.Id == Id).FirstOrDefaultAsync();
            var countryDTO = mapper.Map<CountryDTO>(countries);
            return countryDTO;
        }
    }
}
