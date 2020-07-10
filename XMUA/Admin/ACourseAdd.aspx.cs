using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA.Admin
{
    public partial class ACourseAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Write("<script language=javascript>alert('Access denied!')</script>");
                Response.Write("<script language=javascript>window.location.href='../Login.aspx'</script>");
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string time="";
            int d = Convert.ToInt32(ddlDay.SelectedValue);
            string day = "";
            string start_time =ddlST1.SelectedValue+".00"+ddlST2.SelectedValue;
            string end_time = ddlET1.SelectedValue + ".00" + ddlET2.SelectedValue;
            switch (d)
            {
                case 1:
                    day = "Mon.";
                    break;
                case 2:
                    day = "Tue.";
                    break;
                case 3:
                    day = "Wed.";
                    break;
                case 4:
                    day = "Thu.";
                    break;
                case 5:
                    day = "Fri.";
                    break;
            }
            time = day +" "+ start_time +"-" + end_time;
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("insert into Course(code,name,lecturer,venue,timeline,capacity,exist)"
                            + "values(@CID,@CN,@L,@V,@T,@C,0)", connection);
            cmd.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value = coursecode.Text;
            cmd.Parameters.Add("@CN", SqlDbType.VarChar, 100).Value = coursename.Text;
            cmd.Parameters.Add("@L", SqlDbType.VarChar, 100).Value = ddlLecturer.SelectedValue;
            cmd.Parameters.Add("@V", SqlDbType.VarChar, 100).Value = ddlVenue.SelectedValue;
            cmd.Parameters.Add("@T", SqlDbType.VarChar, 100).Value = time;
            cmd.Parameters.Add("@C", SqlDbType.VarChar, 100).Value = Convert.ToInt32( ddlCapacity.SelectedValue);

            cmd.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("insert into Timetable(course_id,course_name,day,start_time)"
                          + "values(@CID1,@CN1,@D,@ST)", connection);
            cmd2.Parameters.Add("@CID1", SqlDbType.VarChar, 100).Value = coursecode.Text;
            cmd2.Parameters.Add("@CN1", SqlDbType.VarChar, 100).Value = coursename.Text;
            cmd2.Parameters.Add("@D", SqlDbType.VarChar, 100).Value = Convert.ToInt32( ddlDay.SelectedValue);
            cmd2.Parameters.Add("@ST", SqlDbType.VarChar, 100).Value = Convert.ToInt32(ddlST1.SelectedValue);
            cmd2.ExecuteNonQuery();

            SqlCommand cmd3 = new SqlCommand("insert into ExamA(course_id,course_name) values(@CID2,@CN2)", connection);
            cmd3.Parameters.Add("@CID2", SqlDbType.VarChar, 100).Value = coursecode.Text;
            cmd3.Parameters.Add("@CN2", SqlDbType.VarChar, 100).Value = coursename.Text;
            cmd3.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('ADD SUCCESSFUL!')</script>");
            Response.Write("<script language=javascript>window.location.href='ACourseView.aspx'</script>");
        }
    }
}