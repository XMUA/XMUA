<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Administrator.Master" AutoEventWireup="true" CodeBehind="ALeaveAudit.aspx.cs" Inherits="XMUA.Admin.ALeaveAudit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="" Visible="False"></asp:Label>
    <div class="h1title">
        	LEAVE APPROVAL
        </div>
         <div class="septalline2" style="width:800px;"></div>
	        <table class="pitable">
                <tr class="trtitle">
                    <td class="tdword">ID Number</td>
                    <td class="tdinput"> 
                        <asp:Label ID="idnumber" runat="server" Text=""></asp:Label>
                    </td>        
                </tr>
		    	</table> 
	    	<div class="septalline1" style="width:800px;"></div>   
	        <table class="pitable">
                <tr class="trtitle">
                    <td class="tdword">Name</td>
                    <td class="tdinput"> <asp:Label ID="name" runat="server" Text=""></asp:Label>
		    	</table>
	    <div class="septalline2" style="width:800px;"></div>    
	    	<table class="pitable">           
                <tr class="trtitle">
                   <td class="tdword">Matter</td>
                    <td class="tdinput"> <asp:Label ID="matter" runat="server" Text=""></asp:Label></td>
                </tr>
    	    </table>
	    	<div class="septalline1" style="width:800px;"></div>   
	        <table class="pitable">
                <tr class="trtitle">
                    <td class="tdword">Start Date</td>
                    <td class="tdinput"> <asp:Label ID="startdate" runat="server" Text=""></asp:Label>
		    </table>
	    <div class="septalline2" style="width:800px;"></div>    
	    	<table class="pitable">           
                <tr class="trtitle">
                   <td class="tdword">Duration</td>
                    <td class="tdinput"> <asp:Label ID="duration" runat="server" Text=""></asp:Label></td>
                </tr>
    	    </table>
	   	<div class="septalline2" style="width:800px;"></div>
        <div style="font-size:20px;text-align:center;font-weight:bold;margin-top:20px;font-size:20px">
        </div>
		<div style="text-align:center;width:700px;margin-left:470px">
			<asp:Button CssClass="ccb " ID="Approve" runat="server" Text="APPROVE" OnClick="Approve_Click"   />	 
            <asp:Button CssClass="ccb " ID="Reject" runat="server" Text="REJECT" OnClick="Reject_Click"   />	 
		</div> 	 
</asp:Content>
