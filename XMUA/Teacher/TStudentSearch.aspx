<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/Teacher.Master" AutoEventWireup="true" CodeBehind="TStudentSearch.aspx.cs" Inherits="XMUA.Teacher.TStudentSearch" %>
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
        
        <asp:GridView ID="GridView1" runat="server" CellPadding="25" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="5" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" Width="1000px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="COURSE ID" SortExpression="course_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("course_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lcid" runat="server" Text='<%# Bind("course_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="COURSE NAME" SortExpression="course_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("course_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("course_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="STUDENT ID" SortExpression="student_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("student_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lsid" runat="server" Text='<%# Bind("student_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MARK" SortExpression="mark">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("mark") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("mark") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ControlStyle-CssClass="tgv" HeaderText="DELETE" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="DELETE"></asp:LinkButton>
                    </ItemTemplate>

<ControlStyle CssClass="tgv"></ControlStyle>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [course_id], [course_name], [student_id], [mark], [id] FROM [Score] WHERE (([teacher_name] = @teacher_name) AND ([course_name] LIKE '%' + @course_name + '%')) ORDER BY [course_id]" DeleteCommand="DELETE FROM [Score] WHERE [id] = @id" InsertCommand="INSERT INTO [Score] ([course_id], [course_name], [student_id], [mark]) VALUES (@course_id, @course_name, @student_id, @mark)" UpdateCommand="UPDATE [Score] SET [course_id] = @course_id, [course_name] = @course_name, [student_id] = @student_id, [mark] = @mark WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="course_id" Type="String" />
                <asp:Parameter Name="course_name" Type="String" />
                <asp:Parameter Name="student_id" Type="String" />
                <asp:Parameter Name="mark" Type="Double" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="teacher_name" SessionField="username" Type="String" />
                <asp:ControlParameter ControlID="tbsearchNAME" Name="course_name" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="course_id" Type="String" />
                <asp:Parameter Name="course_name" Type="String" />
                <asp:Parameter Name="student_id" Type="String" />
                <asp:Parameter Name="mark" Type="Double" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>

</asp:Content>
