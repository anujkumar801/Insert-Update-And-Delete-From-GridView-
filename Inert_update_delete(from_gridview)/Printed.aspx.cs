using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Inert_update_delete_from_gridview_
{
    public partial class Printed : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source = DESKTOP-5G55IRO\\SQLEXPRESS;initial catalog = menu_51026;integrated security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                showdata();
            }
        }
        public void showdata()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from printed", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            tbgved.DataSource = ds;
            tbgved.DataBind();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string EM = DateTime.Now.Ticks.ToString() + Path.GetFileName(fuimage.PostedFile.FileName);
            fuimage.SaveAs(Server.MapPath("Img1" + "\\" + EM));
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into printed(name,age,city,dob,image) values('"+tbname.Text+"','"+tbage.Text+"','"+tbcity.Text+"','"+tbdob.Text+"','"+EM+"')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            showdata();
            tbname.Text = " ";
            tbage.Text = " ";
            tbcity.Text = " ";
            tbdob.Text = " ";

        }

        protected void tbgved_RowEditing(object sender, GridViewEditEventArgs e)
        {
            tbgved.EditIndex = e.NewEditIndex;
            showdata();
        }

        protected void tbgved_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox tb1 = tbgved.Rows[e.RowIndex].FindControl("tbname10") as TextBox;
            TextBox tb2 = tbgved.Rows[e.RowIndex].FindControl("tbage10") as TextBox;
            TextBox tb3 = tbgved.Rows[e.RowIndex].FindControl("tbcity10") as TextBox;           
            FileUpload FU = tbgved.Rows[e.RowIndex].FindControl("fuimage10") as FileUpload;
            TextBox tb4 = tbgved.Rows[e.RowIndex].FindControl("tbdob10") as TextBox;
            string id = tbgved.DataKeys[e.RowIndex].Value.ToString();

            string EM = Path.GetFileName(FU.PostedFile.FileName);
            if (FU.HasFile)
            {
                string ext = Path.GetExtension(FU.PostedFile.FileName).ToLower();

                if (ext == ".png" || ext == ".jpeg" || ext == ".jpg")
                {
                    //EM = DateTime.Now.Ticks.ToString() + EM;
                    FU.SaveAs(Server.MapPath("Img1" + "\\" + EM));
                     

                    con.Open();
                    SqlCommand cmd = new SqlCommand("update printed set name = '" + tb1.Text + "' , age = '" + tb2.Text + "' , city = '" + tb3.Text + "',image = '" + EM + "', dob = '" + tb4.Text + "' where id = '" + id + "' ", con);
                    cmd.ExecuteNonQuery();
                    tbgved.EditIndex = -1;
                    con.Close();
                    showdata();
                }
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update printed set name = '" + tb1.Text + "' , age = '" + tb2.Text + "' , city = '" + tb3.Text + "', dob = '" + tb4.Text + "' where id = '" + id + "' ", con);
                cmd.ExecuteNonQuery();
                tbgved.EditIndex = -1;
                con.Close();
                showdata();
            }
            
           

        }

        protected void tbgved_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            tbgved.EditIndex = -1;
            showdata();
        }

        protected void tbgved_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = tbgved.DataKeys[e.RowIndex].Value.ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from printed where id = '"+id+"'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            showdata();
        }

        protected void tbgved_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {

                TextBox tb1 = tbgved.FooterRow.FindControl("tbname20") as TextBox;
                TextBox tb2 = tbgved.FooterRow.FindControl("tbage20") as TextBox;
                TextBox tb3 = tbgved.FooterRow.FindControl("tbcity20") as TextBox;
                TextBox tb4 = tbgved.FooterRow.FindControl("tbdob20") as TextBox;
                FileUpload FU1 = tbgved.FooterRow.FindControl("fuimage20") as FileUpload;

                string AK = Path.GetFileName(FU1.PostedFile.FileName);
                FU1.SaveAs(Server.MapPath("Img1" + "\\" + AK));
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into printed (name,age,city,image,dob) values('"+tb1.Text+"','"+tb2.Text+"','"+tb3.Text+"','"+AK+"','"+tb4.Text+"')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                showdata();
            }
        }
    }
}