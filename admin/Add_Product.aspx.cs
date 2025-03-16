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
using System.IO;

public partial class admin_Add_Product : System.Web.UI.Page
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
            bindcatdata(ddlcat);
        }
    }

    protected void btnaddproduct_Click(object sender, System.EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        string prosize = "";
        for(int i=0; i<=productsize.Items.Count-1; i++)
        {
            if(productsize.Items[i].Selected)
            {
                if(prosize=="")
                {
                    prosize = productsize.Items[i].Text;
                }
                else
                {
                    prosize += "," + productsize.Items[i].Text;
                }
            }
        }


        String sqlinsert = "insert into product values(@product_name, @cat_id, @product_price, @product_size, @product_description)";
        SqlCommand cmd = new SqlCommand(sqlinsert, con);
        cmd.Parameters.AddWithValue("@product_name", txtproductnm.Text);
        cmd.Parameters.AddWithValue("@cat_id", ddlcat.Text);
        cmd.Parameters.AddWithValue("@product_price", txtproductprice.Text);
        cmd.Parameters.AddWithValue("@product_size", prosize);
        cmd.Parameters.AddWithValue("@product_description", txtproductdescri.Text);

        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
        }

        SqlCommand cmd3 = new SqlCommand("select TOP(1) * FROM product ORDER BY product_id DESC", con);
        int PID = Convert.ToInt32(cmd3.ExecuteScalar().ToString());
        if (image1.HasFile)
        {
            string savepath = Server.MapPath("~/Images/") + PID;
            if(!Directory.Exists(savepath))
            {
                Directory.CreateDirectory(savepath);
            }
            string extension = Path.GetExtension(image1.PostedFile.FileName);
            image1.SaveAs(savepath + "\\" + txtproductnm.Text.ToString().Trim() + "01" +extension);
            string insertimg = "insert into product_image values(@PID, @Name)";
            SqlCommand cmd2 = new SqlCommand(insertimg, con);
            cmd2.Parameters.AddWithValue("@PID", PID);
            cmd2.Parameters.AddWithValue("@Name", txtproductnm.Text.ToString().Trim() + "01" + extension);
            cmd2.ExecuteNonQuery();
            Response.Redirect(Request.Url.ToString(), false);
        }

        if (image2.HasFile)
        {
            string savepath = Server.MapPath("~/Images/") + PID;
            if (!Directory.Exists(savepath))
            {
                Directory.CreateDirectory(savepath);
            }
            string extension = Path.GetExtension(image2.PostedFile.FileName);
            image2.SaveAs(savepath + "\\" + txtproductnm.Text.ToString().Trim() + "02" + extension);
            string insertimg = "insert into product_image values(@PID, @Name)";
            SqlCommand cmd2 = new SqlCommand(insertimg, con);
            cmd2.Parameters.AddWithValue("@PID", PID);
            cmd2.Parameters.AddWithValue("@Name", txtproductnm.Text.ToString().Trim() + "02" + extension);
            cmd2.ExecuteNonQuery();
            Response.Redirect(Request.Url.ToString(), false);
        }

        if (image3.HasFile)
        {
            string savepath = Server.MapPath("~/Images/") + PID;
            if (!Directory.Exists(savepath))
            {
                Directory.CreateDirectory(savepath);
            }
            string extension = Path.GetExtension(image3.PostedFile.FileName);
            image3.SaveAs(savepath + "\\" + txtproductnm.Text.ToString().Trim() + "03" + extension);
            string insertimg = "insert into product_image values(@PID, @Name)";
            SqlCommand cmd2 = new SqlCommand(insertimg, con);
            cmd2.Parameters.AddWithValue("@PID", PID);
            cmd2.Parameters.AddWithValue("@Name", txtproductnm.Text.ToString().Trim() + "03" + extension);
            cmd2.ExecuteNonQuery();
            Response.Redirect(Request.Url.ToString(), false);
        }

        if (image4.HasFile)
        {
            string savepath = Server.MapPath("~/Images/") + PID;
            if (!Directory.Exists(savepath))
            {
                Directory.CreateDirectory(savepath);
            }
            string extension = Path.GetExtension(image4.PostedFile.FileName);
            image4.SaveAs(savepath + "\\" + txtproductnm.Text.ToString().Trim() + "04" + extension);
            string insertimg = "insert into product_image values(@PID, @Name)";
            SqlCommand cmd2 = new SqlCommand(insertimg, con);
            cmd2.Parameters.AddWithValue("@PID", PID);
            cmd2.Parameters.AddWithValue("@Name", txtproductnm.Text.ToString().Trim() + "04" + extension);
            cmd2.ExecuteNonQuery();
            Response.Redirect(Request.Url.ToString(), false);
        }
        
    }


    public void getdata()
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        //SELECT product.product_id, product.product_name, category.cat_name, product.product_price, product.product_size, product.product_description
        //FROM category
        //JOIN product ON product.cat_id = category.cat_id
        //JOIN product_image ON product.product_id = product_image.product_id
        string ssql = "SELECT product.product_id, product.product_name, category.cat_name, product.product_price, product.product_size, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id = product_image.product_id) AS Name, product.product_description FROM product, category WHERE product.cat_id = category.cat_id ";
        SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        productlist.DataSource = ds;
        productlist.DataBind();
    }


    public void bindcatdata(DropDownList ddl)
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string ssql = "select * from category";
        SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddl.DataSource = dt;
        ddl.DataBind();
        ddl.DataTextField = "cat_name";
        ddl.DataValueField = "cat_id";
        ddl.DataBind();

    }

    protected void productlist_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();

        int product_id = Convert.ToInt32(productlist.DataKeys[e.RowIndex].Values[0]);
        String dsql = "delete from product where product_id=@product_id";
        SqlCommand cmd = new SqlCommand(dsql, con);
        cmd.Parameters.AddWithValue("@product_id", product_id);

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
            con.Close();
            getdata();
        }
    }
    protected void productlist_RowEditing(object sender, GridViewEditEventArgs e)
    {
        productlist.EditIndex = e.NewEditIndex;
        GridViewRow row = productlist.Rows[e.NewEditIndex];
            this.getdata();
    }
    protected void productlist_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        productlist.EditIndex = -1;
        this.getdata();
    }
    protected void productlist_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();

        GridViewRow row = productlist.Rows[e.RowIndex];
        int product_id = Convert.ToInt32(productlist.DataKeys[e.RowIndex].Values[0]);
        string catnm = (row.FindControl("ddlgrd") as DropDownList).SelectedItem.Value;
        String productnm = (row.FindControl("TextBox2") as TextBox).Text;
        //String catnm = (row.FindControl("ddlgrd") as DropDownList).SelectedIndex.ToString();
        String price = (row.FindControl("TextBox4") as TextBox).Text;
        String size = (row.FindControl("TextBox5") as TextBox).Text;
       // String description = (row.FindControl("TextBox6") as TextBox).Text;
        
        //

        String usql = "update product set product_name='" + productnm + "', cat_id='" + catnm + "', product_price ='" + price + "', product_size= '" + size + "' where product_id=" + product_id;

        SqlCommand cmd = new SqlCommand(usql, con);
        cmd.Parameters.AddWithValue("@product_name",productnm);
        cmd.Parameters.AddWithValue("@cat_id", catnm);
        cmd.Parameters.AddWithValue("@product_price",price);
        cmd.Parameters.AddWithValue("@product_size",size);
       // cmd.Parameters.AddWithValue("@product_description", description);


        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
            con.Close();
            getdata();
        }
        Response.Redirect("Add_Product.aspx");
    }
    protected void productlist_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        productlist.EditIndex = e.NewPageIndex;
        this.getdata();
    }
    protected void productlist_PreRender(object sender, System.EventArgs e)
    {

    }

    protected void productlist_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        //if (e.Row.RowType == DataControlRowType.DataRow && productlist.EditIndex == e.Row.RowIndex)
        //{
        //    DropDownList ddlgrd = (DropDownList)e.Row.FindControl("ddlgrd");
        //    String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        //    SqlConnection con = new SqlConnection(strcon);
        //    con.Open();
        //    string ssql = "select * from category";
        //    SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    ddlgrd.DataSource = dt;
        //    ddlgrd.DataBind();
        //    ddlgrd.DataTextField = "cat_name";
        //    ddlgrd.DataValueField = "cat_id";
        //    ddlgrd.DataBind();
        //    string selectedCity = DataBinder.Eval(e.Row.DataItem, "cat_name").ToString();
        //    ddlgrd.Items.FindByValue(selectedCity).Selected = true;
        //}
        if (e.Row.RowType == DataControlRowType.DataRow && productlist.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlgrd = (DropDownList)e.Row.FindControl("ddlgrd");
            string sql = "select * from category";
            String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlgrd.DataSource = dt;
                        ddlgrd.DataTextField = "cat_name";
                        ddlgrd.DataValueField = "cat_id";
                        ddlgrd.DataBind();
                        string selectedCity = DataBinder.Eval(e.Row.DataItem, "cat_name").ToString();
                        // ddlgrd.Items.FindByValue(selectedCity).Selected = true;
                        if (ddlgrd.Items.FindByValue("ddlgrd") != null)
                            ddlgrd.Items.FindByValue("ddlgrd").Selected = true;
                    }
                }
            }
        }
    }
}