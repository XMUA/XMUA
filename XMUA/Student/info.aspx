<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="XMUA.Student.info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:900px;text-align:center;position:relative;left:400px">
        <div class="h1title">
        	PERSONAL INFORMATION
        </div>
	    <div style="margin-top: 40px;padding-bottom:20px; border-bottom:5px solid #4facfe;">
	        <div class="h3title">
	        	<span> USERNAME</span>
	        	<span> ID NUMBER</span>
	        </div>
	        <div class="h3title">
	        	 <asp:Label ID="username" runat="server" Text=""></asp:Label>
	        	 <asp:Label ID="idnumber" runat="server" Text=""></asp:Label>
	        </div>	        
	    </div>
	    <div style="margin-top: 70px;padding-bottom:20px; border-bottom:5px solid #00f2fe;">
	        <div class="h3title">
	        	<span style="margin: 0px 80px;position: relative;right : 20px">PHONE NUMBER</span>
	        	<span style="margin: 0px 80px;"> PROGRAMME</span>
	        </div>
	        <div class="h3title">
	        	 <asp:Label ID="pn" runat="server" Text=""></asp:Label>
	        	 <asp:Label ID="programme" runat="server" Text=""></asp:Label>
	        </div>	        
	    </div>
	    <div style="margin-top: 70px; padding-bottom:20px; border-bottom:5px solid #4facfe;">
	        <div class="h3title">
	        	<span> INTAKE</span>
	        	<span style="position: relative;left: 30px"> NATIONALITY</span>
	        </div>
	        <div class="h3title">
	        
                <asp:Label ID="intake" runat="server" Text=""></asp:Label>
	        	<asp:Label ID="nationaliry" runat="server" Text=""></asp:Label>
	        </div>	        
	    </div>	
		<asp:Button CssClass="ccb " ID="edit" runat="server" Text="EDIT" />
	</div>
</asp:Content>
