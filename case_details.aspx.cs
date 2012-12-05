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