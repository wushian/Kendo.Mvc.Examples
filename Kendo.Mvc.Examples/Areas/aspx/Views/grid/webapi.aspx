<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<%: Html.Kendo().Grid<Kendo.Mvc.Examples.Models.ProductViewModel>()
      .Name("grid")
      .Columns(columns =>
      {
          columns.Bound(p => p.ProductName);
          columns.Bound(p => p.UnitPrice).Width(100);
          columns.Bound(p => p.UnitsInStock).Width(100);
          columns.Bound(p => p.Discontinued).Width(100);
          columns.Command(command => { command.Edit(); command.Destroy(); }).Width(172);
      })
      .ToolBar(tools =>
      {
          tools.Create();
      })
      .Sortable()
      .Pageable()
      .Filterable()
      .DataSource(dataSource => 
          dataSource.Ajax()
            .Model(model =>
            {
                model.Id(p => p.ProductID);
            })
            .Events(events => events.Error("error_handler"))
            .Read(read => read.Url(Url.Content("~/api/product")).Type(HttpVerbs.Get))
            .Create(create => create.Url(Url.Content("~/api/product")).Type(HttpVerbs.Post))
            .Update(update => update.Url(Url.Content("~/api/product")).Type(HttpVerbs.Put))
            .Destroy(destroy => destroy.Url(Url.Content("~/api/product")).Type(HttpVerbs.Delete))
      )
%>

<script>
    function error_handler(e) {
        var errors = $.parseJSON(e.xhr.responseText);

        if (errors) {
            alert("Errors:\n" + errors.join("\n"));
        }
    }

    $(function() {
        var grid = $("#grid").data("kendoGrid");

        // Web API needs the ID of the entity to be part of the URL e.g. PUT /api/Product/80
        grid.dataSource.transport.options.update.url = function(data) {
            return "<%= Url.Content("~/api/product/") %>" + data.ProductID;
        }

        // Web API needs the ID of the entity to be part of the URL e.g. DELETE /api/Product/80
        grid.dataSource.transport.options.destroy.url = function(data) {
            return "<%= Url.Content("~/api/product/") %>" + data.ProductID;
        }
    });
</script>
</asp:Content>
