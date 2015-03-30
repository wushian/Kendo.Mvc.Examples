<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<%= Html.Kendo().Grid<Kendo.Mvc.Examples.Models.OrderViewModel>()
    .Name("grid")
    .Columns(columns =>
    {
        columns.Bound(p => p.OrderID).Filterable(ftb => ftb.Cell(cell => cell.ShowOperators(false))).Width(220);
        columns.Bound(p => p.ShipName).Width(500).Filterable(ftb => ftb.Cell(cell => cell.Operator("contains")));
        columns.Bound(p => p.Freight).Width(250).Filterable(ftb => ftb.Cell(cell => cell.Operator("gte")));
        columns.Bound(p => p.OrderDate).Format("{0:MM/dd/yyyy}");
    })
    .Pageable()
    .Sortable()
    .Scrollable()
    .Filterable(ftb => ftb.Mode(GridFilterMode.Row))
    .HtmlAttributes(new { style = "height:430px;" })
    .DataSource(dataSource => dataSource
        .Ajax()
        .PageSize(20)
        .ServerOperation(true)
        .Read(read => read.Action("Orders_Read", "Grid"))
     )
%>

</asp:Content>