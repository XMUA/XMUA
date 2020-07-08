using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA.Teacher
{
    public partial class TGScore : System.Web.UI.Page
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
                object obj = Request.Params["code"];
                if (obj != null)
                {
                    Label1.Text = (string)obj;
                }

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdatedEventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update Score set course_id=@CID, course_name=@CN,  mark=@M  where student_id = @SID and course_id=@CID1", connection);
            cmd.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value =
                ((Label)GridView1.Rows[GridView1.EditIndex].FindControl("lcid")).Text;
            cmd.Parameters.Add("@CID1", SqlDbType.VarChar, 100).Value =
               ((Label)GridView1.Rows[GridView1.EditIndex].FindControl("lcid")).Text;
            cmd.Parameters.Add("@CN", SqlDbType.VarChar, 100).Value =
                ((Label)GridView1.Rows[GridView1.EditIndex].FindControl("lcn")).Text;
            cmd.Parameters.Add("@M", SqlDbType.VarChar, 100).Value =
               ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("tbMark")).Text;
            cmd.Parameters.Add("@SID", SqlDbType.VarChar, 100).Value =
                ((Label)GridView1.Rows[GridView1.EditIndex].FindControl("lsid")).Text;
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
        }
    }
}