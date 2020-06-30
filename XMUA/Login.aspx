<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="XMUA.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" href="../css/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="../css/font-awesome/css/font-awesome.min.css" />
    <style>
        body{
            margin:0;
            padding:0;
            background-image:url(../img/bgimg.jpg);
            background-repeat:no-repeat;
        }
        #bigBox{
            margin:0 auto;
            margin-top:200px;
            padding:20px 50px;
            background-color:#00000090;
            width:400px;
            height:350px;
            border-radius:10px;
            text-align:center;
        }
        #bigBox h1{
            color:white;
        }
        #bigBox .inputBox
        {
            margin-top:20px;
        }
        #bigBox .inputBox .inputText
        {
            margin-top:20px;
        }
        #bigBox .inputBox .inputText .cctb
        {
            border:0;
            padding:10px 10px;
            width:177px;
            border-bottom:1px solid white;
            background-color:#00000000;
            color:white;
        }
        #bigBox .inputBox .ccb
        {
            border:0px;
            width:170px;
            height:25px;
            color:white;
            margin-top:40px;
            border-radius:20px;
            outline: none;
            background-image: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
        }
        #bigBox .inputBox i
        {
            position:relative;
            top:5px;
            margin-right:10px;
            color:white;
            font-size:25px;
        }
         #bigBox .inputBox .i2
        {
            top:13px;
        }
         #bigBox .inputBox .i3
        {
            top:13px;
            margin-right:17px;
        }
         #bigBox .inputBox .i4
        {
            right:25px;
            margin-right:0px;
            font-size:23px;
        }
        #bigBox .inputBox .ccddl
        {
            border:0px;
            width:150px;
            height:25px;
            margin-top:15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="bigBox">
                <h1>Login</h1>
                <div class="inputBox">
                    <div class="inputText">
                        <i class="fa fa-user-circle-o i2" aria-hidden="true"></i>
                        <asp:TextBox CssClass="cctb" ID="username" runat="server" Text="Username"></asp:TextBox>
                    </div>
                    <div class="inputText">
                        <i class="fa fa-unlock-alt i3" aria-hidden="true"></i>
                        <asp:TextBox CssClass="cctb" ID="password" runat="server" Text="Password"></asp:TextBox>
                    </div>
                    <div  class="inputText">
                        <i class="fa fa-address-card-o i4"  aria-hidden="true"></i>
                        <asp:DropDownList CssClass="ccddl" id="role" runat="server">
                            <asp:ListItem>Student</asp:ListItem>
                            <asp:ListItem>Administrator</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        <asp:Button CssClass="ccb "  ID="Loginb" runat="server" Text="Button" OnClick="Loginb_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
