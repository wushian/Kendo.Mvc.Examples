<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<% Html.Kendo().MobileView()
        .Name("collapsible-index")        
        .Title("Collapsible index")
        .Content(() =>
        {
            %>
            <% Html.Kendo().MobileCollapsible()
                .Header("Header 1")
                .Content("<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id lorem auctor, luctus urna non, viverra magna. Nulla facilisi. Curabitur accumsan auctor mauris. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec luctus massa non ante luctus volutpat.</p>")
                .Render()
            %>

            <% Html.Kendo().MobileCollapsible()
                .Header("Header 2")
                .Content("<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id lorem auctor, luctus urna non, viverra magna. Nulla facilisi. Curabitur accumsan auctor mauris. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec luctus massa non ante luctus volutpat.</p>")
                .Render()
            %>

            <% Html.Kendo().MobileCollapsible()
                .Header("Initially expanded")
                .Content("<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id lorem auctor, luctus urna non, viverra magna. Nulla facilisi. Curabitur accumsan auctor mauris. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec luctus massa non ante luctus volutpat.</p>")
                .Collapsed(false)
                .Render()
            %>

            <% Html.Kendo().MobileCollapsible()
                .Header("Icon position = right")
                .Content("<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id lorem auctor, luctus urna non, viverra magna. Nulla facilisi. Curabitur accumsan auctor mauris. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec luctus massa non ante luctus volutpat.</p>")
                .IconPosition(IconPosition.Right)
                .Render()
            %>
            <%
        })
        .Render();
%>

</asp:Content>