using EComm.Model.Entities;
using EComm.Model.Interfaces;
using EComm.Rest.API.Data;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EComm.DataAccess.Data
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly StoreContext _context;

        private Hashtable _repositories;

        public UnitOfWork(StoreContext context)
        {
            _context = context;
        }

        public async Task<int> Complete()
        {
            return await _context.SaveChangesAsync();
        }

        public void Dispose()
        {
            _context.Dispose();
        }

        public IGenericRepository<TEntity> Repository<TEntity>() where TEntity : BaseEntity
        {
            if(_repositories == null) 
                _repositories = new Hashtable();
            
            var type = typeof(TEntity).Name;
            if(!_repositories.ContainsKey(type))
            {
                var repoType = typeof(GenericRepository<>);
                var repoInstance = Activator.CreateInstance(repoType.MakeGenericType(typeof(TEntity)),_context);
                _repositories.Add(type, repoInstance);
            }
            return (IGenericRepository<TEntity>)_repositories[type];

        }
    }
}
