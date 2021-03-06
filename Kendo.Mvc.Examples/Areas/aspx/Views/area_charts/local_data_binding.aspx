﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master"
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.InternetUsers>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="chart-wrapper">
    <%= Html.Kendo().Chart(Model)
        .Name("chart")
        .Title("Internet Users in United States")
        .Legend(legend => legend.Visible(false))
        .Series(series =>
        {
            series.Area(model => model.Value)
                .Name("United States")
                .Labels(labels => labels.Format("{0}%").Visible(true));
        })
        .CategoryAxis(axis => axis
            .Categories(model => model.Year)
            .MajorGridLines(lines => lines.Visible(false))
        )
        .ValueAxis(axis => axis.Numeric()
            .Labels(labels => labels.Format("{0}%"))
            .Line(line => line.Visible(false))
        )
        .Tooltip(tooltip => tooltip
            .Visible(true)
            .Format("{0}%")
            .Template("#= category # - #= value #%")
        )
    %>
</div>
</asp:Content>
