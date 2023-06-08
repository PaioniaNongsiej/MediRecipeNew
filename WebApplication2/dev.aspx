<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dev.aspx.cs" Inherits="WebApplication2.dev" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 
	 <link href="CSS.css" rel="stylesheet" type="text/css" /> 
<script src="~/scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="~/scripts/jquery.blockUI.js" type="text/javascript"></script>
<script type = "text/javascript">
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function() {
            $("#" + elementID).block({ message: '<table align = "center"><tr><td>' +
     '<img src="images/1.gif"/></td></tr></table>',
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
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">

    <form id="form1" runat="server">
        <div class="wrapper">
	<div id="loader">

		  <header class="main-header">
	<div class="d-flex align-items-center logo-box justify-content-start">	
		<!-- Logo -->
		<a href="index.html" class="logo">
		 
		 
		  <div class="logo-lg">
			  <span class="light-logo"><img src="/images/medusind.png" alt="logo"/></span>
			
		  </div>
		</a>	
	</div>  

			      <!-- Header Navbar -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
	  <div class="app-menu">
		<ul class="header-megamenu nav">
			<li class="btn-group nav-item">
				 <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#modal-available">Add</button>
			   
			</li>
			<li class="btn-group d-lg-inline-flex d-none">
				<div class="app-menu">
				</div>
			</li>
		</ul> 

	  </div>
		
      <div class="navbar-custom-menu r-side">
        <ul class="nav navbar-nav">			
			<!-- User Account-->
			<li class="dropdown user user-menu">

				<a href="#" class="waves-effect waves-light dropdown-toggle w-auto l-h-12 bg-transparent p-0 no-shadow" data-bs-toggle="dropdown" title="User">
					<div class="d-flex pt-1">
						<div class="text-end me-10">
							
						   <asp:Label ID ="Label2" runat="server" class="pt-5 fs-14 mb-0 fw-700 text-primary" ></asp:Label>
						
						</div>
						
					</div>
				</a>
				<ul class="dropdown-menu animated flipInX">
				  <li class="user-body">
					 <button type="button" class="btn btn-primary  btn-sm" data-bs-toggle="modal" data-bs-target="#modal-center">
				Profile
				  </button>    
       <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modal-default">
					Logout
					  </button>              
				  </li>
				</ul>
			</li>	

	<div class="modal fade" id="modal-default">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<h4 class="modal-title">Are you Ready To Leave ?</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			<p>Select "Logout" below if you are ready to end your current session.&hellip;</p>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>


		  </div>
		</div>
		<!-- /.modal-content -->
	  </div>
	  <!-- /.modal-dialog -->
  </div>
	
		  <li class="dropdown notifications-menu">
			<a href="#" class="waves-effect waves-light dropdown-toggle btn-info-light" data-bs-toggle="dropdown" title="Notifications">
			  <i class="ti-bell"><span class="path1"></span><span class="path2"></span></i>
			</a>
			<ul class="dropdown-menu animated bounceIn">
			  <li class="header">
				<div class="p-20">
					<div class="flexbox">
						
						<div>
							<a href="#" class="text-success">Today's Appointment</a>
						</div>
					</div>
				</div>
			  </li>
			  <li>
			<asp:GridView ID="fetchpatient" runat="server"  class="table mb-0  table-responsive">
				
                                                </asp:GridView>
				
			  </li>
			  <li class="footer">
				  <a href="#">View all</a>
			  </li>
			</ul>
		  </li>			  
        
			
        </ul>
      </div>
    </nav>
  </header>
		  <!-- Control Sidebar Toggle Button -->
       <div class="modal center-modal fade" id="modal-center" tabindex="-1">
	               <div class="modal-dialog">
	 

			  	  <div class="col-lg-10 col-12">
				  <div class="box box-widget widget-user">
					<div class="widget-user-header bg-img" style="background: url(../images/gallery/creative/img-8.jpg) center center;" data-overlay="5">
					 <asp:Label ID ="Label3" runat="server" class="widget-user-username text-white" ></asp:Label>
				
					</div>
					<div class="widget-user-image">
					 <asp:Image ID="profile" runat="server"    Width="120"      CssClass="rounded-circle bg-warning-light"/> 
					
					</div>
					<div class="box-footer">
					  <div class="row mt-30">
						<div class="col-sm-4">
						  <div class="description-block">
						<span class="description-text">PHNO</span>
					   <asp:Label ID ="Label1" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-warning" ></asp:Label>
						  </div>
						</div>
						<div class="col-sm-4">
						  <div class="description-block">
					      <span class="description-text">ADDRESS</span> </br>
						  <asp:Label ID ="Label4" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-warning" ></asp:Label>
						  </div>
						</div>

						<div class="col-sm-4">
						  <div class="description-block">
							   <span class="description-text">EXPERIENCE</span> </br>
						  <asp:Label ID ="expe" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-warning" ></asp:Label>
						  </div>
						</div>
						  <asp:Label ID ="id" runat="server"  visible="false"  class="pt-5 fs-14 mb-0 fw-800 text-warning" ></asp:Label>
					  </div>
					</div>
				  </div>
			  </div>
					   								
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="DoctorLogin.aspx">Logout</a>
                </div>
            </div>
        </div>
    </div>
	
	</div>
	</div>

		<aside>
 <section class="sidebar position-relative">
	  	<div class="multinav">
		  <div class="multinav-scroll" style="height: 100%;">	
			  <!-- sidebar menu-->
			  <ul class="sidebar-menu" data-widget="tree">			
				<li class="treeview">
				  <a href="#">
					<i class="icon-Layout-4-blocks"><span class="path1"></span><span class="path2"></span></i>
					<span>Dashboard</span>
					<span class="pull-right-container">
					  <i class="fa fa-angle-right pull-right"></i>
					</span>
				  </a>
				  <ul class="treeview-menu">
					<li><a href="index.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Patients Dashboard</a></li>
					<li><a href="index4.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Patients Dashboard 2</a></li>
					<li><a href="index2.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Doctor Dashboard</a></li>
					<li><a href="index6.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Doctor Dashboard 2</a></li>
					<li><a href="index7.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Doctor Dashboard 3</a></li>
					<li><a href="index3.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Hospital Dashboard</a></li>
					<li><a href="index5.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Hospital Dashboard 2</a></li>
				  </ul>
				</li>
				<li>
				  <a href="appointments.html">
					<i class="icon-Barcode-read"><span class="path1"></span><span class="path2"></span></i>
					<span>Appointments</span>
				  </a>
				</li>			
				<li class="treeview">
				  <a href="#">
					<i class="icon-Compiling"><span class="path1"></span><span class="path2"></span></i>
					<span>


					</span>
					<span class="pull-right-container">
					  <i class="fa fa-angle-right pull-right"></i>
					</span>
				  </a>
				  <ul class="treeview-menu">
					<li><a href="patients.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Patients</a></li>
					<li><a href="patient_details.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Patient Details</a></li>
				  </ul>
				</li>
				<li>
				  <a href="reports.html">
					<i class="icon-Settings-1"><span class="path1"></span><span class="path2"></span></i>
					<span>Reports</span>
				  </a>
				</li>		
		  </div>
		</div>
    </section>
  </aside>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	  <div class="container-full">
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xl-8 col-12">
					<div class="box">
						<div class="box-body">
							<div class="row">
								<div class="col-xl-3 col-md-6 col-12">
									<div class="d-flex align-items-center mb-15 mb-lg-0">
										<div class="me-15 bg-danger w-60 h-60 rounded-circle text-center l-h-70">
									<i class="fa-solid fa-bed"></i>
										</div>
										<div>
											<p class="text-fade fs-16 mb-0">Patients</p>
											<h3 class="fw-500 my-0"><asp:Label ID="countpatient" runat="server"></asp:Label></h3>

										</div>
									</div>
								</div>
								<div class="col-xl-3 col-md-6 col-12">
									<div class="d-flex align-items-center mb-15 mb-lg-0">
										<div class="me-15 bg-warning w-60 h-60 rounded-circle text-center l-h-70">
										<i class="fa-solid fa-user-doctor"></i>
										</div>
										<div>
											<p class="text-fade fs-16 mb-0">Staffs</p>
											<h3 class="fw-500 my-0">0</h3>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-md-6 col-12">
									<div class="d-flex align-items-center mb-15 mb-md-0">
										<div class="me-15 bg-success w-60 h-60 rounded-circle text-center l-h-70">
										<i class="fa-regular fa-hospital"></i>
										</div>
										<div>
											<p class="text-fade fs-16 mb-0">Rooms</p>
											
											<h3 class="fw-500 my-0">28</h3>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-md-6 col-12">
									<div class="d-flex align-items-center mb-15 mb-md-0">
										<div class="me-15 bg-info w-60 h-60 rounded-circle text-center l-h-70">
										<i class="fa-solid fa-truck-medical"></i>
										</div>
										<div>
											<p class="text-fade fs-16 mb-0">Ambulance</p>
											<h3 class="fw-500 my-0">10</h3>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal center-modal fade" id="modal-available" tabindex="-1">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-body">
			
			          	      <div class="row">
								 
									  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Timing</label>
						<asp:DropDownList ID="timing" runat="server"  class="form-control" >
                        <asp:ListItem>08 AM to 09 AM</asp:ListItem>
                        <asp:ListItem>09 AM to 10 AM</asp:ListItem>
                        <asp:ListItem>10 AM to 10:30 AM</asp:ListItem>
                        <asp:ListItem>11 AM to 11:30 AM</asp:ListItem>
                        <asp:ListItem>12 PM to 01 PM</asp:ListItem>
                        <asp:ListItem>01 PM to 01:30 PM</asp:ListItem>
                        <asp:ListItem>01 PM to 02 PM</asp:ListItem>
                        <asp:ListItem>02 PM to 02:30 PM</asp:ListItem>
                        <asp:ListItem>02 PM to 03 PM</asp:ListItem>
                        <asp:ListItem>03 PM to 03:30 PM</asp:ListItem>
                        <asp:ListItem>03 PM to 04 PM</asp:ListItem>
                        <asp:ListItem>04 PM to 05 PM</asp:ListItem>
                        <asp:ListItem>05 to 06 PM</asp:ListItem>
                        <asp:ListItem>06 to 07 PM</asp:ListItem>
                        <asp:ListItem>07 to 08 PM</asp:ListItem>
               
                     
                    </asp:DropDownList>
									</div>
									</div>
										  
									  <div class="col-md-6">
									<div class="form-group">
								  <label class="form-label">Fees</label>
								 <asp:Textbox ID="fees" runat="server"  class="form-control"/>
								</div>
								</div>
								 
								
			                  
		               </div>
			  <div class="modal-footer modal-footer-uniform">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			
	
		  </div>
			    
				 
		               </div>

		 
		</div>
	
	</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-12">						
							<div class="box">
								<div class="box-header">
									<h4 class="box-title">Treatment </h4>
								</div>
												<div class="box-body">
					<div class="">
					
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
				</div>
							</div>
						</div>
					
						<div class="col-xl-6 col-12">						
							<div class="box">
								
								<div class="box-body">	
									<div class="news-slider owl-carousel owl-sl">	
										<div>
											<div class="d-flex align-items-center mb-10">
												<div class="me-15">
													<img src="../images/avatar/1.jpg" class="w-auto avatar avatar-lg rounded10 bg-primary-light" alt="" />
												</div>
												
												
											</div>
											<div class="d-flex justify-content-between align-items-end mt-40 py-10 bt-dashed border-top">
												<div>
													<p class="mb-0 text-muted"><i class="fa fa-clock-o me-5"></i> 10:00 <span class="mx-20">$ 30</span></p>
												</div>
												<div>
													
												</div>
											</div>
										</div>
										<div>
											
											<div class="d-flex justify-content-between align-items-end mt-40 py-10 bt-dashed border-top">
												<div>
													<p class="mb-0 text-muted"><i class="fa fa-clock-o me-5"></i> 10:30 <span class="mx-20">$ 50</span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div>
											
											<div class="d-flex justify-content-between align-items-end mt-40 py-10 bt-dashed border-top">
												<div>
													<p class="mb-0 text-muted"><i class="fa fa-clock-o me-5"></i> 11:00 <span class="mx-20">$ 70</span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-12">						
							<div class="box">
								
								<div class="box-body">	
									<div class="news-slider owl-carousel owl-sl">	
										<div>
											<div class="d-flex align-items-center mb-10">
												<div class="d-flex flex-column flex-grow-1 fw-500">
													<p class="hover-primary text-fade mb-1 fs-14"><i class="fa fa-link"></i> Shawn Hampton</p>
													<span class="text-dark fs-16">Beta 2 Microglobulin</span>
													<p class="mb-0 fs-14">Marker Test <span class="badge badge-dot badge-primary"></span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
											<div class="d-flex justify-content-between align-items-end py-10">
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Details</a>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Contact Patient</a>
												</div>
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light"><i class="fa fa-check"></i> Archive</a>
												</div>
											</div>
										</div>
										<div>
											<div class="d-flex align-items-center mb-10">
												<div class="d-flex flex-column flex-grow-1 fw-500">
													<p class="hover-primary text-fade mb-1 fs-14"><i class="fa fa-link"></i> Johen Doe</p>
													<span class="text-dark fs-16">Keeping pregnant</span>
													<p class="mb-0 fs-14">Prga Test <span class="badge badge-dot badge-primary"></span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
											<div class="d-flex justify-content-between align-items-end py-10">
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Details</a>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Contact Patient</a>
												</div>
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light"><i class="fa fa-check"></i> Archive</a>
												</div>
											</div>
										</div>
										<div>
											<div class="d-flex align-items-center mb-10">
												<div class="d-flex flex-column flex-grow-1 fw-500">
													<p class="hover-primary text-fade mb-1 fs-14"><i class="fa fa-link"></i> Polly Paul</p>
													<span class="text-dark fs-16">USG + Consultation</span>
													<p class="mb-0 fs-14">Marker Test <span class="badge badge-dot badge-primary"></span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
											<div class="d-flex justify-content-between align-items-end py-10">
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Details</a>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Contact Patient</a>
												</div>
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light"><i class="fa fa-check"></i> Archive</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
					</div>					
				</div>
				<div class="col-xl-4 col-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">Available Doctors</h4>
						
						</div>
						<div class="box-body">
							<div class="inner-user-div3">
						

                <asp:GridView ID="availabledoc" runat="server" AutoGenerateColumns="false" 
                    DataKeyNames="id" CssClass="table  table-hover display nowrap margin-top-4 w-p50 table-responsive" >
                    <Columns>
						<asp:ImageField DataImageUrlField="profile" HeaderText="Profile" ControlStyle-CssClass="rounded-circle bg-primary"></asp:ImageField>    
                       		  <asp:BoundField DataField="fname" HeaderText="Name" />  		
                       		  <asp:BoundField DataField="emailid" HeaderText="Email"/>	
                     	
                    </Columns>
				
                </asp:GridView>
               
       
							</div>
						</div>
					</div>
					
					
					
				
			</div>			
		</section>
		<!-- /.content -->
	  </div>
  </div>

    </form>

	

	<script src="/css/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	<script src="/css/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
   <script src="/js/vendors.min.js"></script>
	<script src="/js/pages/chat-popup.js"></script>
    <script src="/css/assets/icons/feather-icons/feather.min.js"></script>
	<script src="/js/pages/chart-widgets.js"></script>
    <script src="/js/pages/chartjs-int.js"></script>
		<script src="js/pages/dashboard2.js"></script>
	    <script src="/js/jquery.easing.min.js"></script>
	 <script src="/js/jquery.min.js"></script>
  <script src="/js/bootstrap.bundle.min.js"></script>
    	
</body>
</html>