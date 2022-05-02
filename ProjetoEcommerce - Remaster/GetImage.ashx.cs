using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace ProjetoEcommerce___Remaster
{
    /// <summary>
    /// Summary description for GetImage
    /// </summary>
    public class GetImage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Int32 id;
            if (context.Request.QueryString["id"] != null)
                id = Convert.ToInt32(context.Request.QueryString["id"]);
            else
                throw new ArgumentException("No parameter specified");

            context.Response.ContentType = "image/jpeg";
            Stream strm = DisplayImage(id);
            byte[] buffer = new byte[2048];
            int byteSeq = strm.Read(buffer, 0, 2048);

            while (byteSeq > 0)
            {
                context.Response.OutputStream.Write(buffer, 0, byteSeq);
                byteSeq = strm.Read(buffer, 0, 2048);
            }
        }

        public Stream DisplayImage(int id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBEcommerce - Work"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                string sql = "SELECT imagem FROM produto WHERE id = @id";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Parameters.AddWithValue("@id", id);
                    connection.Open();
                    object img = cmd.ExecuteScalar();
                    try
                    {
                        return new MemoryStream((byte[])img);
                    }
                    catch
                    {
                        return null;
                    }
                    finally
                    {
                        cmd.Dispose();
                        connection.Close();
                        connection.Dispose();

                    }
                }
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