<%@ Page Title="" Language="C#" MasterPageFile="~/crmAdmin.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPH" runat="Server">
    <div class="span10 form-inline">
        Case reference:
        <asp:TextBox ID="txtRef" runat="server" Style="text-align: center" MaxLength="7"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valRef" runat="server" ErrorMessage="You should really enter a case number"
            ValidationGroup="Search" ControlToValidate="txtRef" Display="None"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="valExRef" runat="server" ErrorMessage="Numbers only please!"
            ValidationGroup="Search" ValidationExpression="^[0-9]{0,40}$" ControlToValidate="txtRef"
            Display="None"></asp:RegularExpressionValidator>
        <asp:Button ID="btnGo" runat="server" Text="Search" CssClass="btn btn-primary"
            ValidationGroup="Search" OnClick="btnGo_Click" />
        
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="alert alert-error"
            DisplayMode="List" ValidationGroup="Search" />
    </div>
</asp:Content>
