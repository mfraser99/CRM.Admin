<%@ Page Title="" Language="C#" MasterPageFile="~/crmAdmin.master" AutoEventWireup="true"
    CodeFile="case_details.aspx.cs" Inherits="case_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPH" runat="Server">
    <asp:SqlDataSource ID="dsCaseDetails" runat="server" ProviderName="<%$ ConnectionStrings:crmCS.ProviderName %>"
        ConnectionString="<%$ ConnectionStrings:crmCS %>" SelectCommand="SELECT * FROM webgui_case_details WHERE REF_NO = :cid">
       <SelectParameters>
       <asp:QueryStringParameter Name="cid" Type="String" QueryStringField="cid" />
       </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="lstCaseDetails" runat="server" DataSourceID="dsCaseDetails" DataKeyNames="ID">
        <ItemTemplate>
            <div class="container">
                <h3>
                    <asp:Label ID="lblTitle" runat="server" Text='<% # Eval("ID") + ": " + Eval("SUMMARY_COMMENT")%>'></asp:Label></h3>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
