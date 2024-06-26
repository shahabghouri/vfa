﻿using VfA.DataAccess.Repository.IRepository;
using VfA.DataAcess.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.DataAccess.Repository
{
    public class UnitOfWork : IUnitOfWork
    {

        private ApplicationDbContext _db;

       
        public IServiceRepository Service { get; private set; }
        
        public IRequestRepository Request { get; private set; }

		public IInfoRepository Info { get; private set; }
		public IPartnerRepository Partner { get; private set; }
		public ITrustRepository Trust { get; private set; }
		public IAboutRepository About { get; private set; }
		public IPrivacyRepository Privacy { get; private set; }
        
        public IServiceImageRepository ServiceImage { get; private set; }
        public IRequestImageRepository RequestImage { get; private set; }
        public IPartnerImageRepository PartnerImage { get; private set; }
        public ITrustImageRepository TrustImage { get; private set; }
        public IInfoImageRepository InfoImage { get; private set; }
        public IAboutImageRepository AboutImage { get; private set; }
        public IPrivacyImageRepository PrivacyImage { get; private set; }
        public IMessageRepository Message { get; private set; }



        //Bulky class
        public ICategoryRepository Category { get; private set; }
        public ICountryRepository Country { get; private set; }
        public IStateProvinceRepository StateProvince { get; private set; }
        public ICompanyActivityRepository CompanyActivity { get; private set; }
        public ICompanyRepository Company { get; private set; }
        public IProductRepository Product { get; private set; }
        public IWilayaRepository Wilaya { get; private set; }
         
        public IApplicationUserRepository ApplicationUser { get; private set; }
        
        public IProductImageRepository ProductImage { get; private set; }
        public ISubscriptionPlanRepository SubscriptionPlan { get; private set; }
        public IPaymentHistoryRepository PaymentHistory { get; private set; }
        public IPaymentOrderRepository PaymentOrder { get; private set; }

        public UnitOfWork(ApplicationDbContext db)
        {
            _db = db;
            
           
            Service = new ServiceRepository(_db);
            Request = new RequestRepository(_db);
			Info = new InfoRepository(_db);
			Partner = new PartnerRepository(_db);
			Trust = new TrustRepository(_db);
			About = new AboutRepository(_db);
			Privacy = new PrivacyRepository(_db);
           
            ServiceImage = new ServiceImageRepository(_db);
            RequestImage = new RequestImageRepository(_db);
            PartnerImage = new PartnerImageRepository(_db);
            TrustImage = new TrustImageRepository(_db);
            InfoImage = new InfoImageRepository(_db);
            AboutImage = new AboutImageRepository(_db);
            PrivacyImage = new PrivacyImageRepository(_db);
            Category = new CategoryRepository(_db);
			//Bulky DB
			ProductImage = new ProductImageRepository(_db);
            ApplicationUser = new ApplicationUserRepository(_db);
            Message = new MessageRepository(_db);


            Product = new ProductRepository(_db);
            Company = new CompanyRepository(_db);   
            
            Country = new CountryRepository(_db);   
            StateProvince = new StateProvinceRepository(_db);
            CompanyActivity = new CompanyActivityRepository(_db);
            Wilaya = new WilayaRepository(_db);

            SubscriptionPlan = new SubscriptionPlanRepository(_db);
            PaymentHistory = new PaymentHistoryRepository(_db);

            PaymentOrder = new PaymentOrderRepository(_db);
        }

        public void Save()
        {
            _db.SaveChanges();
        }
    }
}
