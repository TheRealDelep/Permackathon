using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

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
            return dbSet.
                Include(x => x.GetType().GetProperties().Where(p => p.GetType().IsClass));
        }
    }
}