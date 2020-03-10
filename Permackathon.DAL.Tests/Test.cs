using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Permackathon.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Permackathon.DAL.Tests
{
    [TestClass]
    public class Test
    {
        [TestMethod]
        public void AddInGenericRepositoryTest()
        {
            var option = new DbContextOptionsBuilder<PermaContext>()
                .UseInMemoryDatabase(databaseName: MethodBase.GetCurrentMethod().Name)
                .Options;

            using (var memoryContext = new PermaContext(option))
            {
                // Act
                GenericRepository<Member> genericRepository = new GenericRepository<Member>(memoryContext);
                //Arrang
                Member membre = new Member { Email = "blabla@mail.com", FirstName = "Sponge", LastName = "Bob", Password = "123456" };
                genericRepository.Insert(membre);
                memoryContext.SaveChanges();
                //Assert
                var testMember = genericRepository.GetByID(membre.id);
                Assert.AreEqual("Bob", testMember.LastName);
            }
        }

        [TestMethod]
        public void AddWithInclud()
        {
            var option = new DbContextOptionsBuilder<PermaContext>()
                .UseInMemoryDatabase(databaseName: MethodBase.GetCurrentMethod().Name)
                .Options;

            using (var memoryContext = new PermaContext(option))
            {
                //Act
                GenericRepository<Location> locationRepository = new GenericRepository<Location>(memoryContext);
                GenericRepository<Site> siteRepository = new GenericRepository<Site>(memoryContext);

                //Arrang
                Location location = new Location { City = "bxl", Number = "20", Street = "Av. Sloubie", Zipcode = "1000" };
                Site site = new Site { Location = location, Name = "Kaamelott", Phone = "047852948" };
                locationRepository.Insert(location);
                siteRepository.Insert(site);
                memoryContext.SaveChanges();

                //Assert
                var testLocation = locationRepository.GetByID(location.Id);
                var testSite = siteRepository.GetByID(site.Id);
                Assert.AreEqual(testSite.Name, "Kaamelott");
            }
        }

        [TestMethod]
        public void DeleteIncludAllTable()
        {
            var option = new DbContextOptionsBuilder<PermaContext>()
                .UseInMemoryDatabase(databaseName: MethodBase.GetCurrentMethod().Name)
                .Options;

            using (var memoryContext = new PermaContext(option))
            {
                //Act
                GenericRepository<Location> locationRepository = new GenericRepository<Location>(memoryContext);
                GenericRepository<Site> siteRepository = new GenericRepository<Site>(memoryContext);

                //Arrang
                Location location = new Location { City = "bxl", Number = "20", Street = "Av. Sloubie", Zipcode = "1000" };
                Site site = new Site { Location = location, Name = "Kaamelott", Phone = "047852948" };
                locationRepository.Insert(location);
                siteRepository.Insert(site);
                memoryContext.SaveChanges();

                //Assert
                var testLocation = locationRepository.GetByID(location.Id);
                var testSite = siteRepository.GetByID(site.Id);
                //siteRepository.Delete(site.Id);
                locationRepository.Delete(location.Id);
                memoryContext.SaveChanges();
                //Assert.AreEqual(siteRepository.Get().Count(),0);
                //Assert.AreEqual(locationRepository.Get().Count(), 0);
                Assert.AreEqual(locationRepository.Get().Count(), 0);
            }
        }
    }
}