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
    public partial class TCourseStudent : System.Web.UI.Page
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
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int row_id = e.RowIndex;
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("delete from Score where student_id=@SID and course_id=@CID", connection);
            cmd.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value = Label1.Text;
            cmd.Parameters.Add("@SID", SqlDbType.VarChar, 100).Value =
                ((Label)GridView1.Rows[row_id].FindControl("lsid")).Text;
            cmd.ExecuteNonQuery();

            //delete from exam
            SqlCommand cmd4 = new SqlCommand("delete from Exam where student_id=@SID and course_id=@CID", connection);
            cmd4.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value =Label1.Text;
            cmd4.Parameters.Add("@SID", SqlDbType.VarChar, 100).Value =
                 ((Label)GridView1.Rows[row_id].FindControl("lsid")).Text;
            cmd4.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("select exist from Course where code=@C", connection);
            cmd2.Parameters.Add("@C", SqlDbType.VarChar, 100).Value = Label1.Text;

            SqlDataAdapter adapter = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();
            adapter.Fill(ds);

            int exist_student=Convert.ToInt32( ds.Tables[0].Rows[0][0]);
            int new_exist = exist_student - 1;

            SqlCommand cmd3 = new SqlCommand("update Course set exist=@E  where code=@CID2", connection);
            cmd3.Parameters.Add("@CID2", SqlDbType.VarChar, 100).Value = Label1.Text;
            cmd3.Parameters.Add("@E", System.Data.SqlDbType.VarChar, 100).Value = new_exist;
            cmd3.ExecuteNonQuery();

        }
    }
}