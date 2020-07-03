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
            string select_roles = "";
            select_roles = role.SelectedValue;

            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();

            SqlCommand cmd = new SqlCommand("select * from [User] where IDnumber=@IDN and password=@PWD and type=@TY", connection);
            cmd.Parameters.Add("@IDN", System.Data.SqlDbType.VarChar, 100).Value = idnumber.Text;
            cmd.Parameters.Add("@PWD", System.Data.SqlDbType.VarChar, 100).Value = password.Text;
            cmd.Parameters.Add("@TY", System.Data.SqlDbType.VarChar, 100).Value = select_roles;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            adapter.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                alert.Text = "Please check ID, Password and Role again!";
            }
            else
            {
                Session["id_number"] = idnumber.Text;
                Session["username"] = ds.Tables[0].Rows[0][1];
                Session["user_id"] = ds.Tables[0].Rows[0][0];
                Session["user_type"] = select_roles;
                if(select_roles=="1")
                {
                   Response.Redirect("/Student/StudentWelcome.aspx");
                }else if(select_roles == "2")
                {
                    Response.Redirect("/Teacher/TeacherWelcome.aspx");
                }
                else
                {
                    Response.Redirect("/Admin/AdminWelcome.aspx");
                    
                }
            }
        }
    }
}