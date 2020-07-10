<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.Master" AutoEventWireup="true" CodeBehind="AExamManage.aspx.cs" Inherits="XMUA.Admin.AExamMangement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="h1title">
        	EDIT EXAM INFO
        </div>
         <div class="septalline2" style="left:350px"></div>
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
                    <asp:Label ID="coursecode" runat="server" Text=""></asp:Label>
	    		</td>
	    		<td>
                    <asp:Label ID="coursename" runat="server" Text=""></asp:Label>
	    		</td>	    		
	    	</tr>

	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>
	    	 </table>
	    	 <div class="septalline1" style="left:350px"></div>
	    	 <table class="pitable3">
	    	<tr class="trtitle">
	    		<td>
					DURATION(HOUR)
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
                    <asp:DropDownList ID="ddlDuration" runat="server" CssClass="coursetb" Width="100px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                    </asp:DropDownList>
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
	    	 <div class="septalline2" style="left:350px"></div>	    	 
	    	 <table class="pitable3">
	    	<tr class="trtitle">
	    		<td>
	    			YEAR
	    		</td>
	    		<td>
	        		MONTH
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr>
	    		<td>
                    <asp:DropDownList ID="ddlYear" runat="server" Width="200px" CssClass="coursetb">
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                        <asp:ListItem>2022</asp:ListItem>
                    </asp:DropDownList>
	    		</td>
	    		<td>
	        		<asp:DropDownList ID="ddlMonth" runat="server" Width="200px" CssClass="coursetb">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                    </asp:DropDownList>
	    		</td>	    		
	    	</tr>
	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>	    		    	
	    </table> 

	    	 <div class="septalline1" style="left:350px"></div>	    	 
	    	 <table class="pitable3">
	    	<tr class="trtitle">
	    		<td>
	    			DAY
	    		</td>
	    		<td>
	        		START TIME
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr>
	    		<td>
	        		<asp:DropDownList ID="ddlDay" runat="server" Width="100px" CssClass="coursetb">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
	        		    <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
	        		</asp:DropDownList>
	    		</td>
	    		<td>
                    <asp:DropDownList ID="ddlST" runat="server" Width="100px" CssClass="coursetb">
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
	        		</asp:DropDownList>

	    		</td>	    		
	    	</tr>
	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>	    		    	
	    </table> 
	   	<div class="septalline2" style="left:350px">
        </div>
		<!--<div style="font-size:20px;text-align:center;font-weight:bold;margin-top:20px;"></div>!-->
		<div style="text-align:center;height:120px">
			<asp:Button CssClass="ccb " ID="save" runat="server" Text="SAVE" OnClick="save_Click"  />	 
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XMUAConnectionString %>" SelectCommand="SELECT [venue] FROM [Venue]"></asp:SqlDataSource>
		</div>
</asp:Content>
