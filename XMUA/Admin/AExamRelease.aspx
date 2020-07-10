<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.Master" AutoEventWireup="true" CodeBehind="AExamRelease.aspx.cs" Inherits="XMUA.Admin.AExamRelease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sidenav">
        <ul class="sidenavul">
             <li ><a href="AExamView.aspx">View Exam</a></li>
            <li ><a href="AExamRelease.aspx">Exam Release</a></li>
        </ul>
    </div>
 <div  style="margin:100px 0px 100px 400px;width:1100px;height:550px;">
      <asp:Button ID="btn_select_all" Text="All" runat="server" OnClick="btn_select_all_Click"/>
        <asp:Button ID="btn_select_none" Text="None" runat="server" OnClick="btn_select_none_Click"/>
        <asp:GridView ID="GridView1" runat="server" CellPadding="25" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="tgv" AllowPaging="True" PageSize="7" Width="1200px" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
               <asp:TemplateField HeaderText="" SortExpression="id">
                <ItemTemplate>
                    <asp:CheckBox ID="chk" runat="server"></asp:CheckBox>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="COURSE ID" SortExpression="course_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("course_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("course_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="COURSE NAME" SortExpression="course_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("course_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("course_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DATE" SortExpression="date">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VENUE" SortExpression="venue">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("venue") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("venue") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="START TIME" SortExpression="start_time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("start_time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("start_time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DURATION" SortExpression="duration">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("duration") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("duration") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RELEASE" SortExpression="isrelease">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("isrelease") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("isrelease").ToString()=="0"?"Unrelease" :"Release" %>'></asp:Label>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [course_id], [course_name], [date], [venue], [start_time], [duration], [isrelease] FROM [ExamA] WHERE ([isrelease] = @isrelease) ORDER BY [course_id]">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="isrelease" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div style=" text-align:center;">
            
            <asp:Button ID="release" CssClass="ccb2" runat="server" Text="RELEASE" OnClick="release_Click"  />
        </div>
        
    </div>
</asp:Content>
