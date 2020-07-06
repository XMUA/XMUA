<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="CourseSelection.aspx.cs" Inherits="XMUA.Student.CourseStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidenav">
        <ul class="sidenavul">
            <li style="width:300px"><a href="TimeTable.aspx">TimeTable</a></li>
             <li style="width:300px"><a href="CourseSelection.aspx">Course selection</a></li>
        </ul>
    </div>
    <div style="margin:100px 0px 100px 400px;width:1100px;height:550px;">
    <asp:Button ID="btn_select_all" Text="All" runat="server" OnClick="btn_select_all_Click"/>
    <asp:Button ID="btn_select_none" Text="None" runat="server" OnClick="btn_select_none_Click"/>
        <div style="margin-bottom:5px;"></div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="False" CellPadding="25" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1100px" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
               <asp:TemplateField HeaderText="" SortExpression="id">
                <ItemTemplate>
                    <asp:CheckBox ID="chk" runat="server"></asp:CheckBox>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CODE" SortExpression="code">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("code") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="COURSE NAME" ControlStyle-Width="200px" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LECTURER" SortExpression="lecturer">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("lecturer") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("lecturer") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VENUE" SortExpression="venue">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("venue") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("venue") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TIMELINE" ControlStyle-Width="200px" SortExpression="timeline">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("timeline") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("timeline") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CAPACITY" SortExpression="capacity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("capacity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("capacity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EXIST" SortExpression="exist">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("exist") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("exist") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#24A0FF" ForeColor="White" HorizontalAlign="Center" Font-Size="Large"   />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <div style=" text-align:center; margin-top:10px"><asp:Label ID="alert" runat="server" ForeColor="Red"></asp:Label></div>
        <div style=" text-align:center;">
            
            <asp:Button ID="select" CssClass="ccb2" runat="server" Text="SELECT" OnClick="select_Click" />
        </div>
        
    </div>
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [code], [name], [lecturer], [venue], [timeline], [capacity], [exist] FROM [Course]"></asp:SqlDataSource>
</asp:Content>
