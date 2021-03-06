﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="chart-wrapper">
    <%= Html.Kendo().Chart()
        .Name("chart")
        .Title("Inventory")
        .Legend(legend => legend
            .Visible(false)
        )
        .Series(series => series
            .Waterfall(new int[] { 180, -60, -20, 10, 30 })
            .Labels(l => l.Visible(true))
        )
        .CategoryAxis(axis => axis
            .Categories("In stock", "Damaged", "Reserved", "In transit", "Refurbished")
        )
        .AxisDefaults(axis => axis
            .MajorGridLines(lines => lines.Visible(false))
        )
    %>
</div>
</asp:Content>
