using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA.Student
{
    public partial class Student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["id_number"] = null;
            Session["username"] = null;
            Session["user_id"] = null;
            Session["user_type"] = null;
            Response.Write("<script language=javascript>alert('You have Logout!')</script>");
            Response.Write("<script language=javascript>window.location.href='../Login.aspx'</script>");
        }
    }
}