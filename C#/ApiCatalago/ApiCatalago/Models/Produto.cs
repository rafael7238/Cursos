using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ApiCatalago.Models
{
    [Table("Produtos")]
    public class Produto
    {
        public Produto()
        {

        }
        [Key]
        public int ProdutoId { get; set; }
        [Required]
        [MaxLength(80)]
        public string Nome { get; set; }
        [Required]
        [MaxLength(80)]
        public string Descrica { get; set; }
        [Required]
        [DataType(DataType.Currency)]
        [Column(TypeName="decimal(8,2)")]
        public decimal Preco { get; set; }
        [Required]
        [MaxLength(80)]
        public string ImageUrl { get; set; }
        [Required]
        public float Estoque { get; set; }
        [Required]

        public DateTime DataCadastro { get; set; }

        public Categoria Categoria { get; set; }

        public int CategoriaId { get; set; }

    }
}
