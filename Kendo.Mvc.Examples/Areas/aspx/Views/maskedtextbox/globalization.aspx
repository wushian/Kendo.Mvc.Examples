<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/cultures/kendo.culture.en-US.min.js") %>"></script>
    <script src="<%= Url.Content("~/Scripts/cultures/kendo.culture.en-GB.min.js") %>"></script>
    <script src="<%= Url.Content("~/Scripts/cultures/kendo.culture.de-DE.min.js") %>"></script>
    <script src="<%= Url.Content("~/Scripts/cultures/kendo.culture.fr-FR.min.js") %>"></script>
    <script src="<%= Url.Content("~/Scripts/cultures/kendo.culture.bg-BG.min.js") %>"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div id="product-view" class="k-header">
    <script>
        function changeCulture() {
            kendo.culture(this.value());

            $("#initial").data("kendoMaskedTextBox").setOptions(initial.options);
        }
    </script>
    <div class="right">
        <label for="culture">Choose culture:</label>
        <%= Html.Kendo().DropDownList()
              .Name("culture")
              .Items(items => {
                  items.Add().Text("en-US").Value("en-US");
                  items.Add().Text("en-GB").Value("en-GB");
                  items.Add().Text("de-DE").Value("de-DE");
                  items.Add().Text("fr-FR").Value("fr-FR");
                  items.Add().Text("bg-BG").Value("bg-BG");
              })
              .Events(events => events.Change("changeCulture"))
        %>
    </div>

    <h2>Product promotion</h2>
    <ul id="fieldlist">
        <li>
            <label for="initial">Initial price:</label>
            <%= Html.Kendo().MaskedTextBox()
                  .Name("initial")
                  .Mask("9,999.99 $")
                  .Value("1234.56")
            %>
            </li>
        </ul>
    </div>

    <style>
        #example h2 {
            padding: 5px 0;
            font-weight: normal;
            border-bottom: 1px solid #999;
        }
        #product-view {
            border-radius: 10px 10px 10px 10px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            width: 500px;
            padding: 20px 20px 0 20px;
            margin: 30px auto;
            background-position: 0 -255px;
        }

        .right
        {
            float:right;
        }

        #fieldlist
        {
            width: 100%;
            float:left;
            margin:0;
            padding: 20px 0 20px 0;
        }

        #fieldlist li
        {
            list-style:none;
            padding:5px 0;
        }
        #fieldlist label {
            display: inline-block;
            text-align: right;
            margin-right: 5px;
        }

</style>
</asp:Content>