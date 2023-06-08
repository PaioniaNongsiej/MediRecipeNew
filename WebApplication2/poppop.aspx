<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="poppop.aspx.cs" Inherits="WebApplication2.poppop" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link rel="stylesheet" href="/css/vendors_css.css" />
	  
	<!-- Style-->  
	<link rel="stylesheet" href="/css/style.css"/>
	<link rel="stylesheet" href="/css/skin_color.css"/>
	<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

	  <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico"/>
	 <link href="~/css/CSS.css" rel="stylesheet" type="text/css" /> 
<script src="~/scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="~/scripts/jquery.blockUI.js" type="text/javascript"></script>
   
             <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #fff;
            border: 3px solid #ccc;
            padding: 10px;
            width: 300px;
        }
    </style>
     <script type = "text/javascript">
         function BlockUI(elementID) {
             var prm = Sys.WebForms.PageRequestManager.getInstance();
             prm.add_beginRequest(function () {
                 $("#" + elementID).block({
                     message: '<table align = "center"><tr><td>' +
                         '<img src="images/1.gif"/></td></tr></table>',
                     css: {},
                     overlayCSS: {
                         backgroundColor: '#000000', opacity: 0.6
                     }
                 });
             });
             prm.add_endRequest(function () {
                 $("#" + elementID).unblock();
             });
         }
         $(document).ready(function () {

             BlockUI("<%=pnlAddEdit.ClientID %>");
        $.blockUI.defaults.css = {};
    });
         function Hidepopup() {
             $find("popup").hide();
             return false;
         }
     </script> 

</head>
<body style="height: 3000px">
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
        <div style="height: 60px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                      <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" />
                    <asp:GridView ID="GridView1" runat="server"  Width = "700px"
        AutoGenerateColumns = "false"  AlternatingRowStyle-BackColor = "#C2D69B"  
        HeaderStyle-BackColor = "green" AllowPaging ="true"
        OnPageIndexChanging = "OnPaging" 
        PageSize = "10" >
        <Columns>
        <asp:BoundField DataField = "appointment_id" HeaderText = "Appointment_id " HtmlEncode = "true" />
        <asp:BoundField DataField = "start_date" HeaderText = "Date"  HtmlEncode = "true" />
        <asp:BoundField DataField = "end_date" HeaderText = "Date"  HtmlEncode = "true" />
        <asp:BoundField DataField = "fees" HeaderText = "Fees"  HtmlEncode = "true"/> 
        <%--<asp:BoundField DataField = "issues" HeaderText = "Problems"  HtmlEncode = "true"/> --%>
        <asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "C">
           <ItemTemplate>
               <asp:LinkButton ID="lnkEdit" runat="server" Text = "Edit" OnClick = "Edit"></asp:LinkButton>
           </ItemTemplate>
        </asp:TemplateField>
        </Columns> 
        <AlternatingRowStyle BackColor="#C2D69B"  />
        </asp:GridView>
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick = "Add" />

          <%--<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">--%>
        <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">

        <asp:Label Font-Bold = "true" ID = "Label5" runat = "server" Text = "Appointment Details" ></asp:Label>
        <br />
        <table align = "center">
        <tr>
        <td>
        <asp:Label ID = "Label6" runat = "server" Text = "Appointment ID" ></asp:Label>
        </td>
        <td>
        <asp:TextBox ID="txtappointmentID" Width = "40px" MaxLength = "5" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
        <asp:Label ID = "Label7" runat = "server" Text = "Startdate" ></asp:Label>
        </td>
        <td>
        <asp:TextBox ID="txtstartdate" type="date" runat="server"></asp:TextBox>    
        </td>
        </tr>
        <tr>
        <td>
        <asp:Label ID = "Label8" runat = "server" Text = "End Dates" ></asp:Label>
        </td>
        <td>
        <asp:TextBox ID="txtend_dates"  type="date" runat="server"></asp:TextBox>
        </td>
	        <td>
        <asp:Label ID = "Label9" runat = "server" Text = "Fees" ></asp:Label>
        </td>
        <td>
        <asp:TextBox ID="treatment_fees" runat="server"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick = "Save" CssClass="btn-primary-light" />
        </td>
        <td>
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick = "return Hidepopup()"/>
        </td>
        </tr>
        </table>
        </asp:Panel>
        <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>

                    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">

    </cc1:ModalPopupExtender>
                </ContentTemplate>
                
                 <Triggers>
                    <asp:AsyncPostBackTrigger ControlID = "GridView1" />
                    <asp:AsyncPostBackTrigger ControlID = "btnSave" />
                 </Triggers> 
            </asp:UpdatePanel>
        </div>
        <asp:Button ID="btnClose" runat="server" Text="Close" />
   
    <!-- ModalPopupExtender -->
    </form>
</body>
</html>
