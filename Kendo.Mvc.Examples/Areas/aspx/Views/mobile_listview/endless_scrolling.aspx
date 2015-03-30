﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%: Html.Kendo().MobileView()
       .Title("Scroll down to load")       
       .Content(obj =>          
            Html.Kendo().MobileListView<Kendo.Mvc.Examples.Models.ProductViewModel>()
                .Name("endless-scrolling")
                .TemplateId("template")
                .EndlessScroll(true)                    
                .ScrollTreshold(30)
                .DataSource(dataSource => 
                    dataSource
                        .Read("Scroll_Read", "Mobile_ListView")
                        .PageSize(20)                            
                )
        )   
%>

<script type="text/x-kendo-tmpl" id="template">
    <div class="product">
        <img src="<%:Url.Content("~/content/web/foods/")%>#=ProductID#.jpg" alt="#=ProductName# image" class="pullImage"/>
        <h3>#:ProductName#</h3>
        <p>#:kendo.toString(UnitPrice, "c")#</p>
    </div>
</script>

<style>
    .product h3 {
        font-size: 1.3em;
        font-weight: normal;
        line-height: 1.4em;
        margin: 0;
        padding: .5em 0 0;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    .product p {
        font-size: 1em;
        margin: 0;
        padding: .3em 0 0;
    }
    .pullImage {
        width: 64px;
        height: 64px;
        border-radius: 3px;
        float: left;
        margin-right: 1em;
    }   
</style>

</asp:Content>
