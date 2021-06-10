using _3_WebApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _3_WebApi.Repository
{
  public  interface IProdutoRepository:IRepository<Produto>
    {
        IEnumerable<Produto> GetProdutosPorPreco();
    }
}