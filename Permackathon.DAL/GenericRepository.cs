using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Data;

namespace Permackathon.DAL
{
    public class GenericRepository<T> where T : Entity
    {
        private PermaContext context;
        private DbSet<T> dbSet;

        public GenericRepository(PermaContext context)
        {
            this.context = context;
            dbSet = context.Set<T>();
        }

        public virtual IEnumerable<T> GetAll()
        {
            IEnumerable<PropertyInfo> propertiesToInclude =
                dbSet
                .GetType()
                .GetGenericArguments()
                .First()
                .GetProperties()
                .Where(x => (x.PropertyType.IsClass && x.PropertyType != typeof(string)));

            foreach (PropertyInfo prop in propertiesToInclude)
            {
                dbSet.Include(prop.Name);
            }

            return dbSet;
        }

        public virtual void Add(T entity)
        {
            dbSet.Add(entity);
        }
    }
}