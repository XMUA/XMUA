<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.Master" AutoEventWireup="true" CodeBehind="ACourseView.aspx.cs" Inherits="XMUA.Admin.ACourseView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sidenav">
        <ul class="sidenavul">
             <li ><a href="ACourseView.aspx">View COURSE</a></li>
            <li ><a href="ACourseAdd.aspx">Add course</a></li>
        </ul>
    </div>
    <div  style="margin:100px 0px 100px 400px;width:1100px;height:550px;text-align:center;">
        <asp:GridView ID="GridView1" runat="server" CellPadding="25" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="tgv" AllowPaging="True" PageSize="5" Width="1100px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="id">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="code" HeaderText="COURSE ID" SortExpression="code" />
                <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />
                <asp:BoundField DataField="lecturer" HeaderText="LECTURER" SortExpression="lecturer" />
                <asp:BoundField DataField="venue" HeaderText="VENUE" SortExpression="venue" />
                <asp:BoundField DataField="timeline" HeaderText="TIME" SortExpression="timeline" />
                <asp:BoundField DataField="capacity" HeaderText="CAPACITY" SortExpression="capacity" />
                <asp:BoundField DataField="exist" HeaderText="EXIST" SortExpression="exist" />
                <asp:HyperLinkField ControlStyle-CssClass="tgv" DataNavigateUrlFields="code" DataNavigateUrlFormatString="ACourseManage.aspx?code={0}" HeaderText="EDIT" Text="Edit" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT[id], [code], [name], [lecturer], [venue], [timeline], [capacity], [exist] FROM [Course] ORDER BY [id] DESC">
        </asp:SqlDataSource>
    </div>
</asp:Content>
