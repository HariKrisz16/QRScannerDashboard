using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QRApp
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime startdate = Convert.ToDateTime(TextBox3.Text);
            DateTime enddate = Convert.ToDateTime(TextBox4.Text);
            string amount = DropDownList1.SelectedValue;

            SqlDataAdapter da;
            SqlConnection con;
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();


            con = new SqlConnection(ConfigurationSettings.AppSettings["connect"]);
            cmd.Connection = con;

            con.Open();


            cmd.CommandText = "SELECT * FROM qrappoinment WHERE CAST(CONVERT(CHAR(10), CONVERT(DATETIME, intime, 105), 101) AS DATE) BETWEEN CAST(CONVERT(CHAR(10), CONVERT(DATETIME, '"+startdate+"', 105), 101) AS DATE) AND CAST(CONVERT(CHAR(10), CONVERT(DATETIME, '"+enddate+"', 105), 101) AS DATE)";
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cmd.ExecuteNonQuery();
            con.Close();
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {


            bool WithIntime = RadioButtonList1.SelectedValue == "0" ? true : false;

            SqlDataAdapter da;
            SqlConnection con;
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();


            con = new SqlConnection(ConfigurationSettings.AppSettings["connect"]);
            cmd.Connection = con;

            con.Open();
            if (WithIntime)
            {
                cmd.CommandText = "select * from qrappoinment where intime is not null";
            }
            else
            {
                cmd.CommandText = "select * from qrappoinment where intime is  null";
            }
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cmd.ExecuteNonQuery();
            con.Close();
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string amount = DropDownList1.SelectedValue;

            SqlDataAdapter da;
            SqlConnection con;
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();


            con = new SqlConnection(ConfigurationSettings.AppSettings["connect"]);
            cmd.Connection = con;

            con.Open();


            cmd.CommandText = "SELECT * FROM qrappoinment WHERE AMOUNT = '" + amount + "' ";
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cmd.ExecuteNonQuery();
            con.Close();
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
    }
}