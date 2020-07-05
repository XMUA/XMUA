<%@ Page Title="" UnobtrusiveValidationMode="None" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="EditPassword.aspx.cs" Inherits="XMUA.Student.EditPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <div class="sidenav">
        <ul class="sidenavul">
             <li ><a href="Info.aspx">Personal Info</a></li>
             <li><a href="InfoEdition.aspx">Info Edition</a></li>
			<li><a href="EditPassword.aspx">Change Password</a></li>
        </ul>
    </div>
        <div class="h1title">
        	Change Password
        </div>
         <div class="septalline2"></div>
	        <table class="pitable">
                <tr class="trtitle">
                    <td class="tdword">Please Enter Your Old Password.</td>
                    <td class="tdinput"> <asp:TextBox CssClass="tdinput1" ID="tbold" runat="server"></asp:TextBox>
                    </td>        
                </tr>
		    	<tr style="height: 40px">
		    		<td></td>
		    		<td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Should not be empty!" ControlToValidate="tbold" ForeColor="Red"></asp:RequiredFieldValidator></td>
	    		</tr> 
	    	</table> 
	    	<div class="septalline1"></div>   
	        <table class="pitable">
                <tr class="trtitle">
                    <td class="tdword">Please Enter Your New Password.</td>
                    <td class="tdinput"> <asp:TextBox CssClass="tdinput1" ID="tbnew" runat="server"></asp:TextBox></td>
                </tr>
		    	<tr style="height: 40px">
		    		<td></td>
		    		<td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Should not be empty!" ControlToValidate="tbnew" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
	    		</tr> 
	    	</table>
	    <div class="septalline1"></div>    
	    	<table class="pitable">           
                <tr class="trtitle">
                   <td class="tdword">Please Enter Your Password Again.</td>
                    <td class="tdinput"> <asp:TextBox CssClass="tdinput1" ID="tbnew2" runat="server"></asp:TextBox></td>
                </tr>
    		    	<tr style="height: 40px">
		    		<td></td>
		    		<td>  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Should not be empty!" ControlToValidate="tbnew2" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
	    		</tr>             
	        </table>
	   	<div class="septalline1"></div>
        <div style="font-size:20px;text-align:center;font-weight:bold;margin-top:20px;font-size:20px">
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Two passwords are different." ControlToCompare="tbnew2" ControlToValidate="tbnew" ForeColor="Red"></asp:CompareValidator>
        </div>
		<div style="text-align:center;">
			<asp:Button CssClass="ccb " ID="save" runat="server" Text="SAVE" OnClick="save_Click"  />	 
		</div> 	 

</asp:Content>
