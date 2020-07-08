<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TWelcome.Master" AutoEventWireup="true" CodeBehind="TeacherWelcome.aspx.cs" Inherits="XMUA.Teacher.TeacherWelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="welcome">
       <div class="label1">
           Hello!
            <asp:Label ID="un" runat="server" Text="TEST"></asp:Label>
       </div>
        <div>
        <h1>Welcome to XMUA!</h1>
        </div>

     </div>
        <div class="label2">
        <div style="float:right;">
            <div style="margin-top:30px;margin-right:550px;font-size:30px;color:white;">
                Visitors : <asp:Label ID="nVisitor" runat="server" Text="Label"></asp:Label>
            </div>
        </div>

        <div style="padding:8px; width:340px;position:relative;left:500px;">
            <div style="height:70px;padding:5px;">
                <img src="../img/logo.png" />
            </div>
        </div>
         </div>
</asp:Content>
