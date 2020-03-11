//using Microsoft.EntityFrameworkCore;
//using Microsoft.VisualStudio.TestTools.UnitTesting;
//using Permackathon.DAL.Entities;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Reflection;
//using System.Text;

//namespace Permackathon.DAL.Tests
//{
//    [TestClass]
//    public class GenericRepositoryTests
//    {
//        [TestMethod]
//        public void Should_Return_A_ToDo_With_All_Its_Properties()
//        {
//            var options = new DbContextOptionsBuilder<PermaContext>()
//                .UseInMemoryDatabase(databaseName: MethodBase.GetCurrentMethod().Name)
//                .Options;

//            using (var context = new PermaContext(options))
//            {
//                ReflectionRepository<ToDo> todoRepository = new ReflectionRepository<ToDo>(context);
//                ReflectionRepository<State> stateRepo = new ReflectionRepository<State>(context);

//                var state = new State()
//                {
//                    Name = "Urgent"
//                };

//                stateRepo.Add(state);

//                var task = new ToDo()
//                {
//                    Author = new Member()
//                    {
//                        FirstName = "Yves",
//                        LastName = "Remords",
//                        Email = "Yves@aa.com",
//                    },

//                    Name = "Generic Repo",

//                    State = state
//                };

//                todoRepository.Add(task);

//                context.SaveChanges();

//                IEnumerable<ToDo> sut = todoRepository.GetAll();

//                Assert.AreEqual(1, todoRepository.GetAll().Count());
//            }
//        }
//    }
//}