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

namespace ProjetoEcommerce___Remaster.Pages
{
    public partial class FormProduto : System.Web.UI.Page
    {
        Utilities utils = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvProduto.DataSource = null;
        }

        protected void gvProduto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (string.Compare(e.Row.Cells[i].Text, "descricao", true) == 0)
                    {
                        e.Row.Cells[i].Text = "descrição";
                    }
                    if (string.Compare(e.Row.Cells[i].Text, "valorunitario", true) == 0)
                    {
                        e.Row.Cells[i].Text = "valor unitário";
                    }
                    if (string.Compare(e.Row.Cells[i].Text, "quantidadelimite", true) == 0)
                    {
                        e.Row.Cells[i].Text = "quantidade limite";
                    }
                }
            }
        }

        protected void gvProduto_PreRender(object sender, EventArgs e)
        {
            var gridView = (GridView)sender;
            var header = (GridViewRow)gridView.Controls[0].Controls[0];

            header.Cells[0].Visible = false;
            header.Cells[1].ColumnSpan = 2;
            header.Cells[1].Text = "comandos";
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
                
        }

        [WebMethod]
        public static void SaveProd(string Nome, int Quantidade, string Descricao, decimal ValorUnitario, int QuantidadeLimite, string Imagem)
        {
            byte[] bytes = Convert.FromBase64String(Imagem);
            Utilities utils = new Utilities();

            using (SqlConnection con = new SqlConnection(utils.connection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO produto VALUES(@nome, @quantidade, @descricao, @valorunitario, @quantidadelimite, @imagem)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@nome", Nome);
                    cmd.Parameters.AddWithValue("@quantidade", Quantidade);
                    cmd.Parameters.AddWithValue("@descricao", Descricao);
                    cmd.Parameters.AddWithValue("@valorunitario", ValorUnitario);
                    cmd.Parameters.AddWithValue("@quantidadelimite", QuantidadeLimite);
                    cmd.Parameters.AddWithValue("@imagem", bytes);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}