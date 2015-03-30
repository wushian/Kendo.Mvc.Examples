﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master"
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.RequestDetail>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="chart-wrapper">
    <%= Html.Kendo().Chart(Model)
        .Name("chart")
        .Title(title => title
            .Text("Request latency breakdown")
        )
        .Legend(legend => legend
            .Visible(false)
        )
        .Series(series => series
            .HorizontalWaterfall(
                model => model.Elapsed,
                model => model.Caption,
                model => model.Summary
            )
            .ColorHandler("pointColor")
        )
        .AxisDefaults(axis => axis
            .MajorGridLines(lines => lines.Visible(false))
        )
        .ValueAxis(axis => axis.Numeric()
            .Labels(labels => labels.Format("{0} ms"))
        )
    %>
</div>
<script>
    var palette = ["#95c3cd", "#abc75b", "#c6816f", "#968cb2", "#c0c0c0", "#2ba6ff"];
    function pointColor(point) {
        return palette[point.index % palette.length];
    }
</script>
</asp:Content>
