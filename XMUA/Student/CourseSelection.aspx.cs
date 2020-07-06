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
    public partial class CourseStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Write("<script language=javascript>alert('Access denied!')</script>");
                Response.Write("<script language=javascript>window.location.href='../Login.aspx'</script>");
            }
        }

        protected void btn_select_all_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; ++i)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("chk");
                chk.Checked = true;
            }
        }

        protected void btn_select_none_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; ++i)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("chk");
                chk.Checked = false;
            }
        }

        protected void select_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();


            for (int i = 0; i < GridView1.Rows.Count; ++i)
            {
                int exist_student =Convert.ToInt32( ((Label)GridView1.Rows[i].FindControl("Label7")).Text);
                if (exist_student <= 30)
                {


                    CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("chk");
                    if (chk.Checked == true)
                    {
                        int new_exist = exist_student + 1;
                        SqlCommand cmd2 = new SqlCommand("Select * from Score  where student_id=@SID1 and course_id=@CID1 ", connection);
                        cmd2.Parameters.Add("@CID1", SqlDbType.VarChar, 100).Value =
                           ((Label)GridView1.Rows[i].FindControl("Label1")).Text;
                        cmd2.Parameters.Add("@SID1", SqlDbType.VarChar, 100).Value =
                          (string)Session["id_number"];
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd2);
                        DataSet ds = new DataSet();

                        adapter.Fill(ds);

                        if (ds.Tables[0].Rows.Count == 0)
                        {
                            SqlCommand cmd3 = new SqlCommand("update Course set exist=@E  where code=@CID2", connection);
                            cmd3.Parameters.Add("@CID2", SqlDbType.VarChar, 100).Value =
                               ((Label)GridView1.Rows[i].FindControl("Label1")).Text;
                            cmd3.Parameters.Add("@E", System.Data.SqlDbType.VarChar, 100).Value = new_exist;
                            cmd3.ExecuteNonQuery();
                            SqlCommand cmd = new SqlCommand("insert into Score(course_id,course_name,teacher_name,student_id,mark)"
                            + "values(@CID3,@TN,@CN,@SID2,0.0)", connection);
                            cmd.Parameters.Add("@CID3", SqlDbType.VarChar, 100).Value =
                                ((Label)GridView1.Rows[i].FindControl("Label1")).Text;
                            cmd.Parameters.Add("@TN", SqlDbType.VarChar, 100).Value =
                                ((Label)GridView1.Rows[i].FindControl("Label3")).Text;
                            cmd.Parameters.Add("@CN", SqlDbType.VarChar, 100).Value =
                                ((Label)GridView1.Rows[i].FindControl("Label2")).Text;
                            cmd.Parameters.Add("@SID2", SqlDbType.VarChar, 100).Value =
                               (string)Session["id_number"];
                            cmd.ExecuteNonQuery();
                            alert.Text = "Select Successful!";

                        }
                        else
                        {
                            alert.Text = "Some Courses are already on your CourseList.";
                        }
                    }
                }
                else
                {
                    alert.Text = "The class is full!";
                }

            }
        }
    }
}