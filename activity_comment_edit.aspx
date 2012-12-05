<%@ Page Title="" Language="C#" MasterPageFile="~/crmAdmin.master" AutoEventWireup="true"
    CodeFile="activity_comment_edit.aspx.cs" Inherits="activity_comment_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPH" runat="Server">
    <asp:SqlDataSource ID="dsActivityComment" runat="server" ProviderName="<%$ ConnectionStrings:crmCS.ProviderName %>"
        ConnectionString="<%$ ConnectionStrings:crmCS %>" SelectCommand="SELECT * FROM gtch_comment WHERE id = :cmnt_id ORDER BY time_created DESC"
        UpdateCommand="UPDATE gtch_comment SET time_created = :time_created WHERE id = :cmnt_id">
        <SelectParameters>
            <asp:QueryStringParameter Name="cmnt_id" Type="Int32" QueryStringField="cmnt" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="time_created" Type="datetime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="frmActivityComment" runat="server" DataSourceID="dsActivityComment"
        DefaultMode="Edit" OnItemUpdated="frmActivityComment_Updated">
        <EditItemTemplate>
            <h3>
                Change activity comment</h3>
            <div class="well span12">
                <h3>
                    Date</h3>
                <asp:TextBox ID="txtDateCreated" runat="server" ClientIDMode="Static" CssClass="span2"
                    Text='<%# Bind("TIME_CREATED", "{0:dd-MM-yyyy}")%>' onpaste="return false;" onkeypress="return isAnyKey(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqDate" runat="server" ErrorMessage="Please select a date"
                    ValidationGroup="Add" ControlToValidate="txtDateCreated" Display="None"></asp:RequiredFieldValidator><br />
                <asp:Button ID="btnSave" runat="server" Text="Save changes" CssClass="btn btn-success"
                    CommandName="Update" />
            </div>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <p class="alert alert-error">
                <strong>Hmm... </strong>I can't find that comment.</p>
        </EmptyDataTemplate>
    </asp:FormView>
    <script>

        $('#txtDateCreated').datepicker({
            format: 'dd-mm-yyyy'
        });


        function isAnyKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode >= 0 && charCode <= 255)
                return false;
            return true;
        }
    </script>
</asp:Content>
