﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
<style>
    #chart {
        background: center no-repeat url('@Url.Content("~/Content/shared/world-map.png")');
        height: 430px;
    }

    <!-- Load Pako ZLIB library to enable PDF compression -->
    <script src="@Url.Content("~/Scripts/pako.min.js")"></script>
</style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="box">
    <h4>Export chart</h4>
    <div class="box-col">
        <button class='export-pdf k-button'>Save as PDF</button>
    </div>
</div>

<script>
    $(".export-pdf").click(function () {
        $("#chart").getKendoChart().saveAsPDF();
    });
</script>

<%= Html.Kendo().Chart()
    .Name("chart")
    .Pdf(pdf => pdf
        .FileName("Kendo UI Chart Export.pdf")
        .ProxyURL(Url.Action("Pdf_Export_Save", "Chart_Api"))
    )
    .Name("chart")
    .Title(title => title
        .Text("Gross domestic product growth \n /GDP annual %/")
        .Font("bold 16px 'DejaVu Sans'")
    )
    .Legend(legend => legend
        .Position(ChartLegendPosition.Bottom)
    )
    .ChartArea(chartArea => chartArea
        .Background("transparent")
    )
    .SeriesDefaults(seriesDefaults =>
        seriesDefaults.Area().Line(line => line.Style(ChartAreaStyle.Smooth))
    )
    .Series(series =>
    {
        series.Area(new double[] { 3.907, 7.943, 7.848, 9.284, 9.263, 9.801, 3.890, 8.238, 9.552, 6.855 }).Name("India");
        series.Area(new double[] { 1.988, 2.733, 3.994, 3.464, 4.001, 3.939, 1.333, -2.245, 4.339, 2.727 }).Name("World");
        series.Area(new double[] { -0.253, 0.362, -3.519, 1.799, 2.252, 3.343, 0.843, 2.877, -5.416, 5.590 }).Name("Haiti");
    })
    .CategoryAxis(axis => axis
        .Categories("2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011")
        .MajorGridLines(lines => lines.Visible(false))
    )
    .ValueAxis(axis => axis
        .Numeric()
        .Labels(labels => labels.Format("{0}%"))
        .AxisCrossingValue(-10)
        .Line(line => line.Visible(false))
    )
    .Tooltip(tooltip => tooltip
        .Visible(true)
        .Format("{0}%")
        .Template("#= series.name #: #= value #")
    )
%>
</asp:Content>
