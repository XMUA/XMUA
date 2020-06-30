using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginb_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from [User] where username=@UN and password=@PWD", connection);
            cmd.Parameters.Add("@UN", System.Data.SqlDbType.VarChar, 100).Value = username.Text;
            cmd.Parameters.Add("@PWD", System.Data.SqlDbType.VarChar, 100).Value = password.Text;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            adapter.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Redirect("Fail.aspx");
            }
            else
            {

                    Session["username"] = username.Text;
                    Session["user_id"] = ds.Tables[0].Rows[0][0];
                    Response.Redirect("Success.aspx");

            }
        }
    }
}