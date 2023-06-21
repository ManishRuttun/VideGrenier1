<%@ Page Title="Block User" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="blockuser.aspx.cs" Inherits="vgrenier1.blockuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        #gvs {
            width: 100%;
        }

        th {
            background: #494e5d;
            color: ;
        }
        .viewprod {
            background: linear-gradient(180deg, #d4a0de 0%, #51aac2 100%) ;
            
            margin: auto;
            width:80%;
            
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style="background: linear-gradient(180deg, #d4a0de 0%, #51aac2 100%)">
            <div class="viewprod mb-3" style="text-align:center">
                    <h2 class=" text-center mt-" style="padding-top: 10px;">Search and block active users:</h2>
    <div class="row">
        <div class="col-lg-12">
            
        </div>
    </div>
    <asp:GridView ID="gvs" CssClass="table table-striped table-bordered table-hover" OnPreRender="gvs_PreRender" ClientIDMode="Static"
        HeaderStyle-BackColor=""
        runat="server" AutoGenerateColumns="false">
        <Columns>
             <asp:ImageField DataImageUrlField="profile" ControlStyle-Width="50"
               DataImageUrlFormatString="~/images/{0}" HeaderText="Profile  Pic" />
            <asp:BoundField DataField="first_name" HeaderText="First Name" />
            <asp:BoundField DataField="last_name" HeaderText="Last Name" />
            <asp:BoundField DataField="username" HeaderText="Username" />
           
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <%-- Assign the User_Id to the link button using the CommandArgument --%>
                    <asp:LinkButton ID="lnkblock" CssClass="btn btn-outline-danger" OnClick="lnkblock_Click" CommandArgument='<%# Eval("user_id") %>'
                        runat="server">Block</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                </div>
        </section>
</asp:Content>
