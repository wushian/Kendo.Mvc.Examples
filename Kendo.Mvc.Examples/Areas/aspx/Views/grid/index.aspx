<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" 
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.ProductViewModel>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div id="clientsDb">
    <%: Html.Kendo().Grid<Kendo.Mvc.Examples.Models.CustomerViewModel>()
        .Name("grid")
        .Columns(columns =>
        {
            columns.Bound(c => c.ContactName).Width(140);
            columns.Bound(c => c.ContactTitle).Width(190);
            columns.Bound(c => c.CompanyName);
            columns.Bound(c => c.Country).Width(110);
        })
        .HtmlAttributes(new { style = "height: 380px;" })
        .Scrollable()
        .Groupable()
        .Sortable()
        .Pageable(pageable => pageable
            .Refresh(true)
            .PageSizes(true)
            .ButtonCount(5))
        .DataSource(dataSource => dataSource
            .Ajax()
            .Read(read => read.Action("Customers_Read", "Grid"))
        )
     %>
</div>

<style>
    #clientsDb {
        width: 952px;
        height: 396px;
        margin: 20px auto 0;
        padding: 51px 4px 0 4px;
        background: url('<%=Url.Content("~/content/web/grid/clientsDb.png")%>') no-repeat 0 0;
    }
</style>
</asp:Content>
