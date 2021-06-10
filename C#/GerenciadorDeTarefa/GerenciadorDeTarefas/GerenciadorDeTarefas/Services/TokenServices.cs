using GerenciadorDeTarefas.Model;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace GerenciadorDeTarefas.Services
{
    public class TokenServices
    {
        public static string CriarToken(Usuario usuario)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var chaveCriptografiaBytes = Encoding.ASCII.GetBytes(ChaveJwt.chaveSecreta);
            var tokenDescriptografar = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[] {
                    new Claim(ClaimTypes.Sid, usuario.Id.ToString()),
                    new Claim(ClaimTypes.Name, usuario.Nome)
                }),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(chaveCriptografiaBytes), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptografar);
            return tokenHandler.WriteToken(token);
        }
    }
}
