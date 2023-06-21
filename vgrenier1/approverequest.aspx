<%@ Page Title="Approve and Reject" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="approverequest.aspx.cs" Inherits="vgrenier1.approverequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
    .viewprod {
            background: radial-gradient(circle at right top, #a2aeec , #cba2ec);
            
            margin: auto;
            width:80%;
            
        }

            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
        <section style="background: radial-gradient(circle at right top, #a2aeec , #cba2ec)">
            <div class="viewprod mb-3" style="text-align:center">
                    <h2 class=" text-center mt-" style="padding-top: 10px;">Approve and Reject Request: </h2>

    

     <asp:GridView ID="gvs" OnPreRender="gvs_PreRender" ClientIDMode="Static" CssClass="table table-striped table-bordered table-hover
table-bordered"
        runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:ImageField DataImageUrlField="image"
             DataImageUrlFormatString="~/images/{0}" ControlStyle-Width="60" HeaderText="Profile Pic" />
            <asp:BoundField DataField="fname" HeaderText="First Name" />
            <asp:BoundField DataField="lname" HeaderText="Last Name" />
            <asp:BoundField DataField="uname" HeaderText="Username" />
            
            <asp:BoundField DataField="accdate" HeaderText="Request Date&Time" />
            <asp:BoundField DataField="pname" HeaderText="Product name" />
            <asp:BoundField DataField="tupstatus" HeaderText="Access Status" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <%--store the movie id in the hiddenfield--%>
                    <asp:HiddenField ID="hidpro" runat="server" Value='<%# Eval("pid") %>' />
                    <%--store the user id in the LinkButtons--%>
                    <asp:LinkButton ID="lnkdeny" OnClick="lnkdeny_Click" CommandArgument='<%# Eval("user_id") %>' CssClass="btn btn-danger"
                        runat="server">Deny Access</asp:LinkButton><br />
                    <br />

                     <asp:HiddenField  ID="hidpro1" runat="server" Value='<%# Eval("pid") %>' />
                    <asp:LinkButton ID="lnkgrant" OnClick="lnkgrant_Click"  CommandArgument='<%# Eval("user_id") %>' CssClass="btn btn-success"
                        runat="server">Grant Access</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                </div>
            </section>
</asp:Content>

