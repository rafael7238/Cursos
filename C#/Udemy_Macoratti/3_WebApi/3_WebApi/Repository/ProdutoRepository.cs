using _3_WebApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace _3_WebApi.Repository
{
    public class ProdutoRepository : Respository<Produto>, IProdutoRepository
    {
       public ProdutoRepository(AppDbContext context) : base(context) { }
     public IEnumerable<Produto> GetProdutosPorPreco()
        {
            return Get().OrderBy(c => c.Preco).ToList();
        }
    }
}