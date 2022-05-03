using ProjetoEcommerce___Prototype;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace ProjetoEcommerce___Remaster
{
    /// <summary>
    /// Descrição resumida de GetProdDetail
    /// </summary>
    public class GetProdDetail : IHttpHandler
    {
        Utilities utils = new Utilities();
        public void ProcessRequest(HttpContext context)
        {
            int id = 0;
            int.TryParse(context.Request.QueryString["id"], out id);
            string json = this.GetCustomersJSON(id);

            context.Response.ContentType = "text/json";
            context.Response.Write(json);
        }

        private string GetCustomersJSON(int id)
        {
            List<object> prod = new List<object>();
            using (SqlConnection conn = new SqlConnection(utils.connection))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT quantidade,valorunitario FROM produto WHERE id = @id";
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            prod.Add(new
                            {
                                Quantidade = sdr["quantidade"],
                                ValorUnitario = sdr["valorunitario"],
                            });
                        }
                    }
                    conn.Close();
                }
                return (new JavaScriptSerializer().Serialize(prod));
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}