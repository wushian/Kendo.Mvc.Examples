﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="chart-wrapper">
    <%= Html.Kendo().Chart()
            .Name("chart")
            .Title("GDP growth and standard deviation")
            .Legend(legend => legend.Visible(false))
            .Series(series =>
                series.Area(new double[] { 7.943, 7.848, 9.284, 9.263, 9.801, 3.890, 8.238, 9.552 }).Name("India")
                    .ErrorBars(errorBars => errorBars.Value("stddev"))
            )
            .ValueAxis(axis => axis
                .Numeric()
                    .Labels(labels => labels.Format("{0}%"))
                    .Line(line => line.Visible(false))
                    .AxisCrossingValue(0, int.MinValue)
            )
            .CategoryAxis(axis => axis
                .Line(line => line.Visible(false))
                .Categories("2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010")
            )
            .Tooltip(tooltip => tooltip
                .Visible(true)
                .Format("{0}%")
                .Template("#= value # (σ = #= kendo.toString(high - low, 'N2') #)")
            )
    %>
</div>

</asp:Content>
