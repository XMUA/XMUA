<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="XMUA.Student.info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	    <div class="sidenav">
        <ul class="sidenavul">
             <li style="width:230px"><a href="Info.aspx">Personal Info</a></li>
             <li><a href="InfoEdition.aspx">Info Edition</a></li>
			<li><a href="EditPassword.aspx">Change Password</a></li>
        </ul>
    </div>
        <div class="h1title">
        	Personal Information
        </div>
         <div class="septalline2"></div>
	    <table class="pitable">
	    	<tr class="trtitle">
	    		<td>
	    			ID NUMBER
	    		</td>
	    		<td>
	        		PROGRAMME
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<asp:Label ID="idnumber" runat="server" Text=""></asp:Label>
	    		</td>
	    		<td>
					<asp:Label ID="programme" runat="server" Text=""></asp:Label>
	    		</td>	    		
	    	</tr>

	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>
	    	 </table>
	    	 <div class="septalline1"></div>
	    	 <table class="pitable">
	    	<tr class="trtitle">
	    		<td>
					USERNAME
	    		</td>
	    		<td>
	        		PHONE NUMBER
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr >
	    		<td>
					<asp:Label ID="username" runat="server" Text=""></asp:Label>
	    			
	    		</td>
	    		<td>
	        		 <asp:Label ID="pn" runat="server" Text=""></asp:Label>
	    		</td>	    		
	    	</tr>
	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>
	    	 </table>
	    	 <div class="septalline2"></div>	    	 
	    	 <table class="pitable">
	    	<tr class="trtitle">
	    		<td>
	    			INTAKE
	    		</td>
	    		<td>
	        		NATIONALITY
	    		</td>
	    	</tr>
	    	<tr style="height: 20px">
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    		<td><div style="width:300px; position:relative;left:125px;border-bottom: 3px solid black;"></div></td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<asp:Label ID="intake" runat="server" Text=""></asp:Label>
	    		</td>
	    		<td>
	        		<asp:Label ID="nationaliry" runat="server" Text=""></asp:Label>
	    		</td>	    		
	    	</tr>
	    	<tr style="height: 40px">
	    		<td></td>
	    		<td></td>
	    	</tr>	    		    	
	    </table> 
	   	<div class="septalline1"></div>
		<div style="text-align:center;">
			<asp:Button CssClass="ccb " ID="edit" runat="server" Text="EDIT" OnClick="edit_Click" />	 
		</div>

</asp:Content>
