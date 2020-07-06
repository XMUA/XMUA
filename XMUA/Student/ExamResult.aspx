<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="ExamResult.aspx.cs" Inherits="XMUA.Student.ExamResult" %>
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
            <asp:BoundField DataField="teacher_name" HeaderText="TEACHER NAME" SortExpression="teacher_name" />
            <asp:BoundField DataField="course_name" HeaderText="COURSE NAME" SortExpression="course_name" />
            <asp:TemplateField HeaderText="GPA" SortExpression="mark">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("mark") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("mark") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
              <div style="font-size:30px; margin-top:20px;float:right;font-weight:bold;">
                  Your CGPA is: <asp:Label ID="cgpa" runat="server" ForeColor="Red"></asp:Label>
             </div>
         </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [course_id], [teacher_name], [course_name], [mark] FROM [Score] WHERE (([mark] &gt; @mark) AND ([student_id] = @student_id))">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="mark" Type="Double" />
            <asp:SessionParameter Name="student_id" SessionField="id_number" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
