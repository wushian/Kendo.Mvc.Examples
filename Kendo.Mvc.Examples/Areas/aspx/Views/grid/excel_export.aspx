<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
    
<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.4.0/jszip.min.js"></script>

<%: Html.Kendo().Grid<Kendo.Mvc.Examples.Models.ProductViewModel>()    
    .Name("grid")    
    .HtmlAttributes( new { style = "width: 900px" } )
    .Columns(columns => {
        columns.Bound(p => p.ProductName).Width(300).Locked()
               .ClientFooterTemplate("Total Count: #=count#")
               .ClientGroupFooterTemplate("Count: #=count#");
        columns.Bound(p => p.UnitPrice).Width(300);
        columns.Bound(p => p.UnitsOnOrder).Width(300)
               .ClientFooterTemplate("Average: #=average#")
               .ClientGroupFooterTemplate("Average: #=average#");
        columns.Bound(p => p.UnitsInStock).Width(300)
               .ClientFooterTemplate("Min: #= min # Max: #= max #")
               .ClientGroupHeaderTemplate("Units In Stock: #= value # (Count: #= count#)");
    })
    .ToolBar(tools => tools.Excel())
    .Pageable()
    .Sortable()
    .Scrollable()
    .Groupable()
    .Excel(excel => excel
        .FileName("Kendo UI Grid Export.xlsx")
        .Filterable(true)
        .ProxyURL(Url.Action("Excel_Export_Save", "Grid"))
    )
    .Reorderable(r => r.Columns(true))
    .Resizable(r => r.Columns(true))
    .ColumnMenu()
    .DataSource(dataSource => dataSource
        .Ajax()                 
        .PageSize(7)
        .Group(g => g.Add(p => p.UnitsInStock))
        .Aggregates(aggregates =>
        {
             aggregates.Add(p => p.UnitsInStock).Min().Max().Count();
                aggregates.Add(p => p.UnitsOnOrder).Average();
                aggregates.Add(p => p.ProductName).Count();
                aggregates.Add(p => p.UnitPrice).Sum();
        })
        .Read(read => read.Action("Excel_Export_Read", "Grid"))
    )
%>
</asp:Content>