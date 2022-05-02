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
    /// Descrição resumida de GetAddress
    /// </summary>
    public class GetAddress : IHttpHandler
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
            List<object> cliente = new List<object>();
            using (SqlConnection conn = new SqlConnection())
            {
                using (SqlCommand cmd = new SqlCommand(utils.connection))
                {
                    cmd.CommandText = "SELECT * FROM cliente WHERE id = @id";
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            cliente.Add(new
                            {
                                Rua = sdr["rua"],
                                Numero = sdr["numero"],
                                CEP = sdr["cep"],
                                Cidade = sdr["cidade"],
                            });
                        }
                    }
                    conn.Close();
                }
                return (new JavaScriptSerializer().Serialize(cliente));
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