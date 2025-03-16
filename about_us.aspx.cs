using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class about_us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getdata();
        }
    }

    public void getdata()
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string ssql = "select * from about_us";
        SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        aboutusdata.DataSource = ds;
        aboutusdata.DataBind();
    }


}