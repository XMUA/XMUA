<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="XMUA.Student.Leave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../study/js/jquery/2.0.0/jquery.min.js"></script>

    <link rel="stylesheet" href="~/css/StyleStudent.css" type="text/css"/>
  <script>
	$(function(){
        $("div.approvedLeave").hide();
        $("div.rejectLeave").hide();
        $("a.total").click(function(){
            $("div.totalLeave").show();
            $("div.rejectLeave").hide();
            $("div.approvedLeave").hide();
		});
        $("a.approved").click(function(){
            $("div.rejectLeave").hide();
            $("div.totalLeave").hide();
            $("div.approvedLeave").show();      
        });
        $("a.rejected").click(function () {
            $("div.approvedLeave").hide();
            $("div.totalLeave").hide();
            $("div.rejectLeave").show();
        });
		})
</script>
</head>
<body class="body1">
    <form id="form1" runat="server">
        <div>
   <div style="width:300px;height:100px;position:absolute;top:10px;">
           <img style="width:300px" src="../img/XMUAlogo.jpg" />
           </div>
        <div class="nav">
             <ul class="navul">
                 <li><a href="StudentWelcome.aspx">Home</a></li>
                 <li><a href="TimeTable.aspx">Course</a></li>
                 <li><a href="ExamTime.aspx">Exam</a></li>
                 <li><a href="Leave.aspx">Leave</a></li>
                 <li><a href="Health.aspx">Health Attendance</a></li>
                 <li><a href="Info.aspx">Personal Info</a></li>
                 <li><asp:LinkButton CssClass="LLB" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton></li>
             </ul>
        </div>         
    <div class="sidenav">
        <ul class="sidenavul">
             <li><a href="Leave.aspx">Exist Leave Application</a></li>
            <li><a href="LeaveApply.aspx">Leave Apply</a></li>
        </ul>
    </div>

    <div class="approvedLeave" style="margin:150px 0px 100px 400px;width:1100px;height:550px;text-align:center;">
        <div style="position:absolute;top:130px;width:200px;font-weight:bold;">
            <a class="btn total" href="#">ALL</a>
        </div>
          <div style="position:absolute;top:130px; left:650px; width:200px;font-weight:bold;">
            <a class="btn approved " href="#">APPROVED</a>
        </div>
        <div style="position:absolute;top:130px; left:900px; width:200px;font-weight:bold;">
            <a class="btn rejected " href="#">REJECT</a>
        </div>       
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [id_number], [name], [matter], [start_date], [duration], [approve] FROM [Leave] WHERE (([id_number] = @id_number) AND ([approve] = @approve))">
                 <SelectParameters>
                     <asp:SessionParameter Name="id_number" SessionField="id_number" Type="String" />
                     <asp:Parameter DefaultValue="1" Name="approve" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
        <div  style="margin-top:30px">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="25" Width="1100px" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AllowPaging="True" Height="40px" PageSize="7">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_number" HeaderText="ID" SortExpression="id_number" />
            <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />
            <asp:BoundField DataField="matter" HeaderText="MATTER" SortExpression="matter" />
            <asp:BoundField DataField="start_date" HeaderText="START DATE" SortExpression="start_date" />
            <asp:BoundField DataField="duration" HeaderText="DURATION" SortExpression="duration" />
            <asp:TemplateField HeaderText="APPROVE" SortExpression="approve">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("approve") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("approve").ToString()=="0"?"Pending" :Eval("approve").ToString()=="1"?"Appoved":"Rejected" %>'></asp:Label>                </ItemTemplate>
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
            </div>
    </div>
    <div class=" totalLeave" style="margin:150px 0px 100px 400px;width:1100px;height:550px;text-align:center;">
        <div style="position:absolute;top:130px;  width:200px;font-weight:bold;">
            <a class="btn total" href="#">ALL</a>
        </div>
          <div style="position:absolute;top:130px; left:650px; width:200px;font-weight:bold;">
            <a class="btn approved " href="#">APPROVED</a>
        </div>
        <div style="position:absolute;top:130px; left:900px; width:200px;font-weight:bold;">
            <a class="btn rejected " href="#">REJECT</a>
        </div>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [id_number], [name], [matter], [start_date], [duration], [approve] FROM [Leave] WHERE ([id_number] = @id_number) ORDER BY [start_date] DESC, [approve]">
                 <SelectParameters>
                     <asp:SessionParameter Name="id_number" SessionField="id_number" Type="String" />
                 </SelectParameters>
             </asp:SqlDataSource>
        <div  style="margin-top:30px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="25" Width="1100px" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="7">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_number" HeaderText="ID" SortExpression="id_number" />
            <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />
            <asp:BoundField DataField="matter" HeaderText="MATTER" SortExpression="matter" />
            <asp:BoundField DataField="start_date" HeaderText="START DATE" SortExpression="start_date" />
            <asp:BoundField DataField="duration" HeaderText="DURATION" SortExpression="duration" />
            <asp:TemplateField HeaderText="APPROVE" SortExpression="approve">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("approve") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("approve").ToString()=="0"?"Pending" :Eval("approve").ToString()=="1"?"Appoved":"Rejected" %>'></asp:Label>                
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
            </div>
    </div>
    <div class=" rejectLeave" style="margin:150px 0px 100px 400px;width:1100px;height:550px;text-align:center;">
        <div style="position:absolute;top:130px;  width:200px;font-weight:bold;">
            <a class="btn total" href="#">ALL</a>
        </div>
          <div style="position:absolute;top:130px; left:650px; width:200px;font-weight:bold;">
            <a class="btn approved " href="#">APPROVED</a>
        </div>
        <div style="position:absolute;top:130px; left:900px; width:200px;font-weight:bold;">
            <a class="btn rejected " href="#">REJECT</a>
        </div>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [id_number], [name], [matter], [start_date], [duration], [approve] FROM [Leave] WHERE (([id_number] = @id_number) AND ([approve] = @approve)) ORDER BY [start_date] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="id_number" SessionField="id_number" Type="String" />
                <asp:Parameter DefaultValue="2" Name="approve" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div  style="margin-top:30px">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="25" Width="1100px" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="7">
        <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id_number" HeaderText="ID" SortExpression="id_number" />
                        <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />
                        <asp:BoundField DataField="matter" HeaderText="MATTER" SortExpression="matter" />
                        <asp:BoundField DataField="start_date" HeaderText="START DATE" SortExpression="start_date" />
                        <asp:BoundField DataField="duration" HeaderText="DURATION" SortExpression="duration" />
                        <asp:TemplateField HeaderText="APPROVE" SortExpression="approve">
                            <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("approve") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("approve").ToString()=="0"?"Pending" :Eval("approve").ToString()=="1"?"Appoved":"Rejected" %>'></asp:Label>                
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
        </div>
        </div>


        </div>
    </form>
</body>
</html>
