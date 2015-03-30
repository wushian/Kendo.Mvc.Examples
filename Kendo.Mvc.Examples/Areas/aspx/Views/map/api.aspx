<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
<style>
    .demo-section {
        width: 700px;
    }
</style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="map-wrapper" style="margin: auto;">
    <%: Html.Kendo().Map()
        .Name("map")
        .Center(30.268107, -97.744821)
        .Zoom(3)
        .Layers(layers =>
        {
            layers.Add()
                .Type(MapLayerType.Tile)
                .UrlTemplate("http://tile2.opencyclemap.org/transport/#= zoom #/#= x #/#= y #.png")
                .Subdomains("a", "b", "c")
                .Attribution("&copy; <a href='http://osm.org/copyright'>OpenStreetMap contributors</a>." +
                                "Tiles courtesy of <a href='http://www.opencyclemap.org/'>Andy Allan</a>");
        })
        .Events(e => e
            .PanEnd("updateControls")
            .ZoomEnd("updateControls")
        )
    %>
</div>
<div class="configuration-horizontal" id="mapConfig">
    <div class="config-section">
        <span class="configHead">Center</span>
        <ul class="options">
            <li>
                <input id="centerLat" data-role="numerictextbox"
                        data-format="N4" value="30.2681" data-decimals="4" />
                <input id="centerLng" data-role="numerictextbox"
                        data-format="N4" value="-97.7448" data-decimals="4" />
                <button id="center" class="k-button">center()</button>
            </li>
        </ul>
    </div>
    <div class="config-section">
        <span class="configHead">Zoom level</span>
        <ul class="options">
            <li>
                <select id="zoomLevel" data-role="dropdownlist">
                    <option value="1">1 (min)</option>
                    <option value="2">2</option>
                    <option value="3" selected="selected">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18 (max)</option>
                </select>
                <button id="zoom" class="k-button">zoom()</button>
            </li>
        </ul>
    </div>
</div>
<script>
    function updateControls() {
        var map = $("#map").data("kendoMap");
        var center = map.center();

        if (kendo.ui.NumericTextBox) {
            $("#centerLat").data("kendoNumericTextBox").value(center.lat);
            $("#centerLng").data("kendoNumericTextBox").value(center.lng);
            $("#zoomLevel").data("kendoDropDownList").value(map.zoom());
        }
    }

    $(document).ready(function () {
        kendo.init($("#mapConfig"));

        $("#center").click(function (e) {
            $("#map").data("kendoMap").center([
                parseFloat($("#centerLat").val()),
                parseFloat($("#centerLng").val())
            ]);
        });

        $("#zoom").click(function (e) {
            $("#map").data("kendoMap").zoom(
                parseInt($("#zoomLevel").val(), 10)
            );
        });
    });
</script>
</asp:Content>