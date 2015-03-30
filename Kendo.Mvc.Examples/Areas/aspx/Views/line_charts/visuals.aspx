<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.Forecast>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="chart-wrapper">
    <%= Html.Kendo().Chart(Model)
        .Name("chart")
        .Title("Forecast")
        .Legend(legend => legend.Visible(false))
        .SeriesDefaults(seriesDefaults => seriesDefaults.Line().Style(ChartLineStyle.Smooth))
        .Series(series => 
        {
            series.Line(model => model.Temperature).CategoryField("Day")
                .Markers(markers => markers
                    .Size(32)
                    .Visual("markerVisual")
                )
                .Highlight(highlight => highlight.Toggle("toggleHandler"));
        })
        .CategoryAxis(axis => axis
            .MajorGridLines(majorGridLines => majorGridLines.Visible(false))
        )
        .ValueAxis(axis => axis.Numeric()
            .Labels(labels => labels.Template("#:value#℃"))
        )
        .Tooltip(tooltip => tooltip
            .Visible(true)
            .Template("#= category #: #= value #℃")
        )
    %>
</div>

<script>
    function toggleHandler(e) {
        e.preventDefault();
        var visual = e.visual;
        var transform = null;
        if (e.show) {
            transform = kendo.geometry.transform().scale(1.5, 1.5, visual.rect().center());
        }
        visual.transform(transform);
    }

    function markerVisual(e) {
        var src = kendo.format('<%=Url.Content("~/content/dataviz/chart/images/{0}.png")%>', e.dataItem.Weather);
        var image = new kendo.drawing.Image(src, e.rect);
        return image;
    }

</script>
</asp:Content>
