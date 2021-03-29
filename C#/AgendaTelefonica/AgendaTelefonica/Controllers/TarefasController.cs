using AgendaTelefonica.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AgendaTelefonica.Controllers
{
    public class TarefasController : Controller
    {
        private readonly Contexto _context;
        public TarefasController(Contexto context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View(PegarDatas());
        }
        public IActionResult Tarefas()
        {
            return View(PegarDatas());
        }

        private List<DatasViewsModell> PegarDatas()
        {
            DateTime dataAtual = DateTime.Now;
            DateTime dataLimite = DateTime.Now.AddDays(10);
            int qtdDias = 0;
            DatasViewsModell data;
            List<DatasViewsModell> listasDatas = new List<DatasViewsModell>();

            while (dataAtual < dataLimite)
            {
                data = new DatasViewsModell();
                data.Datas = dataAtual.ToShortDateString();
                data.Identificadores = "collapse" + dataAtual.ToShortDateString().Replace("/", "");
                listasDatas.Add(data);
                qtdDias++;
                dataAtual=DateTime.Now.AddDays(qtdDias);
            }
            return listasDatas;
        }

        [HttpGet]
        public IActionResult CriarTarefa(string dataTarefa)
        {
            Tarefa tarefa = new Tarefa
            {
                Data = dataTarefa
            };

            return View(tarefa);
        }
        [HttpPost]
        public async Task<IActionResult> CriarTarefa (Tarefa tarefa)
        {
            if (ModelState.IsValid)
            {
                _context.Tarefas.Add(tarefa);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            else
            {
                return View(tarefa);
            }
        }

        [HttpGet]
        public async Task<IActionResult> AtualizarTarefa(int tarefaId)
        {
          Tarefa tarefa = await  _context.Tarefas.FindAsync(tarefaId);
            if (tarefa == null) return NotFound();
            return View(tarefa);

        }

        [HttpPost]
        public async Task<IActionResult> AtualizarTarefa (Tarefa tarefa)
        {
            if (ModelState.IsValid)
            {
                _context.Update(tarefa);
                _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            else return View(tarefa);


        }

        [HttpPost]
        public async Task<JsonResult> ExcluirTarefa(int tarefaId)
        {
            Tarefa tarefa = await _context.Tarefas.FindAsync(tarefaId);
            _context.Tarefas.Remove(tarefa);
            await _context.SaveChangesAsync();
            return Json(true);
        }
    }
}
