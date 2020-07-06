<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="ExamTime.aspx.cs" Inherits="XMUA.Student.ExamStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidenav">
        <ul class="sidenavul">
             <li><a href="ExamTime.aspx">Exam Time</a></li>
             <li><a href="ExamResult.aspx">Exam Result</a></li>
        </ul>
    </div>
     <div style="margin:100px 0px 100px 400px;width:1100px;height:550px;text-align:center;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="25" Width="1100px" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="course_id" HeaderText="COURSE ID" SortExpression="course_id" />
            <asp:BoundField DataField="course_name" HeaderText="COURSE NAME" SortExpression="course_name" />
            <asp:BoundField DataField="time" HeaderText="TIME" SortExpression="time" />
            <asp:BoundField DataField="venue" HeaderText="VENUE" SortExpression="venue" />
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
         </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [course_id], [course_name], [time], [venue] FROM [Score] WHERE (([student_id] = @student_id) AND ([time] IS NOT NULL) AND ([venue] IS NOT NULL)) ORDER BY [time]">
        <SelectParameters>
            <asp:SessionParameter Name="student_id" SessionField="id_number" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
