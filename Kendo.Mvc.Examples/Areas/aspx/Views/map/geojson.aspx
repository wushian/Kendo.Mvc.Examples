<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<%: Html.Kendo().Map()
      .Name("map")
      .Center(30.2681, -97.7448)
      .Zoom(3)
      .Layers(layers =>
       {
           layers.Add()
              .Style(style => style.Fill(fill => fill.Opacity(0.7)))
              .Type(MapLayerType.Shape)
              .DataSource(dataSource => dataSource
                  .GeoJson()
                  .Read(read => read.Url(Url.Content("~/Content/dataviz/map/countries-users.geo.json")))
              );
       })
       .Events(events => events
           .ShapeCreated("onShapeCreated")
           .ShapeMouseEnter("onShapeMouseEnter")
           .ShapeMouseLeave("onShapeMouseLeave")
        )
%>

<script src="<%=Url.Content("~/Content/dataviz/map/js/chroma.min.js") %>"></script>

<script>
    var scale = chroma
           .scale(["white", "green"])
           .domain([1, 1000]);

    function onShapeCreated(e) {
        var shape = e.shape;
        var users = shape.dataItem.properties.users;
        if (users) {
            var color = scale(users).hex();
            shape.options.fill.set("color", color);
        }
    }

    function onShapeMouseEnter(e) {
        e.shape.options.set("fill.opacity", 1);
    }

    function onShapeMouseLeave(e) {
        e.shape.options.set("fill.opacity", 0.7);
    }
</script>
</asp:Content>
