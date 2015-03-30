<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="chart-wrapper">
<h2>Website optimization stats</h2>
    <%=
        Html.Kendo().Chart((IEnumerable<Kendo.Mvc.Examples.Models.SiteOptimizationItem>)ViewData["before"]).Name("before")
        .Series(srs =>                
            srs.Funnel(
                m => m.Visitors,
                m => m.Description
            )
            .DynamicSlope(true)
            .DynamicHeight(false)
            .Labels(
                lbls=>lbls
                    .Color("black")
                    .Visible(true)
                    .Background("transparent")
                    .Template("#= category #: #= value #")
                    .Align(ChartFunnelLabelsAlign.Left)
            )
        )
        .Title("Before optimization")
        .Legend(false)
        .Tooltip(
            tt=>tt.Visible(true).Template("#= category # #= kendo.format('{0:p}',value/dataItem.parent()[0].Visitors)#")
        )
    %>
    <%=
        Html.Kendo().Chart((IEnumerable<Kendo.Mvc.Examples.Models.SiteOptimizationItem>)ViewData["after"]).Name("after")
        .Series(srs =>                
            srs.Funnel(
                m => m.Visitors,
                m => m.Description
            )
            .DynamicSlope(true)
            .DynamicHeight(false)
            .Labels(
                lbls=>lbls
                    .Color("black")
                    .Visible(true)
                    .Background("transparent")
                    .Template("#= category #: #= value #")
                    .Align(ChartFunnelLabelsAlign.Left)
            )
        )
        .Title("After optimization")
        .Legend(false)
        .Tooltip(
            tt=>tt.Visible(true).Template("#= category # #= kendo.format('{0:p}',value/dataItem.parent()[0].Visitors)#")
        )
    %>
</div>
<style>
    .chart-wrapper {
        height: 400px;
        width:730px;
        margin:20px auto;
    }
    .chart-wrapper h2 {
        padding: 20px 0 0 25px;
    }
    .chart-wrapper .k-chart {
        display: inline-block;
        width: 290px;
        height: 350px;
        margin: 0 30px 0 20px;
    }
</style>

</asp:Content>