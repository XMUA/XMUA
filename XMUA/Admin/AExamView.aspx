<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.Master" AutoEventWireup="true" CodeBehind="AExamView.aspx.cs" Inherits="XMUA.Admin.AExamView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sidenav">
        <ul class="sidenavul">
             <li ><a href="AExamView.aspx">View Exam</a></li>
            <li ><a href="AExamRelease.aspx">Exam Release</a></li>
        </ul>
    </div>
    <div  style="margin:100px 0px 100px 400px;width:1100px;height:550px;text-align:center;">
        <asp:GridView ID="GridView1" runat="server" CellPadding="25" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="tgv" AllowPaging="True" PageSize="7" Width="1200px" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="course_id" HeaderText="COURSE ID" SortExpression="course_id" />
                <asp:BoundField DataField="course_name" HeaderText="COURSE NAME" SortExpression="course_name" />
                <asp:BoundField DataField="date" HeaderText="DATE" SortExpression="date" />
                <asp:BoundField DataField="venue" HeaderText="VENUE" SortExpression="venue" />
                <asp:BoundField DataField="start_time" HeaderText="START TIME" SortExpression="start_time" />
                <asp:BoundField DataField="duration" HeaderText="DURATION" SortExpression="duration" />
                <asp:TemplateField HeaderText="RELEASE" SortExpression="isrelease">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("isrelease") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# Eval("isrelease").ToString()=="0"?"Unreleased" :"Released" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField ControlStyle-CssClass="tgv" DataNavigateUrlFields="course_id" DataNavigateUrlFormatString="AExamManage.aspx?course_id={0}" HeaderText="MANAGE" Text="Manage" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [course_id], [course_name], [date], [venue], [start_time], [duration], [isrelease] FROM [ExamA] ORDER BY [isrelease], [start_time], [venue]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
