using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApplication1.Migrations
{
    public partial class insert_tabelas : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("insert into categorias(nome,imagemurl) values('Bebidas','img/bebidas')");
            migrationBuilder.Sql("insert into categorias(nome,imagemurl) values('Lanches','img/lanches')");
            migrationBuilder.Sql("insert into categorias(nome,imagemurl) values('Sobremesa','img/sobremesa')");

            migrationBuilder.Sql("insert into produtos(nome,descricao,preco,imagemurl,estoque,datacadastro,categoriaid) values ('Coca-Cola','Bebida Coca-cola',5.40,'cocacola.png',400,now(),(select categoriaid from categorias where nome='Bebidas'))");
            migrationBuilder.Sql("insert into produtos(nome,descricao,preco,imagemurl,estoque,datacadastro,categoriaid) values ('Coxinha','Coxinha de Catupiry',3.50,'coxinha.png',20,now(),(select categoriaid from categorias where nome='Lanches'))");
            migrationBuilder.Sql("insert into produtos(nome,descricao,preco,imagemurl,estoque,datacadastro,categoriaid) values ('Pudim','Pudim de leite',10,'pudim.png',5,now(),(select categoriaid from categorias where nome='Sobremesa'))");



        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
