using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _3_WebApi.Repository
{
   public interface IUnitOfWork
    {
        IProdutoRepository ProdutoRepository { get; }
        ICategoriaRepository CategoriaRepository { get; }

        void Commit();

    }
}
