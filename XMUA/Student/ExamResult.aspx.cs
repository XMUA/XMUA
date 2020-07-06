using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA.Student
{
    public partial class ExamResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Write("<script language=javascript>alert('Access denied!')</script>");
                Response.Write("<script language=javascript>window.location.href='../Login.aspx'</script>");
            }
            float total_gpa = 0;
            for(int i=0;i< GridView1.Rows.Count;i++)
            {
                total_gpa+= Convert.ToSingle(((Label)GridView1.Rows[i].FindControl("Label1")).Text);
            }
            cgpa.Text = (total_gpa / (GridView1.Rows.Count)).ToString("F2");

        }
    }
}