﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="chart-wrapper">
    <%= Html.Kendo().Chart()
          .Name("chart")
          .Title("A digital signal")
          .Legend(false)
          .Series(series => {
              series.Line(new double[] { 20, 1, 18, 3, 15, 5, 10, 6, 9, 6, 10, 5, 13, 3, 16, 1, 19, 1, 20, 2, 18, 5, 12, 7, 10, 8 })
                    .Style(ChartLineStyle.Smooth)
                    .Markers(x => x.Visible(false));
          })
          .CategoryAxis(axis => axis
              .Title("time")
              .MajorGridLines(lines => lines.Visible(false))
              .MajorTicks(lines => lines.Visible(false))
          )
          .ValueAxis(axis => axis.Numeric()
              .Max(22)
              .Title("voltage")
              .MajorGridLines(lines => lines.Visible(false))
              .Visible(false)
          )
    %> 
</div>

</asp:Content>
