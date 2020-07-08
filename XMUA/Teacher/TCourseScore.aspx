<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/Teacher.Master" AutoEventWireup="true" CodeBehind="TCourseScore.aspx.cs" Inherits="XMUA.Teacher.TCourseScore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="sidenav">
        <ul class="sidenavul">
             <li><a href="TCourse.aspx">View Course List</a></li>
            <li><a href="TStudentSearch.aspx">Manage Student in Course</a></li>
             <li><a href="TCourseScore.aspx">Grade Student</a></li>
        </ul>
    </div>
    <div  style="margin:100px 0px 100px 500px;width:1100px;height:550px;text-align:center;">
        <div class="tsstbdiv">
            Please Input the Name of Courses and Press Enter 
            <br/>
            <asp:TextBox CssClass="tsstb" ID="tbsearchNAME" runat="server"></asp:TextBox></div>
         <asp:GridView ID="GridView1" runat="server" CellPadding="25" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  Width="1100px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="code" HeaderText="CODE" SortExpression="code" />
                <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />
                <asp:BoundField DataField="lecturer" HeaderText="LECTURER" SortExpression="lecturer" />
                <asp:BoundField DataField="venue" HeaderText="VENUE" SortExpression="venue" />
                <asp:BoundField DataField="timeline" HeaderText="TIME" SortExpression="timeline" />
                <asp:BoundField DataField="capacity" HeaderText="CAPACITY" SortExpression="capacity" />
                <asp:BoundField DataField="exist" HeaderText="EXIST" SortExpression="exist" />
                <asp:HyperLinkField ControlStyle-CssClass="tgv" DataNavigateUrlFields="code" DataNavigateUrlFormatString="TGScore.aspx?code={0}" HeaderText="VIEW" Text="VIEW" >
<ControlStyle CssClass="tgv"></ControlStyle>
                </asp:HyperLinkField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [code], [name], [lecturer], [venue], [timeline], [capacity], [exist] FROM [Course] WHERE (([name] LIKE '%' + @name + '%') AND ([lecturer] = @lecturer)) ORDER BY [code]">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbsearchNAME" Name="name" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="lecturer" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
