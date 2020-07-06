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
    public partial class TimeTable : System.Web.UI.Page
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
                SqlConnection connection = new SqlConnection("Server=DESKTOP-AD15ROA\\SQLEXPRESS;UId=xmum;Password=123456;Database=XMUA");
                connection.Open();
                SqlCommand cmd = new SqlCommand("Select course_id from Score  where student_id=@SID ", connection);
                cmd.Parameters.Add("@SID", SqlDbType.VarChar, 100).Value =
                  (string)Session["id_number"];
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                {

                }
                else
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        string course_code = (string)ds.Tables[0].Rows[i][0];
                        int day ;
                        int start ;
                        int end;
                        SqlCommand cmd2 = new SqlCommand("Select * from Timetable  where course_id=@CID ", connection);
                        cmd2.Parameters.Add("@cid", SqlDbType.VarChar, 100).Value =
                          course_code;
                        SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
                        DataSet ds2 = new DataSet();
                        adapter2.Fill(ds2);
                        if (ds2.Tables[0].Rows.Count == 0)
                        {

                        }
                        else
                        {
                            string course_info = "";
                            day =Convert.ToInt32( ds2.Tables[0].Rows[0][3]);
                            start = Convert.ToInt32(ds2.Tables[0].Rows[0][4]);

                            SqlCommand cmd3 = new SqlCommand("Select * from Course  where code=@CID ", connection);
                            cmd3.Parameters.Add("@CID", SqlDbType.VarChar, 100).Value =
                              course_code;
                            SqlDataAdapter adapter3 = new SqlDataAdapter(cmd3);
                            DataSet ds3 = new DataSet();
                            adapter3.Fill(ds3);

                            string course_name = (string)ds3.Tables[0].Rows[0][2];
                            string course_lecturer = ds3.Tables[0].Rows[0][3].ToString();
                            string course_venue = (string)ds3.Tables[0].Rows[0][4].ToString();

                            course_info = course_code + " " + course_name + " "+course_lecturer+" "  + course_venue;

                            switch (day)
                            {
                                case 1:
                                    if (start == 8)
                                    {
                                        D1C1.Text = course_info;
                                    }
                                    else if (start == 10)
                                    {
                                        D1C2.Text = course_info;
                                    }
                                    else if (start == 2)
                                    {
                                        D1C3.Text = course_info;
                                    }
                                    else if (start == 4)
                                    {
                                        D1C4.Text = course_info;
                                    }
                                    break;
                                case 2:
                                    if (start == 8)
                                    {
                                        D2C1.Text = course_info;
                                    }
                                    else if (start == 10)
                                    {
                                        D2C2.Text = course_info;
                                    }
                                    else if (start == 2)
                                    {
                                        D2C3.Text = course_info;
                                    }
                                    else if (start == 4)
                                    {
                                        D2C4.Text = course_info;
                                    }

                                    break;
                                case 3:
                                    if (start == 8)
                                    {
                                        D3C1.Text = course_info;
                                    }
                                    else if (start == 10)
                                    {
                                        D3C2.Text = course_info;
                                    }
                                    else if (start == 2)
                                    {
                                        D3C3.Text = course_info;
                                    }
                                    else if (start == 4)
                                    {
                                        D3C4.Text = course_info;
                                    }

                                    break;
                                case 4:
                                    if (start == 8)
                                    {
                                        D4C1.Text = course_info;
                                    }
                                    else if (start == 10)
                                    {
                                        D4C2.Text = course_info;
                                    }
                                    else if (start ==2)
                                    {
                                        D4C3.Text = course_info;
                                    }
                                    else if (start == 4)
                                    {
                                        D4C4.Text = course_info;
                                    }

                                    break;
                                case 5:
                                    if (start == 8)
                                    {
                                        D5C1.Text = course_info;
                                    }
                                    else if (start == 10)
                                    {
                                        D5C2.Text = course_info;
                                    }
                                    else if (start == 2)
                                    {
                                        D5C3.Text = course_info;
                                    }
                                    else if (start == 4)
                                    {
                                        D5C4.Text = course_info;
                                    }

                                    break;

                            }
                        }

                    }


                }
            }

        }
    }
}