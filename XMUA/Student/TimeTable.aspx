<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="TimeTable.aspx.cs" Inherits="XMUA.Student.TimeTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sidenav">
        <ul class="sidenavul">
            <li><a href="TimeTable.aspx">TimeTable</a></li>
             <li><a href="CourseSelection.aspx">Course selection</a></li>     
        </ul>
    </div>
         <table class="timetable" border="1" cellspacing="0" cellpadding="0">
     	<tr class="timetabletr1">
     		<td class="timetabletd1">
     			Time
     		</td>
     		<td class="timetabletd1">
     			Monday
     		</td>
     		<td class="timetabletd1">
     			Tuesday
     		</td>
     		<td class="timetabletd1">
     			Wednesday
     		</td>
     		<td class="timetabletd1">
     			Thursday
     		</td>  
     		<td class="timetabletd1">
     			Friday
     		</td>        		   		     		
     	</tr>
     	<tr class="timetabletr">
     		<td class="timetabletd1">
     			8.00am-10.00am
			</td>
			<td class="timetabletd">
                <asp:Label ID="D1C1" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D2C1" runat="server" Text=""></asp:Label><br/>
			</td>
			<td class="timetabletd">
                <asp:Label ID="D3C1" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D4C1" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D5C1" runat="server" Text=""></asp:Label><br/>

			</td>
     	</tr>
     	<tr class="timetabletr">
     		<td class="timetabletd1">
     			10.00am-12.00pm
			</td>
			<td class="timetabletd">
                <asp:Label ID="D1C2" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D2C2" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D3C2" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D4C2" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D5C2" runat="server" Text=""></asp:Label><br/>

			</td>
     	</tr> 
     	<tr class="timetabletr">
     		<td class="timetabletd1">
     			2.00pm-4.00pm
			</td>
			<td class="timetabletd">
                <asp:Label ID="D1C3" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D2C3" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D3C3" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D4C3" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D5C3" runat="server" Text=""></asp:Label><br/>

			</td>
     	</tr>
     	<tr class="timetabletr">
     		<td class="timetabletd1">
     			4.00am-6.00am
			</td>
			<td class="timetabletd">
                <asp:Label ID="D1C4" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D2C4" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D3C4" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D4C4" runat="server" Text=""></asp:Label><br/>

			</td>
			<td class="timetabletd">
                <asp:Label ID="D5C4" runat="server" Text=""></asp:Label><br/>

			</td>
     	</tr>
     </table>
</asp:Content>
