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
    public partial class AExamRelease : System.Web.UI.Page
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

        protected void release_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            for (int i = 0; i < GridView1.Rows.Count; ++i)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("chk");
                if (chk.Checked == true)
                {
                    SqlCommand cmd = new SqlCommand("Select * from Exam  where course_id=@CID", connection);
                    cmd.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value = ((Label)GridView1.Rows[i].FindControl("Label2")).Text;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);

                    if(ds.Tables[0].Rows.Count==0)
                    {
                        continue;
                    }
                    else
                    {
                        for(int j=0;j<ds.Tables[0].Rows.Count;++j)
                        {
                            SqlCommand cmd3 = new SqlCommand("update Exam set date=@DA,venue=@V, start_time=@ST,duration=@D  where course_id=@CID", connection);
                            cmd3.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value = ((Label)GridView1.Rows[i].FindControl("Label2")).Text;
                            cmd3.Parameters.Add("@DA",SqlDbType.VarChar,100).Value= ((Label)GridView1.Rows[i].FindControl("Label4")).Text;
                            cmd3.Parameters.Add("@V", SqlDbType.VarChar, 100).Value = ((Label)GridView1.Rows[i].FindControl("Label5")).Text;
                            cmd3.Parameters.Add("@ST", SqlDbType.VarChar, 100).Value = Convert.ToSingle(((Label)GridView1.Rows[i].FindControl("Label6")).Text);
                            cmd3.Parameters.Add("@D", SqlDbType.VarChar, 100).Value = Convert.ToInt32( ((Label)GridView1.Rows[i].FindControl("Label7")).Text);
                            cmd3.ExecuteNonQuery();
                        }
                    }
                    SqlCommand cmd2 = new SqlCommand("update ExamA set isrelease=@IRR  where course_id=@CID2", connection);
                    cmd2.Parameters.Add("@CID2", SqlDbType.VarChar, 100).Value =
                                   ((Label)GridView1.Rows[i].FindControl("Label2")).Text;
                    cmd2.Parameters.Add("@IRR", SqlDbType.VarChar, 100).Value = 1;
                    cmd2.ExecuteNonQuery();
                }
            }
            Response.Write("<script language=javascript>alert('RELEASE SUCCESSFUL!')</script>");
            Response.Write("<script language=javascript>window.location.href='AExamView.aspx'</script>");
        }
    }
}