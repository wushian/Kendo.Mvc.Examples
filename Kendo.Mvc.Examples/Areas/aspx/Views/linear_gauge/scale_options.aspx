<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #gauge-container {
            text-align: center;
            background: transparent url(<%= Url.Content("~/Content/dataviz/gauge/linear-gauge-container.png") %>) no-repeat 50% 50%;
            padding: 18px;
            width: 300px;
            height: 300px;
            margin: auto;
        }

        #gauge-container.horizontal {
            background-image: url(<%= Url.Content("~/Content/dataviz/gauge/linear-gauge-container-h.png") %>);
        }

        #gauge {
            width: 100%;
            height: 100%;
            margin: 0 auto 0;
            border-color: transparent;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="box">
    <h4>Gauge scale should...</h4>
    <ul class="options">
        <li>
            <input id="vertical" checked="checked" type="checkbox" autocomplete="off">
            <label for="vertical">... be vertical</label>
        </li>

        <li>
            <input id="labels" checked="checked" type="checkbox" autocomplete="off">
            <label for="labels">... show labels</label>
        </li>

        <li>
            <input id="ranges" checked="checked" type="checkbox" autocomplete="off">
            <label for="ranges">... show ranges</label>
        </li>
    </ul>
</div>
<div id="gauge-container">
    <%= Html.Kendo().LinearGauge()
            .Name("gauge")
            .Pointer(pointer => pointer
                .Value(65)
                .Shape(GaugeLinearPointerShape.Arrow)
            )
            .Scale(scale => scale
                .MajorUnit(20)
                .MinorUnit(5)
                .Max(180)
                .Ranges(ranges => {
                        ranges.Add().From(80).To(120).Color("#ffc700");
                        ranges.Add().From(120).To(150).Color("#ff7a00");
                        ranges.Add().From(150).To(180).Color("#c20000");
                    }
                )
            )
            .HtmlAttributes(new { style = "width:200px;" })
    %>
</div>

<script>
    $(document).ready(function () {
        $(".box").bind("change", refresh);
        window.configuredRanges = $("#gauge").data("kendoLinearGauge").options.scale.ranges;
    });

    function refresh() {
        var gauge = $("#gauge").data("kendoLinearGauge"),
            showLabels = $("#labels").prop("checked"),
            showRanges = $("#ranges").prop("checked"),
            isVertical = $("#vertical").prop("checked"),
            positionInputs = $("input[name='labels-position']"),
            options = gauge.options;

        options.transitions = false;
        options.scale.labels = options.scale.labels || {};
        options.scale.labels.visible = showLabels;
        options.scale.vertical = isVertical;
        options.scale.ranges = showRanges ? window.configuredRanges : [];

        $("#gauge-container").toggleClass("horizontal", !isVertical);

        gauge.redraw();
    }
</script>
</asp:Content>