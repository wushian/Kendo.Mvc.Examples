<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section">
    <h4>Customers</h4>

    <%= Html.Kendo().DropDownList()
          .Name("customers")
          .DataTextField("ContactName")
          .DataValueField("CustomerID")
          .MinLength(3)
          .HtmlAttributes(new { style = "width:250px" })
          .OptionLabel("Select a contact name")
          .DataSource(source =>  source
              .Custom()
              .Group(g => g.Add("Country", typeof(string)))
              .Transport(transport => transport
                .Read(read =>
                {
                    read.Action("Customers_Read", "DropDownList");
                })))
     %>
</div>
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