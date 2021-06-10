using _3_WebApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _3_WebApi.Repository
{
    public class UnitOfWork : IUnitOfWork
    {

        private ProdutoRepository _produtoRepo;
        private CategoriaRepository _CategoriaRepo;
        public AppDbContext _contex;

        public UnitOfWork(AppDbContext context)
        {
            _contex = context;
        }

        public IProdutoRepository ProdutoRepository
        {
            get
            {
                return _produtoRepo = _produtoRepo ?? new ProdutoRepository(_contex);
            }
        }

        public ICategoriaRepository CategoriaRepository
        {
            get
            {
                return _CategoriaRepo = _CategoriaRepo ?? new CategoriaRepository(_contex);
            }
        }

        public void Commit()
        {
            _contex.SaveChanges();
        }

        public void Dispose()
        {
            _contex.Dispose();
        }
    }
}
