using GerenciadorDeTarefas.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GerenciadorDeTarefas.Repository
{
    public interface IUsuarioRepository
    {
        public void Salvar(Usuario usuario);
        bool ExisteEmailCadastrao(string email);
        Usuario GetUsuarioByEmailSenha(string login, string v);
    }
}
