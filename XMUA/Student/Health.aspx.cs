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
    public partial class Health : System.Web.UI.Page
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
                string _day = DateTime.Now.DayOfYear.ToString();
                SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from Health where student_id=@IDN and date=@D", connection);
                cmd.Parameters.Add("@IDN", System.Data.SqlDbType.VarChar, 100).Value = Session["id_number"];
                cmd.Parameters.Add("@D", System.Data.SqlDbType.VarChar, 100).Value =_day;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                adapter.Fill(ds);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    Response.Redirect("SubmitFail.aspx");
                }
            }
        }

        protected void haButton_Click(object sender, EventArgs e)
        {
            string country;
            string temperature;
            string symptom;
            if(rbC.Checked == true)
            {
                country = "China";
            }
            else
            {
                country = "Malaysia";
            }
            if (rbL.Checked == true)
            {
                temperature = "Normal";
            }
            else
            {
                temperature = "Overheating";
            }
            if (rbNo.Checked == true)
            {
                symptom = "Health";
            }
            else
            {
                symptom = "Unhealth";
            }
            string _day= DateTime.Now.DayOfYear.ToString(); 
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd = new SqlCommand("insert into Health(date,country,temperature,student_id,symptom) values(@D,@C,@T,@SID,@S)", connection);
            cmd.Parameters.AddWithValue("@D",_day);
            cmd.Parameters.AddWithValue("@SID", Session["id_number"]); 
            cmd.Parameters.AddWithValue("@C",country );
            cmd.Parameters.AddWithValue("@T", temperature);
            cmd.Parameters.AddWithValue("@S", symptom);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            Response.Redirect("Success.aspx");
        }
    }
}