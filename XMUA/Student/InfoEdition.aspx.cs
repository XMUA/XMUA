using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA.Student
{
    public partial class InfoEdition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Write("<script language=javascript>alert('Access denied!')</script>");
                Response.Write("<script language=javascript>window.location.href='../Login.aspx'</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                    SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
                    connection.Open();

                    SqlCommand cmd = new SqlCommand("select * from Users where IDnumber=@IDN", connection);
                    cmd.Parameters.Add("@IDN", System.Data.SqlDbType.VarChar, 100).Value = (string)Session["id_number"];
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    adapter.Fill(ds);

                    tbusername.Text= (string)ds.Tables[0].Rows[0][1];
                    tbpn.Text= (string)ds.Tables[0].Rows[0][5];
                    idnumber.Text = (string)Session["id_number"];
                    programme.Text = (string)ds.Tables[0].Rows[0][6];
                    intake.Text = (string)ds.Tables[0].Rows[0][7];
                    nationaliry.Text = (string)ds.Tables[0].Rows[0][8];
                }


            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update Users set username=@Name, phonenumber=@PN  where IDnumber=@IDN", connection);
            cmd.Parameters.Add("@Name", System.Data.SqlDbType.VarChar, 100).Value = tbusername.Text;
            cmd.Parameters.Add("@PN", System.Data.SqlDbType.VarChar, 100).Value = tbpn.Text;
            cmd.Parameters.Add("@IDN", System.Data.SqlDbType.VarChar, 100).Value = (string)Session["id_number"];
            
            cmd.ExecuteNonQuery();
            Session["username"] = tbusername.Text;
            Response.Redirect("Info.aspx");
        }
    }
}