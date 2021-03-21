using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;

namespace _3_Api_Catalago.Models
{
    public class Categoria
    {
        public Categoria()
        {
            Produtos = new Collection<Produto>();
        }

        public int CategoriaId { get; set; }
        public int Nome { get; set; }
        public int ImagemUrl { get; set; }

        public ICollection<Produto> Produtos { get; set; }
    }
}