﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<script id="dataCellTemplate" type="text/x-kendo-tmpl">
    # var columnMember = columnTuple ? columnTuple.members[0] : { children: [] }; #
    # var rowMember = rowTuple ? rowTuple.members[0] : { children: [] }; #
    # var value = kendo.toString(kendo.parseFloat(dataItem.value) || "N/A", "c2"); #

    # if (columnMember.children.length || rowMember.children.length) { #
        <em  style="color: red">#: value # (total)</em>
    # } else { #
        #: value #
    # } #
</script>

<script id="headerTemplate" type="text/x-kendo-tmpl">
    # if (!member.children.length) { #
        <em>#: member.caption #</em>
    # } else { #
        #: member.caption #
    # } #
</script>

<%= Html.Kendo().PivotGrid()
    .Name("pivotgrid")
    .ColumnWidth(200)
    .Height(570)
    .DataCellTemplateId("dataCellTemplate")
    .ColumnHeaderTemplateId("headerTemplate")
    .RowHeaderTemplateId("headerTemplate")
    .DataSource(dataSource => dataSource.
        Xmla()
        .Columns(columns => columns.Add("[Date].[Calendar]").Expand(true))
        .Rows(rows => rows.Add("[Product].[Product Line]").Expand(true))
        .Measures(measures => measures.Values(new string[]{"[Measures].[Reseller Freight Cost]"}))
        .Transport(transport => transport
            .Connection(connection => connection
                .Catalog("Adventure Works DW 2008R2")
                .Cube("Adventure Works"))
            .Read(read => read
                .Url("http://demos.telerik.com/olap/msmdpump.dll")
                .DataType("text")
                .ContentType("text/xml")
                .Type(HttpVerbs.Post)
            )
        )
    )
%>

<script>
    function onError(e) {
        alert("error: " + kendo.stringify(e.errors[0]));
    }
</script>
</asp:Content>
