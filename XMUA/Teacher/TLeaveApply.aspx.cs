using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA.Teacher
{
    public partial class TLeaveApply : System.Web.UI.Page
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
                name.Text = (string)Session["username"];
            }
        }

        protected void labutton_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("insert into Leave(id_number,name,matter,start_date,duration,approve) values(@UID,@N,@M,@SD,@D,@A)", connection);
            cmd.Parameters.AddWithValue("@UID", Session["id_number"]);
            cmd.Parameters.AddWithValue("@N", Session["username"]);
            cmd.Parameters.AddWithValue("@M", matter.SelectedValue);
            cmd.Parameters.AddWithValue("@D", duration.SelectedValue);
            cmd.Parameters.AddWithValue("@SD", Calendar1.SelectedDate);
            cmd.Parameters.AddWithValue("@A", 0);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            Result.Text = "Successfully Submitted";
        }
    }
}