﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="chart-wrapper">
    <%= Html.Kendo().Chart()
            .Name("chart")
            .Title("Gross domestic product growth /GDP annual %/")
            .Legend(legend => legend.Visible(false))
            .SeriesDefaults(seriesDefaults => seriesDefaults.Line()
                .ErrorBars(errorBars => errorBars.Value("percentage(20)"))
            )
            .Series(series => 
                {
                    series.Line(new double[] { 3.907, 7.943, 7.848, 9.284, 9.263, 9.801, 3.890, 8.238, 9.552, 6.855 }).Name("India");
                    series.Line(new double[] { 1.988, 2.733, 3.994, 3.464, 4.001, 3.939, 1.333, -2.245, 4.339, 2.727 }).Name("World");
                }
            )
            .ValueAxis(axis => axis
                .Numeric()
                    .Labels(labels => labels.Format("{0}%")) 
                    .Line(line => line.Visible(false))                               
                    .AxisCrossingValue(0, int.MinValue)
            )
            .CategoryAxis(axis => axis      
                .Line(line => line.Visible(false))
                .Labels(labels => labels.Padding(80, 0, 0, 0))
                .Categories("2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011")
            )
            .Tooltip(tooltip => tooltip
                .Visible(true)
                .Format("{0}%")
                .Template("#= series.name #: #= value #")
            )
    %>
</div>

</asp:Content>