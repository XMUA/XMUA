<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.Master" AutoEventWireup="true" CodeBehind="ACourseManage.aspx.cs" Inherits="XMUA.Admin.ACourseManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="sidenav">
        <ul class="sidenavul">
            <li ><a href="ACourseView.aspx">View COURSE</a></li>
            <li ><a href="ACourseAdd.aspx">Add course</a></li>
        </ul>
    </div>>
	<div style="margin:0px 0px 100px 200px;">
<div class="h1title">
        	EDIT COURSE
        </div>
         <div class="septalline4"></div>
	    	<table class="pitable3">
	    	<tr class="trtitle">
	    		<td>
	    			COURSE CODE
	    		</td>
	    		<td>
	        		COURSE NAME
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr>
	    		<td>
                    <asp:TextBox ID="coursecode" runat="server" Width="200px" CssClass="coursetb" Text='<%# Bind("code") %>'></asp:TextBox>
	    		</td>
	    		<td>
                    <asp:TextBox ID="coursename" runat="server" Width="200px" CssClass="coursetb" Text='<%# Bind("name") %>'></asp:TextBox>
	    		</td>	    		
	    	</tr>

	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>
	    	 </table>
	    	 <div class="septalline3"></div>
	    	 <table class="pitable3">
	    	<tr class="trtitle">
	    		<td>
					LECTURER
	    		</td>
	    		<td>
	        		VENUE
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr >
	    		<td>
                    <asp:DropDownList ID="ddlLecturer" runat="server" DataSourceID="SqlDataSource1" DataTextField="username" DataValueField="username" Width="200px" CssClass="coursetb"></asp:DropDownList>
	    		</td>
	    		<td>
                    <asp:DropDownList ID="ddlVenue" runat="server" DataSourceID="SqlDataSource2" DataTextField="venue" DataValueField="venue" Width="200px" CssClass="coursetb"></asp:DropDownList>
	    		</td>	    		
	    	</tr>
	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>
	    	 </table>
	    	 <div class="septalline4"></div>	    	 
	    	 <table class="pitable3">
	    	<tr class="trtitle">
	    		<td>
	    			DAY
	    		</td>
	    		<td>
	        		CAPACITY
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr>
	    		<td>
                    <asp:DropDownList ID="ddlDay" runat="server" Width="200px" CssClass="coursetb">
                        <asp:ListItem Value="1">Monday</asp:ListItem>
                        <asp:ListItem Value="2">Tuesday</asp:ListItem>
                        <asp:ListItem Value="3">Wednesday</asp:ListItem>
                        <asp:ListItem Value="4">Thursday</asp:ListItem>
                        <asp:ListItem Value="5">Friday</asp:ListItem>
                    </asp:DropDownList>
	    		</td>
	    		<td>
	        		<asp:DropDownList ID="ddlCapacity" runat="server" Width="200px" CssClass="coursetb">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                    </asp:DropDownList>
	    		</td>	    		
	    	</tr>
	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>	    		    	
	    </table> 

	    	 <div class="septalline3"></div>	    	 
	    	 <table class="pitable3">
	    	<tr class="trtitle">
	    		<td>
	    			START TIME
	    		</td>
	    		<td>
	        		END TIME
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr>
	    		<td>
                    <asp:DropDownList ID="ddlST1" runat="server" Width="100px" CssClass="coursetb">
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
	        		</asp:DropDownList>
					<asp:DropDownList ID="ddlST2" runat="server" Width="100px" CssClass="coursetb">
                        <asp:ListItem Value="am">am</asp:ListItem>
                        <asp:ListItem Value="pm">pm</asp:ListItem>
	        		</asp:DropDownList>
	    		</td>
	    		<td>
	        		<asp:DropDownList ID="ddlET1" runat="server" Width="100px" CssClass="coursetb">
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
	        		</asp:DropDownList>
					<asp:DropDownList ID="ddlET2" runat="server" Width="100px" CssClass="coursetb">
                        <asp:ListItem Value="am">am</asp:ListItem>
                        <asp:ListItem Value="pm">pm</asp:ListItem>
	        		</asp:DropDownList>
	    		</td>	    		
	    	</tr>
	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>	    		    	
	    </table> 
	   	<div class="septalline4">
            <asp:Label ID="exist" runat="server" Visible="False"></asp:Label>
        </div>
		<!--<div style="font-size:20px;text-align:center;font-weight:bold;margin-top:20px;"></div>!-->
		<div style="text-align:center;">
			<asp:Label ID="id1" runat="server" Text="" Visible="False"></asp:Label>
			<asp:Label ID="id2" runat="server" Text="" Visible="False"></asp:Label>
			<asp:Button CssClass="ccb " ID="Edit" runat="server" Text="EDIT" OnClick="Edit_Click"  />	 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [username] FROM [Users] WHERE ([type] = @type)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="type" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [venue] FROM [Venue]"></asp:SqlDataSource>
		</div>
		</div>
</asp:Content>
