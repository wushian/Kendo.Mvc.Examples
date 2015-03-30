<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section">
    <h4>Customers</h4>

    <%= Html.Kendo().ComboBox()
          .Name("customers")
          .DataTextField("ContactName")
          .DataValueField("CustomerID")
          .MinLength(3)
          .HtmlAttributes(new { style = "width:250px" })
          .Placeholder("Type a customer name")
          .DataSource(source =>  source
              .Custom()
              .Group(g => g.Add("Country", typeof(string)))
              .Transport(transport => transport
                .Read(read =>
                {
                    read.Action("Customers_Read", "ComboBox")
                        .Data("onAdditionalData");
                }))
              .ServerFiltering(true))
     %>
</div>
<script>
    function onAdditionalData() {
        return {
            text: $("#customers").val()
        };
    }
</script>
<style>
    .demo-section {
        width: 250px;
        margin: 35px auto 50px;
        padding: 30px;
    }
    .demo-section h2 {
        text-transform: uppercase;
        font-size: 1.2em;
        margin-bottom: 10px;
    }
</style>
</asp:Content>