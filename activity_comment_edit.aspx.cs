using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class activity_comment_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void frmActivityComment_Updated(object sender, EventArgs e)
    { 
    Response.Redirect("activity_comments.aspx?aid=" + Request.QueryString["aid"].ToString());
    }
}