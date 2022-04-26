using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace ProjetoEcommerce___Remaster
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // Código que é executado na inicialização do aplicativo
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            // Add Routes.
            RegisterCustomRoutes(RouteTable.Routes);


            ScriptResourceDefinition myScriptResDef = new ScriptResourceDefinition();
            myScriptResDef.Path = "~/Scripts/bootstrap.bundle.min.js";
            myScriptResDef.DebugPath = "~/Scripts/bootstrap.bundle.min.js";
            myScriptResDef.CdnPath = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js";
            myScriptResDef.CdnDebugPath = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js";
            ScriptManager.ScriptResourceMapping.AddDefinition("bootstrap", null, myScriptResDef);
        }

        void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "Home",
                "Home/",
                "~/Home.aspx"
            );
            routes.MapPageRoute(
                "Cliente",
                "Cliente/",
                "~/Pages/FormCliente.aspx"
            );
            routes.MapPageRoute(
                "Produto",
                "Produto/",
                "~/Pages/FormProduto.aspx"
            );
            routes.MapPageRoute(
                "Tipo_Pagamento",
                "Tipo_Pagamento/",
                "~/Pages/FormTipoPagamento.aspx"
            );
            routes.MapPageRoute(
                "Pedido",
                "Pedido",
                "~/Pages/FormPedido.aspx"
            );
        }
    }
}