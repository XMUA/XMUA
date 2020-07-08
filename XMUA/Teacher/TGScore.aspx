<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/Teacher.Master" AutoEventWireup="true" CodeBehind="TGScore.aspx.cs" Inherits="XMUA.Teacher.TGScore" %>
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
        <asp:GridView ID="GridView1" runat="server" CellPadding="25" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="5" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="900px" OnRowUpdated="GridView1_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="COURSE ID" SortExpression="course_id">
                    <EditItemTemplate>
                        <asp:Label ID="lcid" runat="server" Text='<%# Bind("course_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lcid1" runat="server" Text='<%# Bind("course_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="COURSE NAME" SortExpression="course_name">
                    <EditItemTemplate>
                        <asp:Label ID="lcn" runat="server" Text='<%# Bind("course_name") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lcn1" runat="server" Text='<%# Bind("course_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="STUDENT ID" SortExpression="student_id">
                    <EditItemTemplate>
                        <asp:Label ID="lsid" runat="server" Text='<%# Bind("student_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lsid1" runat="server" Text='<%# Bind("student_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MARK" SortExpression="mark">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbMark" runat="server" Text='<%# Bind("mark") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lMark" runat="server" Text='<%# Bind("mark") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EDIT" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CssClass="tgv" runat="server" CausesValidation="True" CommandName="Update" Text="UPDATE"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbCancel" CssClass="tgv" runat="server" CausesValidation="False" CommandName="Cancel" Text="CANCEL"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CssClass="tgv" runat="server" CausesValidation="False" CommandName="Edit" Text="EDIT"></asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [id], [course_id], [course_name], [student_id], [mark] FROM [Score] WHERE ([course_id] = @course_id) ORDER BY [mark]" DeleteCommand="DELETE FROM [Score] WHERE [id] = @id" InsertCommand="INSERT INTO [Score] ([course_id], [course_name], [student_id], [mark]) VALUES (@course_id, @course_name, @student_id, @mark)" UpdateCommand="UPDATE [Score] SET [course_id] = @course_id, [course_name] = @course_name, [student_id] = @student_id, [mark] = @mark WHERE [id] = @id">
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
                <asp:ControlParameter ControlID="Label1" Name="course_id" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="course_id" Type="String" />
                <asp:Parameter Name="course_name" Type="String" />
                <asp:Parameter Name="student_id" Type="String" />
                <asp:Parameter Name="mark" Type="Double" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    </div>
</asp:Content>
