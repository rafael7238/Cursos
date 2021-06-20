using GerenciadorDeTarefas.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GerenciadorDeTarefas.Repository.Impl
{
    public class UsuarioRepositoryImpl : IUsuarioRepository
    {
        private readonly GerenciadorDeTarefasContext _context;
        public UsuarioRepositoryImpl(GerenciadorDeTarefasContext context)
        {
            _context = context;
        }

        public bool ExisteEmailCadastrao(string email)
        {
            return _context.Usuario.Any(x => x.Email.ToLower() == email.ToLower());
        }

        public Usuario GetUsuarioByEmailSenha(string email, string senha)
        {
            return _context.Usuario.SingleOrDefault(x => x.Email.ToLower() == email.ToLower() && x.Senha == senha);
        }

        public void Salvar(Usuario usuario)
        {
            _context.Usuario.Add(usuario);
            _context.SaveChanges();
        }
    }
}
