using Newtonsoft.Json.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api_Catalago_Produto.Repository
{
   public interface IUnitOfWork
    {
        IProdutoRepository produtoRepository { get;  }
        ICategoriaRepository CategoriaRepository { get;  }

        void Commit();
    }
}
