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
                string constr = ConfigurationManager.ConnectionStrings["DBEcommerce"].ConnectionString;

                int imagefilelenth = fUpImg.PostedFile.ContentLength;
                byte[] imgarray = new byte[imagefilelenth];
                HttpPostedFile image = fUpImg.PostedFile;
                image.InputStream.Read(imgarray, 0, imagefilelenth);

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO produto VALUES(@nome, @quantidade, @descricao, @valorunitario, @quantidadelimite, @imagem)"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@nome", SqlDbType.VarChar).Value = txtNome.Text;
                        cmd.Parameters.AddWithValue("@quantidade", SqlDbType.Int).Value = int.Parse(txtQtd.Text);
                        cmd.Parameters.AddWithValue("@descricao", SqlDbType.VarChar).Value = txtDesc.Text;
                        cmd.Parameters.AddWithValue("@valorunitario", SqlDbType.Decimal).Value = decimal.Parse(txtVunit.Text);
                        cmd.Parameters.AddWithValue("@quantidadelimite", SqlDbType.Int).Value = int.Parse(txtLimit.Text);
                        cmd.Parameters.AddWithValue("@imagem", SqlDbType.Image).Value = imgarray;
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
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