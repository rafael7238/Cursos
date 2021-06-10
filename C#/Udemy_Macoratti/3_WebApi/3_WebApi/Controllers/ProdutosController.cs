using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using _3_WebApi.Model;
using _3_WebApi.Repository;

namespace _3_WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProdutosController : ControllerBase
    {
        private readonly IUnitOfWork _uof;

        public ProdutosController(IUnitOfWork context)
        {
            _uof = context;
        }

        // GET: api/Produtos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Produto>>> GetProdutos()
        {
            return await _uof.ProdutoRepository.Get().ToListAsync();
        }

        // GET: api/Produtos/5
        [HttpGet("{id}")]
        public ActionResult<Produto> GetProduto(int id)
        {
            var produto =  _uof.ProdutoRepository.GetById(p=> p.ProdutoId==id);
            if (produto == null)
            {
                return NotFound();
            }

            return produto;
        }

        // PUT: api/Produtos/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProduto(int id,[FromBody] Produto produto)
        {
            if (id != produto.ProdutoId)
            {
                return BadRequest();
            }
            try
            {
                _uof.ProdutoRepository.Update(produto);
                _uof.Commit();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProdutoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Produtos
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Produto>> PostProduto(Produto produto)
        {
            _uof.ProdutoRepository.Add(produto);
            _uof.Commit();

            return CreatedAtAction("GetProduto", new { id = produto.ProdutoId }, produto);
        }

        // DELETE: api/Produtos/5
        [HttpDelete("{id}")]
        public IActionResult  DeleteProduto(int id)
        {
            var produto =  _uof.ProdutoRepository.GetById(p=>p.ProdutoId==id);
            if (produto == null)
            {
                return NotFound();
            }

            _uof.ProdutoRepository.Delete(produto);
            _uof.Commit();

            return NoContent();
        }

        private bool ProdutoExists(int id)
        {
            var t= _uof.ProdutoRepository.GetById(e => e.ProdutoId == id);
            if t. == 0 return true;
            return false;
        }
    }
}
