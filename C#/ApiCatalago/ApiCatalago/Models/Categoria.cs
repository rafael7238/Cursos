using ApiCatalago.Validartions;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ApiCatalago.Models
{
    [Table("Categorias")]
    public class Categoria
    {
        public Categoria()
        {
            Produtos = new Collection<Produto>();
        }
        [Key]
        public int CategoriaId { get; set; }
        [Required]
        [MaxLength(80)]
        [PrimeiraLetraMaiusculaAttribute]
        public string Nome { get; set; }
        [Required]
        [MaxLength(80)]
        public string ImgUrl { get; set; }

        public ICollection<Produto> Produtos { get; set; }
    }
}
