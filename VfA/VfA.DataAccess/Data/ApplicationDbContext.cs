using VfA.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace VfA.DataAcess.Data
{
    public class ApplicationDbContext : IdentityDbContext<IdentityUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }
        // First set the table
        //My Db
        
        public DbSet<Service> Services { get; set; }
        public DbSet<Request> Requests { get; set; }
	     public DbSet<Info> Infos { get; set; }

		public DbSet<Partner> Partners { get; set; }
		public DbSet<Trust> Trusts { get; set; }
		public DbSet<About> Abouts { get; set; }
		public DbSet<Privacy> Privacies { get; set; }
		
		public DbSet<ServiceImage> ServiceImages { get; set; }
		public DbSet<RequestImage> RequestImages { get; set; }
		public DbSet<PartnerImage> PartnerImages { get; set; }
		public DbSet<TrustImage> TrustImages { get; set; }

        public DbSet<InfoImage> InfoImages { get; set; }

        public DbSet<AboutImage> AboutImages { get; set; }

        public DbSet<PrivacyImage> PrivacyImages { get; set; }

        //public DbSet<Message> Messages { get; set; }






        //Bulky Lists
        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products{ get; set; }
        public DbSet<Company> Companies { get; set; }
        
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<ApplicationUser> ApplicationUsers { get; set; }
       

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

			base.OnModelCreating(modelBuilder);




           



            modelBuilder.Entity<Category>().HasData(
                new Category { Id = 1, Name = "Agri-Food" });
                
                
            

            modelBuilder.Entity<Service>().HasData(
               new Service { Id = 1, Name = "Tourism", Description = "Business Trip", CategoryId = 1 }

               );
            modelBuilder.Entity<Request>().HasData(
               new Request { Id = 1, Name = "Looking for shipping Company" , Description = "Need Shipping from Algeria to Canada" , CategoryId= 1},

               
            new Request { Id = 2, Name = "Tax", Description = "Need Commissionnaire de douane", CategoryId = 1 }

               );
           


           
        }
    }
}
