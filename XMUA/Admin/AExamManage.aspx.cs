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
    public partial class AExamMangement : System.Web.UI.Page
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
                    object obj = Request.Params["course_id"];
                    if (obj != null)
                    {
                        coursecode.Text = (string)obj;
                    }
                    SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("select * from ExamA where course_id=@CODE", connection);
                    cmd.Parameters.Add("@CODE", SqlDbType.VarChar, 100).Value = Request.Params["course_id"];
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    adapter.Fill(ds);

                    if (ds.Tables[0].Rows.Count == 0)
                    {

                    }
                    else
                    {
                        coursename.Text = (string)ds.Tables[0].Rows[0][2];
                    }
                }
            }
         }

        protected void save_Click(object sender, EventArgs e)
        {
            string year = "", month = "", day = "";
            year = ddlYear.SelectedValue;
            month = ddlMonth.SelectedValue;
            day = ddlDay.SelectedValue;
            string date = year + "-"+month + "-" + day;
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update ExamA set date=@DA,venue=@V,start_time=@ST,duration=@D where course_id=@CID", connection);
            cmd.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value = coursecode.Text;
            cmd.Parameters.Add("@ST", SqlDbType.VarChar, 100).Value = Convert.ToSingle( ddlST.SelectedValue);
            cmd.Parameters.Add("@D", SqlDbType.VarChar, 100).Value = ddlDuration.SelectedValue;
            cmd.Parameters.Add("@V", SqlDbType.VarChar, 100).Value = ddlVenue.SelectedValue;
            cmd.Parameters.Add("@DA", SqlDbType.VarChar, 100).Value = date;
            cmd.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('EDIT SUCCESSFUL!')</script>");
            Response.Write("<script language=javascript>window.location.href='AExamView.aspx'</script>");
        }
    }
}