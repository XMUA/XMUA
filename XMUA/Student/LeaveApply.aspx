<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="LeaveApply.aspx.cs" Inherits="XMUA.Student.LeaveApply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="sidenav">
        <ul class="sidenavul">
             <li><a href="Leave.aspx">Exist Leave Application</a></li>
            <li><a href="LeaveApply.aspx">Leave Apply</a></li>
        </ul>
        </div>
    <div class="h1title">
        	Leave Application
    </div>
    <div class="hacontainer" >
         <div class="outDiv1" style="margin-top:40px;">
             <div class="titleDiv">Name:<asp:Label ID="name" runat="server" Text=""></asp:Label></div>
         </div>
         <div class="outDiv1">
             <div class="titleDiv">Duration</div>
              <div style="margin-bottom:20px">
                  <asp:DropDownList ID="duration"  runat="server" Width="132px">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                </asp:DropDownList>
             </div>
         </div>
         <div class="outDiv1">
             <div class="titleDiv">Matter</div>
              <div style="margin-bottom:20px">
                 <asp:DropDownList ID="matter" runat="server">
                    <asp:ListItem Value="Medical Leave">Medical Leave</asp:ListItem>
                    <asp:ListItem Value="Emergency Leave">Emergency Leave</asp:ListItem>
                    <asp:ListItem Value="Annual Leave">Annual Leave</asp:ListItem>
                    <asp:ListItem Value="Others">Others</asp:ListItem>
                </asp:DropDownList>
             </div>
         </div>
         <div class="outDiv1">
             <div class="titleDiv" style="margin-top:0px">Date</div>
              <div style="margin-bottom:20px">
                  <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" BorderWidth="1px" CellPadding="1">
                      <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                      <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" Width="200px" />
                      <OtherMonthDayStyle ForeColor="#999999" />
                      <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                      <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                      <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                      <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                      <WeekendDayStyle BackColor="#CCCCFF" />
                  </asp:Calendar>
             </div>
         </div>

        <div class="outbdiv1">
            <asp:Label ID="Result" runat="server" Text="" ForeColor="Red"></asp:Label><br/>
            <asp:Button ID="labutton" CssClass="ccb2" runat="server" Text="SUBMIT" OnClick="labutton_Click"  />
        </div>
     </div>    
</asp:Content>
