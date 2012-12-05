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
    <asp:SqlDataSource ID="dsCaseActivities" runat="server" ProviderName="<%$ ConnectionStrings:crmCS.ProviderName %>"
        ConnectionString="<%$ ConnectionStrings:crmCS %>" SelectCommand="SELECT * FROM webgui_case_activities WHERE REF_NO = :cid">
        <SelectParameters>
            <asp:QueryStringParameter Name="cid" Type="String" QueryStringField="cid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="frmCaseDetails" runat="server" DataSourceID="dsCaseDetails" DataKeyNames="ID"
        OnDataBound="frmCaseDetails_Bound">
        <EmptyDataTemplate>
            <p class="alert alert-error">
                <strong>Error...</strong> no case found!</p>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div id="subBar" class="container">
                <h4 id="subBar-left" class="pull-left">
                    <asp:Label ID="lblTitle" runat="server" Text='<% # Eval("REF_NO") + ": " + Eval("SUMMARY_COMMENT")%>'></asp:Label></h4>
                <h3 id="subBar-right" class="pull-right">
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("STATUS") %>' ClientIDMode="Static"></asp:Label></h3>
            </div>
            <div style="clear: both;">
                <div id="content">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#details" data-toggle="tab">Details</a></li>
                        <li><a href="#activities" data-toggle="tab">Activities</a></li>
                    </ul>
                    <div id="TabContent" class="tab-content">
                        <div class="tab-pane fade in active" id="details">
                            <div class="span12 row">
                                <table class="table table-bordered" id="tableCustomer">
                                    <tr>
                                        <th>
                                            Customer
                                        </th>
                                        <td>
                                            <asp:Label ID="lblName" runat="server" Text='<% #Eval("Forename")%>'></asp:Label>
                                            <asp:Label ID="lblLstName" runat="server" Text='<% #Eval("Surname")%>'></asp:Label>
                                        </td>
                                        <th>
                                            Raised
                                        </th>
                                        <td>
                                            <asp:Label ID="lblFirstname" runat="server" Text='<% #Eval("CREATEDDATE", "{0:dd-MMM-yyyy (HH:mm)}")%>'></asp:Label>
                                        </td>
                                        <th>
                                            Raised by
                                        </th>
                                        <td>
                                            <asp:Label ID="lblCreatedby" runat="server" Text='<% #Eval("CREATEDBY")%>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade in" id="activities">
                            <asp:ListView ID="lstActivites" runat="server" DataSourceID="dsCaseActivities" DataKeyNames="ACTIVITYID"
                                ItemPlaceholderID="activityPlaceholder">
                                <LayoutTemplate>
                                    <table class="table table-bordered table-striped table-hover">
                                        <tr>
                                            <th>
                                                Status
                                            </th>
                                            <th>
                                                Stage
                                            </th>
                                            <th>
                                                Assignee
                                            </th>
                                            <th>
                                                Started
                                            </th>
                                            <th>
                                                Due
                                            </th>
                                            <th>
                                                Completed
                                            </th>
                                            <th>
                                                Completed By
                                            </th>
                                        </tr>
                                        <asp:PlaceHolder ID="activityPlaceholder" runat="server"></asp:PlaceHolder>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr onclick="new_window(<%# Eval("ACTIVITYID") %>)">
                                        <td>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("STATUS") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblStage" runat="server" Text='<%# Eval("TITLE") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblAssignee" runat="server" Text='<%# Eval("PERSONRESPONSIBLE") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblStart" runat="server" Text='<%# Eval("CREATIONDATE", "{0:dd-MMM-yyyy (HH:mm)}") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblDue" runat="server" Text='<%# Eval("DUEDATE", "{0:dd-MMM-yyyy (HH:mm)}") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblComplete" runat="server" Text='<%# Eval("COMPLETIONDATE", "{0:dd-MMM-yyyy (HH:mm)}") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCompletedBy" runat="server" Text='<%# Eval("COMPLETED_BY") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <p class="alert alert-info">
                                        <strong>Hmm...</strong> there doesn't appear to be any activities for this case</p>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </div>
        </ItemTemplate>
    </asp:FormView>
    <script>
        $('#tab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        })
        function new_window(activity) {
            window.open("activity_comments.aspx?aid=" + activity)
        }
    </script>
</asp:Content>
