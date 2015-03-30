﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="diagram-wrapper" style="margin: auto;">
    <%= Html.Kendo().Diagram()
            .Name("diagram")
            .DataSource(dataSource => dataSource
                .Read(read => read.Action("_DiagramTree", "Diagram")).Model(m => m.Children("Items"))
            )
            .Layout(l => l
                .Type(DiagramLayoutType.Tree)
                .Subtype(DiagramLayoutSubtype.Down)
                .HorizontalSeparation(30)
                .VerticalSeparation(20)
            )
            .ShapeDefaults(sd => sd
                .Width(40)
                .Height(40)
            )
    %>
</div>
<div class="configuration-horizontal">
    <div class="config-section">
        <label for="subtype">Layout: </label>
           <select id="subtype">
                <option value="down">Tree Down</option>
                <option value="up">Tree Up</option>
                <option value="tipover">Tipover Tree</option>
            </select>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#subtype").change(function () {
            $("#diagram").getKendoDiagram().layout({
                subtype: $(this).val(),
                type: "tree",
                horizontalSeparation: 30,
                verticalSeparation: 20
            });
        });
    });
</script>
</asp:Content>