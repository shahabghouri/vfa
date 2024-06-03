using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Models;

namespace VfA.DataAccess.Repository.IRepository
{
    public interface IUnitOfWork
    {
        //My units of work
        
        IServiceRepository Service { get; }
        
        IRequestRepository Request { get; }

		IInfoRepository Info { get; }
		IPartnerRepository Partner { get; }
		ITrustRepository Trust { get; }
		IAboutRepository About { get; }
		IPrivacyRepository Privacy { get; }

		ICategoryRepository Category { get; }
        
        IServiceImageRepository ServiceImage { get; }
        IRequestImageRepository RequestImage { get; }
        IPartnerImageRepository PartnerImage { get; }
        ITrustImageRepository TrustImage { get; }
        IInfoImageRepository InfoImage { get; }
        IAboutImageRepository AboutImage { get; }
        IPrivacyImageRepository PrivacyImage { get; }


        

        IProductRepository Product { get; }
        ICompanyRepository Company { get; }
        
        IApplicationUserRepository ApplicationUser { get; }
       
        
        IProductImageRepository ProductImage { get; }
        void Save();
    }
}
