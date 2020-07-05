<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="Health.aspx.cs" Inherits="XMUA.Student.Health" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="h1title">
        	Health Attendance
    </div>
    <div class="hacontainer">
         <div class="outDiv" style="margin-top:40px;">
             <div class="titleDiv">In what country?</div>
             <div style="margin-bottom:20px">
                 <asp:RadioButton ID="rbC" Text="China" runat="server" GroupName="Country"/><br/>
                 <asp:RadioButton ID="rbM" Text="Malaysia" runat="server"  GroupName="Country" />
            </div>
         </div>
         <div class="outDiv">
             <div class="titleDiv">Today's temperature</div>
              <div style="margin-bottom:20px">
                 <asp:RadioButton ID="rbL" Text="Lower than 36.3℃" runat="server" GroupName="Temperature"/><br/>
                 <asp:RadioButton ID="rbH" Text="Higher than 36.3℃" runat="server"  GroupName="Temperature" />
             </div>
         </div>
         <div class="outDiv">
             <div class="titleDiv">Are there any symptoms?<br/>Like fever, coughing, sneezing</div>
              <div style="margin-bottom:20px">
                  <asp:RadioButton ID="rbNo" Text="No" runat="server" GroupName="Symptoms"/><br/>
                 <asp:RadioButton ID="rbYes" Text="Yes" runat="server"  GroupName="Symptoms" />
             </div>
         </div>
        <div class="outbdiv">
            <asp:Button ID="haButton" CssClass="ccb2" runat="server" Text="SUBMIT" OnClick="haButton_Click" />
        </div>
     </div>          
</asp:Content>
