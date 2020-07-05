<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="StudentWelcome.aspx.cs" Inherits="XMUA.Student.StudentWelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="schooimg"></div>
    <div class="welcome">
       <div class="label1">
           Hello!
            <asp:Label ID="un" runat="server" Text="TEST"></asp:Label>
       </div>
        <div>
        <h1>Welcome to XMUA!</h1>
        </div>

     </div>

</asp:Content>
