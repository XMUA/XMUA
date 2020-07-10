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
    public partial class ALeaveAudit : System.Web.UI.Page
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
                object obj = Request.Params["id"];
                if (obj != null)
                {
                    Label1.Text = (string)obj;
                }
                SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from Leave where id=@ID", connection);
                cmd.Parameters.Add("@ID", SqlDbType.VarChar, 100).Value = Label1.Text;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count == 0)
                {

                }
                else
                { 
                    idnumber.Text= (string)ds.Tables[0].Rows[0][1];
                    name.Text= (string)ds.Tables[0].Rows[0][2];
                    matter.Text= (string)ds.Tables[0].Rows[0][3];
                    startdate.Text=ds.Tables[0].Rows[0][4].ToString();
                    duration.Text=ds.Tables[0].Rows[0][5].ToString();
                }

             }
        }

        protected void Approve_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd1 = new SqlCommand("Update Leave  set approve=@A  where id=@ID", connection);
            cmd1.Parameters.Add("@ID", SqlDbType.VarChar, 100).Value = Label1.Text;
            cmd1.Parameters.Add("@A", SqlDbType.VarChar, 100).Value =1;

            cmd1.ExecuteNonQuery();
            Response.Redirect("ALeave.aspx");

        }

        protected void Reject_Click(object sender, EventArgs e)
        {

            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd1 = new SqlCommand("Update Leave  set approve=@A  where id=@ID", connection);
            cmd1.Parameters.Add("@ID", SqlDbType.VarChar, 100).Value = Label1.Text;
            cmd1.Parameters.Add("@A", SqlDbType.VarChar, 100).Value = 2;

            cmd1.ExecuteNonQuery();
            Response.Redirect("ALeave.aspx");
        }
    }
}