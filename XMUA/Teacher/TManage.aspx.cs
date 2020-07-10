using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA.Teacher
{
    public partial class TManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Write("<script language=javascript>alert('Access denied!')</script>");
                Response.Write("<script language=javascript>window.location.href='../Login.aspx'</script>");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update Users set password=@PW  where IDnumber=@IDN and password=@PW1", connection);
            cmd.Parameters.Add("@PW1", System.Data.SqlDbType.VarChar, 100).Value = tbold.Text;
            cmd.Parameters.Add("@PW", System.Data.SqlDbType.VarChar, 100).Value = tbnew.Text;
            cmd.Parameters.Add("@IDN", System.Data.SqlDbType.VarChar, 100).Value = (string)Session["id_number"];

            cmd.ExecuteNonQuery();
            Response.Redirect("../Login.aspx");
        }
    }
}