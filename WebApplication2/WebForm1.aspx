<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
            
           
        <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false"
        PopupControlID="pnlAddEdit" TargetControlID = "lnkFake"
        BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        </ContentTemplate> 
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID = "GridView1" />
        <asp:AsyncPostBackTrigger ControlID = "btnSave" />
        </Triggers> 
        </asp:UpdatePanel> 
        </div>
    </form>
</body>
</html>
