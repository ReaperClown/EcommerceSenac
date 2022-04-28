using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoEcommerce___Prototype
{
    public class Utilities
    {
        public string connection
        {
            get
            {
                return System.Configuration.ConfigurationManager.ConnectionStrings["DBEcommerce"].ConnectionString;
            }
        }
    }

    public class Produto
    {
        public string Nome { get; set; }
        public string Quantidade { get; set; }
        public string Descricao { get; set; }
        public string ValorUnitario { get; set; }
        public string QuantidadeLimite { get; set; }
        public string Imagem { get; set; }
    }
}