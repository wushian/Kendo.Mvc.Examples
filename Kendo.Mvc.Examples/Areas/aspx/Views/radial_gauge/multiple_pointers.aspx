﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #gauge-container {
            background: transparent url(<%= Url.Content("~/Content/dataviz/gauge/gauge-container-partial.png") %>) no-repeat 50% 50%;
            width: 404px;
            height: 404px;
            text-align: center;
            margin: 0 auto 30px auto;
        }

        #gauge {
            width: 330px;
            height: 330px;
            margin: 0 auto 0;
        }
    </style> 
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div id="example" class="k-content">
        <div id="gauge-container">
            <%= Html.Kendo().RadialGauge()
              .Name("gauge")
              .Pointers(pointers =>
              {
                  pointers.Add().Value(10).Color("#c20000").Cap(c => c.Size(0.15));
                  pointers.Add().Value(70).Color("#ff7a00").Cap(c => c.Size(0.1));
                  pointers.Add().Value(140).Color("#ffc700"); 
              })
              .Scale(scale => scale
                     .MinorUnit(5)
                     .StartAngle(-30)
                     .EndAngle(210)
                     .Max(180)
              )
            %>
        </div>

        <div class="box">
            <div class="box-col">
                <h4>Red pointer value</h4>
                    <%= Html.Kendo().Slider().Name("gauge-value0")
                          .Min(0).Max(180).Value(10).ShowButtons(false)
                          .HtmlAttributes(new { style = "width: 220px;" })
                          .Events(e => e.Change("onSliderChange"))
                    %>
                <h4 style="margin-top: 30px;">Get all pointer values</h4>
                <button id="getValues" class="k-button">Get all</button>
            </div>
            <div class="box-col">
                <h4>Orange pointer value</h4>
                    <%= Html.Kendo().Slider().Name("gauge-value1")
                          .Min(0).Max(180).Value(70).ShowButtons(false)
                          .HtmlAttributes(new { style = "width: 220px;" })
                          .Events(e => e.Change("onSliderChange"))
                    %>
                <h4 style="margin-top: 30px;">Set all pointer values</h4>
                <input id="newValues" class="k-textbox" value="100, 10, 80" style="width: 110px;" />
                <button id="setValues" class="k-button">Set all</button>
            </div>
            <div class="box-col">
                <h4>Yellow pointer value</h4>
                    <%= Html.Kendo().Slider().Name("gauge-value2")
                          .Min(0).Max(180).Value(140).ShowButtons(false)
                          .HtmlAttributes(new { style = "width: 220px;" })
                          .Events(e => e.Change("onSliderChange"))
                    %>
            </div>
        </div>

        <script>
            function onSliderChange(e) {
                var id = this.element.attr("id");
                var pointerIndex = id.substr(id.length - 1);
                var gauge = $("#gauge").data("kendoRadialGauge");
                gauge.pointers[pointerIndex].value(this.value());
            }

            $("#getValues").click(function () {
                alert("All values: " + $("#gauge").data("kendoRadialGauge").allValues().join(", "));
            });

            $("#setValues").click(function () {
                var values = $("#newValues").val().split(",");

                values = $.map(values, function (val) {
                    return parseInt(val);
                });

                $("#gauge").data("kendoRadialGauge").allValues(values);
            });
        </script>
    </div>
</asp:Content>
