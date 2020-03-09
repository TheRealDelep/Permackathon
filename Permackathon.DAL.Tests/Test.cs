using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Permackathon.DAL.Entities;
using System;
using System.Collections.Generic;
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
                Member membre = new Member {Email="blabla@mail.com", FirstName="Sponge",LastName="Bob",Password="123456"};
                genericRepository.Insert(membre);
                memoryContext.SaveChanges();
                //Assert
                var testMember = genericRepository.GetByID(membre.id);
                Assert.AreEqual("Bob",testMember.LastName);

            }
        }
    }
}
