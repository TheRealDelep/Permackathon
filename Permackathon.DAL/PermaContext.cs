using Microsoft.EntityFrameworkCore;
using Permackathon.DAL.Entities;
using System;

namespace Permackathon.DAL
{
    public class PermaContext : DbContext
    {
        public PermaContext()
        { }

        public PermaContext(DbContextOptions<PermaContext> options) : base(options)
        { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (optionsBuilder is null)
                throw new ArgumentNullException(nameof(optionsBuilder));

            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=FacilityDB;Trusted_Connection=True;");
                optionsBuilder.EnableSensitiveDataLogging();
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            if (modelBuilder is null)
            {
                throw new ArgumentNullException(nameof(modelBuilder));
            }
        }

        public DbSet<Member> Members { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<ToDo> ToDos { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Site> Sites { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Priority> Priorities { get; set; }
        public DbSet<State> States { get; set; }
    }
}