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
}