<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popform.aspx.cs" Inherits="WebApplication2.popform" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
        <script src="scripts/jquery.blockUI.js" type="text/javascript"></script>
        <script type = "text/javascript">
            function BlockUI(elementID) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(function() {
                    $("#" + elementID).block({ message: '<table align = "center"><tr><td>' +
             '<img src="images/loadingAnim.gif"/></td></tr></table>',
                        css: {},
                        overlayCSS: { backgroundColor: '#000000', opacity: 0.6
                        }
                    });
                });
                prm.add_endRequest(function() {
                    $("#" + elementID).unblock();
                });
            }
            $(document).ready(function() {
 
                BlockUI("<%=pnlAddEdit.ClientID %>");
                $.blockUI.defaults.css = {};
            });
            function Hidepopup() {
                $find("popup").hide();
                return false;
            }

           
        </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width = "550px" DataKeyNames="id"
                    AutoGenerateColumns = "false" 
                    AllowPaging ="true"
                    OnPageIndexChanging = "OnPaging"
                    PageSize = "10" >
                        <Columns>
                            <asp:BoundField DataField = "id" HeaderText = "id" HtmlEncode = "true" />
                            <asp:BoundField DataField = "category_name" HeaderText = "category_name" HtmlEncode = "true" />
                            <asp:BoundField DataField = "category_icon" HeaderText = "category_icon" HtmlEncode = "true"/>
                            <asp:TemplateField ItemStyle-Width = "30px" HeaderText = "CustomerID">
                               <ItemTemplate>
                                   <asp:LinkButton ID="lnkEdit" runat="server" Text = "Edit" OnClick = "Edit"></asp:LinkButton>
                               </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <AlternatingRowStyle BackColor="#C2D69B" />
                    </asp:GridView>
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick = "Add" />
 
                        <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style = "display:none">
                        <asp:Label Font-Bold = "true" ID = "Label4" runat = "server" Text = "Category Details" ></asp:Label>
                        <br />
                        <table align = "center">
                        <tr>
                        <td>
                        <asp:Label ID = "Label1" runat = "server" Text = "id" ></asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="id" Width = "40px" MaxLength = "5" runat="server"></asp:TextBox>
                        </td>
                        </tr>
                        <tr>
                        <td>
                        <asp:Label ID = "Label2" runat = "server" Text = "Contact Name" ></asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="category_name" runat="server"></asp:TextBox>   
                        </td>
                        </tr>
                        <tr>
                        <td>
                        <asp:Label ID = "Label3" runat = "server" Text = "Company" ></asp:Label>
                        </td>
                        <td>
                       <%-- <asp:TextBox ID="category_icon" runat="server"></asp:TextBox>--%>
                            <div class="product_info">
       
                                                <%--<div class="product_image"><p class="text">product image</p></div>--%>
                                                <div class="upload_image_sec">
                                                    <!-- upload inputs -->
                                                    <p class="text">upload image</p>
                                                   <%-- <div class="upload_catalouge">--%>
                                                        <div class="col-sm-3 col-md-3 col-xs-12">  
                                                                    <div class="form-group"> 
                                                                        <div class="custom-file">  
                                                                    <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail" ImageUrl="~/images/default-avatar.png" Width="139px" Height="188px" />  
                                                                            <br/>
                                                                            <br/>
                                                                            <label class="custom-file-label">  
                                                                            <asp:FileUpload ID="first_file_upload_btn" runat="server" class="form-control"  onchange="ShowImagePreview(this);" />  
                                                                            </label>  
                                                                        </div>  
                                                                    </div>  
                                                                </div>  
                                                    </div>
                                                </div>
                                                <!-- end product image -->
                        </td>
                        </tr>
                        <tr>
                        <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick = "Save" />
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
    <script>
     //Image Upload Preview
            function ShowImagePreview(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imagePreview').prop('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
</body>
</html>
