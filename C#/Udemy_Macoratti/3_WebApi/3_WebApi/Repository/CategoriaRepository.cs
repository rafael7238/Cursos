using _3_WebApi.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace _3_WebApi.Repository
{
    public class CategoriaRepository : Respository<Categoria>, ICategoriaRepository
    {
        public CategoriaRepository(AppDbContext context) : base(context) { }
     public IEnumerable<Categoria> GetCategoriaProduto()
        {
            return Get().Include(x => x.Produtos);
        }
    }
}