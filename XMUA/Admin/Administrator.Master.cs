using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMUA.Admin
{
    public partial class Administrator : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user_type = (string)Session["user_type"];
            if (user_type!="3")
            {
                Response.Write("<script language=javascript>alert('You are not Admin!')</script>");
                Response.Write("<script language=javascript>window.location.href='../Login.aspx'</script>");
            }
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