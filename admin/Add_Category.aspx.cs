using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



public partial class admin_Add_Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            getdata();
        }

    }


    public void getdata()
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string ssql = "select * from category";
        SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        grd_product_data.DataSource = ds;
        grd_product_data.DataBind();
    }


    protected void grddata_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grd_product_data.EditIndex = e.NewEditIndex;
        this.getdata();
    }
    protected void grddata_RowCancleEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grd_product_data.EditIndex = -1;
        this.getdata();
    }

    protected void grddata_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = grd_product_data.Rows[e.RowIndex];
        int cat_id = Convert.ToInt32(grd_product_data.DataKeys[e.RowIndex].Values[0]);
        String catnm = (row.FindControl("TextBox2") as TextBox).Text;

        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();

        String usql = "update category set cat_name='" + catnm + "' where cat_id=" + cat_id;

        SqlCommand cmd = new SqlCommand(usql, con);
        cmd.Parameters.AddWithValue("@cat_name", catnm);


        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
            con.Close();
            getdata();
        }
        Response.Redirect("Add_Category.aspx");
    }


    protected void grddata_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();

        int cat_id = Convert.ToInt32(grd_product_data.DataKeys[e.RowIndex].Values[0]);
        String dsql = "delete from category where cat_id=@cat_id";
        SqlCommand cmd = new SqlCommand(dsql, con);
        cmd.Parameters.AddWithValue("@cat_id", cat_id);

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
            con.Close();
            getdata();
        }
    }



    protected void grddata_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_product_data.EditIndex = e.NewPageIndex;
        this.getdata();
    }


    protected void grddata_PreRender(object sender, EventArgs e)
    {

    }



    protected void btn_addcat(object sender, System.EventArgs e)
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();

        String sqlinsert = "insert into category values(@cat_name)";
        SqlCommand cmd = new SqlCommand(sqlinsert, con);
        cmd.Parameters.AddWithValue("@cat_name", txtcatnm.Text);

        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
            txtcatnm.Text = "";
        }
    }
}