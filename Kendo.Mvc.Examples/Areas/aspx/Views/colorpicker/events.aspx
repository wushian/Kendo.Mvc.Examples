<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section">
    <div class="box-col" style="width: 260px;">
        <h4>FlatColorPicker:</h4>
        <%= Html.Kendo().FlatColorPicker()
                .Name("flatcolorpicker")
                .Events(events => events
                    .Change("flatChange")
                )
        %>    
    </div>
    <div class="box-col">
        <h4>ColorPicker (palette):</h4>
        <%= Html.Kendo().ColorPicker()
                .Name("palette-picker")
                .Value("#cc2222")
                .Palette(ColorPickerPalette.Basic)
                .Events(events => events
                    .Select("pickerSelect")
                    .Change("pickerChange")
                    .Open("pickerOpen")
                    .Close("pickerClose")
                )
        %>      
    </div>
    <div class="box-col">
        <h4>ColorPicker (HSV):</h4>
        <%= Html.Kendo().ColorPicker()
                .Name("hsv-picker")
                .Value("#22cc22")
                .Events(events => events
                    .Select("pickerSelect")
                    .Change("pickerChange")
                    .Open("pickerOpen")
                    .Close("pickerClose")
                )
        %>      
    </div>
    <div class="box-col">
        <h4>ColorPalette:</h4>
        <%= Html.Kendo().ColorPalette()
                .Name("palette")
                .Events(events => events
                    .Change("paletteChange")
                )
        %>       
    </div>
</div>

<script>

    function pickerSelect(e) {
        kendoConsole.log("Select in picker #" + this.element.attr("id") + " :: " + e.value);
    }

    function pickerChange(e) {
        kendoConsole.log("Change in picker #" + this.element.attr("id") + " :: " + e.value);
    }

    function pickerOpen(e) {
        kendoConsole.log("Open in picker #" + this.element.attr("id"));
    }

    function pickerClose(e) {
        kendoConsole.log("Close in picker #" + this.element.attr("id"));
    }

    function paletteChange(e) {
        kendoConsole.log("Change in color palette :: " + e.value);
    }

    function flatChange(e) {
        kendoConsole.log("Change in flat color picker :: " + e.value);
    }
</script>

<div class="box">
    <h4>Console log</h4>
    <div class="console"></div>
</div>
</asp:Content>