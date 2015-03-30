<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="configuration" style="width: 220px">
    <span class="configHead">API Functions</span>
    <ul class="options">
        <li>
            <button id="get" class="k-button">Get value</button>
        </li>
        <li>
            <button id="set" class="k-button">Set value</button>
            <input class="k-textbox" id="value" value="555 123 4567" style="float:none" />
        </li>
        <li>
            <button id="enable" class="k-button">Enable</button> or <button id="disable" class="k-button">Disable</button> or <button id="readonly" class="k-button">Readonly</button>
        </li>
    </ul>
</div>           
<div class="demo-section">
     <%= Html.Kendo().MaskedTextBox()
          .Name("maskedtextbox")
          .Mask("(999) 000-0000")
     %>
</div>

<script>
    $(document).ready(function () {
        var maskedtextbox = $("#maskedtextbox").data("kendoMaskedTextBox");

        var setValue = function () {
            maskedtextbox.value($("#value").val());
        };

        $("#enable").click(function () {
            maskedtextbox.enable();
        });

        $("#disable").click(function () {
            maskedtextbox.enable(false);
        });

        $("#readonly").click(function () {
            maskedtextbox.readonly();
        });

        $("#set").click(setValue);

        $("#get").click(function () {
            alert(maskedtextbox.value());
        });
    });
</script>           
<style>
    .demo-section{
        width:150px;
        margin-right: 400px;
    }

    #value {
        width: 135px;
        margin-left: 3px;
    }
</style>
</asp:Content>