﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.DatePoint>>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .chart-wrapper, .chart-wrapper .k-chart
        {
            height: 300px;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.Kendo().Chart(Model)
        .Name("chart")
        .Series(series =>
        {
            series
                .Column(model => model.Value, categoryExpression: model => model.Date)
                .Aggregate(ChartSeriesAggregate.Avg);
        })
        .CategoryAxis(axis => axis
            .Date()
            .BaseUnit(ChartAxisBaseUnit.Weeks)
            .MajorGridLines(lines => lines.Visible(false))
        )
        .ValueAxis(axis => axis
            .Numeric()
            .Line(line => line.Visible(false))
        )
    %>
    <div class="configuration-horizontal">
        <div class="config-section">
            <span class="configHead">Base date unit</span>
            <ul class="options">
                <li>
                    <input id="baseUnitAuto" name="baseUnit" type="radio" value="" autocomplete="off" />
                    <label for="baseUnitAuto">
                        Automatic (default)</label>
                </li>
                <li>
                    <input id="baseUnitYears" name="baseUnit" type="radio" value="years" autocomplete="off" />
                    <label for="baseUnitYears">
                        Years</label>
                </li>
                <li>
                    <input id="baseUnitMonths" name="baseUnit" type="radio" value="months" autocomplete="off" />
                    <label for="baseUnitMonths">
                        Months</label>
                </li>
                <li>
                    <input id="baseUnitWeeks" name="baseUnit" type="radio" value="weeks" checked="checked"
                        autocomplete="off" />
                    <label for="baseUnitWeeks">
                        Weeks</label>
                </li>
                <li>
                    <input id="baseUnitDays" name="baseUnit" type="radio" value="days" autocomplete="off" />
                    <label for="baseUnitDays">
                        Days</label>
                </li>
            </ul>
        </div>
        <div class="config-section">
            <span class="configHead">Aggregate function</span>
            <ul class="options">
                <li>
                    <input id="aggregateMax" name="aggregate" type="radio" value="max" autocomplete="off" />
                    <label for="aggregateMax">
                        Max (default)</label>
                </li>
                <li>
                    <input id="aggregateMin" name="aggregate" type="radio" value="min" autocomplete="off" />
                    <label for="aggregateMin">
                        Min</label>
                </li>
                <li>
                    <input id="aggregateSum" name="aggregate" type="radio" value="sum" autocomplete="off" />
                    <label for="aggregateSum">
                        Sum</label>
                </li>
                <li>
                    <input id="aggregateAvg" name="aggregate" type="radio" value="avg" checked="checked"
                        autocomplete="off" />
                    <label for="aggregateAvg">
                        Avg</label>
                </li>
                <li>
                    <input id="aggregateCount" name="aggregate" type="radio" value="count" autocomplete="off" />
                    <label for="aggregateCount">
                        Count</label>
                </li>
            </ul>
            <p>
                Custom aggregate functions are supported.</p>
        </div>
    </div>
    <script>
        $(".configuration-horizontal").bind("change", refresh);

        function refresh() {
            var chart = $("#chart").data("kendoChart"),
            series = chart.options.series,
            categoryAxis = chart.options.categoryAxis,
            baseUnitInputs = $("input:radio[name=baseUnit]"),
            aggregateInputs = $("input:radio[name=aggregate]");

            for (var i = 0, length = series.length; i < length; i++) {
                series[i].aggregate = aggregateInputs.filter(":checked").val();
            }

            categoryAxis.baseUnit = baseUnitInputs.filter(":checked").val();

            chart.refresh();
        }
    </script>
</asp:Content>
