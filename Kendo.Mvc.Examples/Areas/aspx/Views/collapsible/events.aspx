<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<% Html.Kendo().MobileView()
        .Name("collapsible-events")        
        .Title("Collapsible events")
        .Content(() =>
        {
            %>
            <% Html.Kendo().MobileCollapsible()
                .Header("Collapsible header")
                .Content("Collapsible Content")
                .Events(e => e.Collapse("onCollapse").Expand("onExpand"))
                .Render();
            %>
            <div class="console" style="min-width: 200px;"></div>
            <%
        })
        .Render();
%>

<script>
    function onCollapse(e) {
        kendoConsole.log("collapse");
    }

    function onExpand(e) {
        kendoConsole.log("expand");
    }
</script>

</asp:Content>