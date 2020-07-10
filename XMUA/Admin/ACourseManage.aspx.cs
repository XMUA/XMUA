using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace XMUA.Admin
{
    public partial class ACourseManage : System.Web.UI.Page
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
                if (!IsPostBack) {
                    object obj = Request.Params["code"];
                    if (obj != null)
                    {
                        coursecode.Text = (string)obj;
                    }
                    SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("select * from Course where code=@CODE", connection);
                    cmd.Parameters.Add("@CODE", SqlDbType.VarChar, 100).Value = Request.Params["code"];
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    adapter.Fill(ds);

                    if (ds.Tables[0].Rows.Count == 0)
                    {

                    }
                    else
                    {
                        coursename.Text = (string)ds.Tables[0].Rows[0][2];
                        ddlLecturer.SelectedValue = (string)ds.Tables[0].Rows[0][3];
                        ddlVenue.SelectedValue = (string)ds.Tables[0].Rows[0][4];
                        ddlCapacity.SelectedValue = ds.Tables[0].Rows[0][6].ToString();

                        SqlCommand cmd2 = new SqlCommand("select * from Timetable where course_id=@CID", connection);
                        cmd2.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value = Request.Params["code"];
                        SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
                        DataSet ds2 = new DataSet();
                        id1.Text = ds.Tables[0].Rows[0][0].ToString();
                        exist.Text = ds.Tables[0].Rows[0][7].ToString();
                        adapter2.Fill(ds2);
                        if (ds2.Tables[0].Rows.Count == 0)
                        {

                        }
                        else
                        {
                            ddlDay.SelectedValue = ds2.Tables[0].Rows[0][3].ToString();
                            id2.Text = ds.Tables[0].Rows[0][0].ToString();
                            string st1, st2 = "", et1 = "", et2 = "";

                            st1 = ds2.Tables[0].Rows[0][4].ToString();
                            switch (st1)
                            {
                                case "2":
                                    st2 = "pm";
                                    et1 = "4";
                                    et2 = "pm";
                                    break;
                                case "4":
                                    st2 = "pm";
                                    et1 = "6";
                                    et2 = "pm";
                                    break;
                                case "8":
                                    st2 = "am";
                                    et1 = "10";
                                    et2 = "am";
                                    break;
                                case "10":
                                    st2 = "am";
                                    et1 = "12";
                                    et2 = "pm";
                                    break;

                            }
                            ddlST1.SelectedValue = st1;
                            ddlST2.SelectedValue = st2;
                            ddlET1.SelectedValue = et1;
                            ddlET2.SelectedValue = et2;

                        }


                    }

                }

            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            string time = "";
            int d = Convert.ToInt32(ddlDay.SelectedValue);
            string day = "";
            string start_time = ddlST1.SelectedValue + ".00" + ddlST2.SelectedValue;
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
            time = day + " " + start_time + "-" + end_time;
            SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
            connection.Open();
            SqlCommand cmd3 = new SqlCommand("update Course set code=@CID,name=@CN,lecturer=@L,venue=@V,timeline=@T,capacity=@C,exist=@E where id=@ID1", connection);
            cmd3.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value = coursecode.Text;
            cmd3.Parameters.Add("@CN", SqlDbType.VarChar, 100).Value = coursename.Text;
            cmd3.Parameters.Add("@L", SqlDbType.VarChar, 100).Value = ddlLecturer.SelectedValue;
            cmd3.Parameters.Add("@V", SqlDbType.VarChar, 100).Value = ddlVenue.SelectedValue;
            cmd3.Parameters.Add("@T", SqlDbType.VarChar, 100).Value = time;
            cmd3.Parameters.Add("@C", SqlDbType.VarChar, 100).Value = Convert.ToInt32(ddlCapacity.SelectedValue);
            cmd3.Parameters.Add("@E", SqlDbType.VarChar, 100).Value = Convert.ToInt32(exist.Text);
            cmd3.Parameters.Add("@ID1", SqlDbType.VarChar, 100).Value = Convert.ToInt32( id1.Text);
            cmd3.ExecuteNonQuery();

            SqlCommand cmd4 = new SqlCommand("update Timetable set course_id=@CID1,course_name=@CN1,day=@D,start_time=@ST where id=@ID2", connection);
            cmd4.Parameters.Add("@CID1", SqlDbType.VarChar, 100).Value = coursecode.Text;
            cmd4.Parameters.Add("@CN1", SqlDbType.VarChar, 100).Value = coursename.Text;
            cmd4.Parameters.Add("@D", SqlDbType.VarChar, 100).Value = Convert.ToInt32(ddlDay.SelectedValue);
            cmd4.Parameters.Add("@ST", SqlDbType.VarChar, 100).Value = Convert.ToInt32(ddlST1.SelectedValue);
            cmd4.Parameters.Add("@ID2", SqlDbType.VarChar, 100).Value = Convert.ToInt32(id2.Text);
            cmd4.ExecuteNonQuery();


            Response.Write("<script language=javascript>alert('EDIT SUCCESSFUL!')</script>");
            Response.Write("<script language=javascript>window.location.href='ACourseView.aspx'</script>");
        }
    }
}