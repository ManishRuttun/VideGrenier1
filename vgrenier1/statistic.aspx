<%@ Page Title="Statistic" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="statistic.aspx.cs" Inherits="vgrenier1.statistic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
<section style="background-color:#f4efee">
    <h2 class="text-center">View Statistic</h2>
    <hr />

     <div class="container-fluid" style="margin-left:37%;">
        <%--<div class="row ">--%>
            <div class="col-xl-3 col-md-6">
                <div class="card text-white mb-4" style="background: linear-gradient(225deg, #5961f3 0%, #363348 100%)">
                    <div class="card-body">No of product:</div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
                        <asp:HyperLink ID="hyproduct" runat="server" CssClass="small 
text-white stretched-link"></asp:HyperLink>
                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card text-white mb-4" style="background: linear-gradient(135deg, #9daf43 0%, #fb6023 100%)">
                    <div class="card-body">No of User</div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
                        
                        <asp:HyperLink ID="hyuser" runat="server" CssClass="small 
text-white stretched-link"></asp:HyperLink>

                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card text-white mb-4" style="background: linear-gradient(225deg, #18d115 0%, #4c7ae6 100%)">
                    <div class="card-body">No of Category</div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
                        <asp:HyperLink ID="hycat" runat="server" CssClass="small 
text-white stretched-link"></asp:HyperLink>
                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    </section>
</asp:Content>
