using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QRApp
{
    public partial class QRApp : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void TxtScannedQRVAlue_TextChanged(object sender, EventArgs e)
        {
            SqlDataAdapter da;
            SqlConnection con;
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();


            con = new SqlConnection(ConfigurationSettings.AppSettings["connect"]);
            cmd.Connection = con;

            con.Open();

            //cmd.CommandText = "select * from qrappoinment where qrkey like '%"+TxtScannedQRVAlue.Text+"%'";
            cmd.CommandText = "select * from qrappoinment where qrkey='" + TxtScannedQRVAlue.Text + "'";

            int key = Convert.ToInt32(cmd.ExecuteScalar());
            if(key != 0)
            {
                cmd.CommandText = "select intime from qrappoinment where qrkey='" + TxtScannedQRVAlue.Text + "'";
                try
                {
                    DateTime intime = Convert.ToDateTime(cmd.ExecuteScalar());
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record found intime already available "+intime+" ')", true);

                }
                catch
                {
                    cmd.CommandText = "update qrappoinment set intime= GETDATE() where qrkey ='" + TxtScannedQRVAlue.Text + "'";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record found and Intime Inserted Successfully')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record not found')", true);
            }
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cmd.ExecuteNonQuery();
            con.Close();

        }
    }
}