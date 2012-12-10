using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class case_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void dsCaseDetails_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            //Show error message
            frmCaseDetails.Visible = false;
            lblError.Visible = true;
            lblError.Text = "The server is currently offline";

            //Set the exception handled property so it doesn't bubble-up
            e.ExceptionHandled = true;
        }
    }
    public void frmCaseDetails_Bound(object sender, EventArgs e)
    {
        Label Status = (Label)frmCaseDetails.FindControl("lblStatus");
        //Change status colour if call is closed
        if (Status != null)
        {
            if (Status.Text == "Complete")
            { Status.CssClass = "label label-important"; }
            else { Status.CssClass = "label label-success"; }
        }
    }
}