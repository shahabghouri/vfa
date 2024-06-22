using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Models.ViewModels;

namespace VfA.DataAccess.Repository.IRepository
{
    public interface IUserClaimsService
    {
        UserClaimsVM GetUserClaims();
    }
}
