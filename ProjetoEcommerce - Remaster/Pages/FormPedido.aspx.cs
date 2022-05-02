using ProjetoEcommerce___Prototype;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoEcommerce___Remaster
{
    public partial class FormPedido : System.Web.UI.Page
    {
        Utilities utils = new Utilities();
        public string endereco { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetAddres(string id)
        {
            string rua, numero, cep, cidade, uf;
            using (SqlConnection con = new SqlConnection(utils.connection))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT rua,numero,cep,cidade,uf FROM cliente WHERE id=" + id;

                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    rua = rd["rua"].ToString();
                    numero = rd["numero"].ToString();
                    cep = rd["cep"].ToString();
                    cidade = rd["cidade"].ToString();
                    uf = rd["uf"].ToString();


                    endereco = $"Endereço:\nRua {rua}, Nº {numero}, CEP: {cep}\n {cidade}-{uf}";
                    break;
                }
                rd.Close();
            }
            return endereco;
        }
    }
}