using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoEcommerce___Remaster
{
    public class ItemPedido
    {
        public int ID { get; set; }
        public String Pedido_ID { get; set; }
        public int Quantidade { get; set; }
        public decimal ValorUnitario { get; set; }
    }
}