<%@ Page Title="" Language="C#" MasterPageFile="~/crmAdmin.master" AutoEventWireup="true"
    CodeFile="activity_comments.aspx.cs" Inherits="activity_comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPH" runat="Server">
    <asp:SqlDataSource ID="dsActivityComments" runat="server" ProviderName="<%$ ConnectionStrings:crmCS.ProviderName %>"
        ConnectionString="<%$ ConnectionStrings:crmCS %>" SelectCommand="SELECT * FROM webgui_activity_comments WHERE activity_id = :aid ORDER BY time_created DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="aid" Type="Int32" QueryStringField="aid" />
        </SelectParameters>
      
    </asp:SqlDataSource>
    <asp:ListView ID="lstActivityComments" runat="server" DataSourceID="dsActivityComments"
        DataKeyNames="ACTIVITY_ID" ItemPlaceholderID="commentsPlaceholder">
        <LayoutTemplate>
        <h3>Activity comments</h3>
            <table class="table table-bordered table-hover">
                <tr>
                    <th>
                        Date
                    </th>
                    <th>
                        Comment
                    </th>
                    <th>
                        Author
                    </th>
                </tr>
                <asp:PlaceHolder ID="commentsPlaceholder" runat="server"></asp:PlaceHolder>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr onclick="new_window(<%# Eval("COMMENT_ID") %>, <%# Eval("ACTIVITY_ID") %> )">
                <td>
                    <asp:Label ID="lblDate" runat="server" Text='<% #Eval("TIME_CREATED", "{0:dd-MMM-yyyy (HH:mm)}")%>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblComment" runat="server" Text='<% #Eval("TEXT")%>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblAuthor" runat="server" Text='<% #Eval("AGENTID")%>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <p class="alert alert-info">
                <strong>Hmm... </strong>there doesn't seem to be any comments for this activity.
            </p>
        </EmptyDataTemplate>
    </asp:ListView>
    <script>

        function new_window(comment, activity) {
            window.open("activity_comment_edit.aspx?cmnt=" + comment + "&aid=" + activity)
        }
    </script>

</asp:Content>
