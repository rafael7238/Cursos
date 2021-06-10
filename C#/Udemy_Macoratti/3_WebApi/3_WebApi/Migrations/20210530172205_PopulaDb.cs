using Microsoft.EntityFrameworkCore.Migrations;

namespace _3_WebApi.Migrations
{
    public partial class PopulaDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("insert into categorias(nome,imagemUrl)" +
                "Values('Categoria01','https://teste01')");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("delete from categorias");
        }
    }
}
