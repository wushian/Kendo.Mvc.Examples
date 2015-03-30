﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="box">
    <h4>Info</h4>
    <p>Resize the window and watch how ToolBar's items show or hide according to the available space.</p>
    <p>More information regarding the resizable functionality can be found in the <a href="#">Getting Started topic</a>.</p>
    <span id="undo" style="display:none" class="k-button">Click here to open the window.</span>
</div>
<div id="window">
    <%= Html.Kendo().ToolBar()
        .Name("ToolBar")
        .Items(items => 
        {
            items.Add().Template("<img src='" + Url.Content("~/Content/web/toolbar/user.png") + "' class='user-image' />").Overflow(ShowInOverflowPopup.Never);
            items.Add().Type(CommandType.Button).Text("Send").Primary(true).Overflow(ShowInOverflowPopup.Never);
            items.Add().Type(CommandType.Button).Text("Discard").Overflow(ShowInOverflowPopup.Never);
            items.Add().Type(CommandType.Separator);
            items.Add().Type(CommandType.SplitButton).Text("Save").ImageUrl(Url.Content("~/Content/web/toolbar/save.png")).MenuButtons(menuButtons =>
            {
                menuButtons.Add().Text("Save as").ImageUrl(Url.Content("~/Content/web/toolbar/save.png"));
                menuButtons.Add().Text("Upload to drive").ImageUrl(Url.Content("~/Content/web/toolbar/upload.png"));
            });
            items.Add().Type(CommandType.SplitButton).Text("Reply").ImageUrl(Url.Content("~/Content/web/toolbar/reply.png")).MenuButtons(menuButtons =>
            {
                menuButtons.Add().Text("Reply all").ImageUrl(Url.Content("~/Content/web/toolbar/save.png"));
                menuButtons.Add().Text("Forward").ImageUrl(Url.Content("~/Content/web/toolbar/forward.png"));
                menuButtons.Add().Text("Reply & Delete").ImageUrl(Url.Content("~/Content/web/toolbar/reply.png"));
            });
            items.Add().Type(CommandType.Separator);
            items.Add().Template("<span><label>Contacts:</label><input id='contacts' style='width: 150px;' /></span>").Overflow(ShowInOverflowPopup.Never);
            items.Add().Template("<div><label>Labels:</label><input id='labels' style='width: 150px;' /></div>").OverflowTemplate("<span></span>");
            items.Add().Type(CommandType.Separator);
            items.Add().Type(CommandType.ButtonGroup).Buttons(buttons =>
            {
                buttons.Add().Text("Done").Togglable(true).ImageUrl(Url.Content("~/Content/web/toolbar/done.png")).Group("category");
                buttons.Add().Text("To Do").Togglable(true).ImageUrl(Url.Content("~/Content/web/toolbar/todo.png")).Group("category");
                buttons.Add().Text("Important").Togglable(true).ImageUrl(Url.Content("~/Content/web/toolbar/important.png")).Group("category");
            });
        })
    %>
    <div id="content">
        <div class="demo-section k-header">
            <ul>
                <li><label>To:</label> <input type="text" class="k-textbox" id="to"/></li>
                <li><label>Title:</label> <input type="text" class="k-textbox" id="title"/></li>
            </ul>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {

        $("#window").kendoWindow({
            resizable: true,
            width: 820,
            height: 250,
            minWidth: 410,
            maxWidth: 1200,
            title: "Message",
            close: function () {
                $("#undo").show();
            }
        });

        $("#undo").bind("click", function () {
            $("#window").data("kendoWindow").open();
            $("#undo").hide();
        });

        $("#contacts").kendoDropDownList({
            optionLabel: "Ann Devon",
            dataTextField: "text",
            dataValueField: "value",
            dataSource: [
                { text: "Ana Trujillo", value: 1 },
                { text: "Antonio Moreno", value: 2 },
                { text: "Christina Berglund", value: 3 },
                { text: "Felipe Izquierdo", value: 4 }
            ]
        });

        $("#labels").kendoDropDownList({
            optionLabel: "Forums",
            dataTextField: "text",
            dataValueField: "value",
            dataSource: [
                { text: "Follow up", value: 1 },
                { text: "Misc", value: 2 },
                { text: "Priority", value: 3 },
                { text: "Deleted Messages", value: 4 }
            ]
        });

        $("#masked").kendoNumericTextBox();

        $("#ToolBar").data("kendoToolBar").resize();

    });
</script>

<style>
    div.k-window-content {
        padding: 0;
    }

    #toolbar {
        border-width: 0 0 1px;
    }
    .user-image {
        margin: 0 .5em;
    }
    #example {
        height: 500px;
    }
    #example .box p {
        padding-bottom: 5px;
    }
    #content .demo-section {
        margin: 0;
        padding: 10px;
        border-width: 0 0 1px 0;
    }
    #content .demo-section label {
        display: inline-block;
        width: 40px;
        text-align: right;
        line-height: 2.5em;
        vertical-align: middle;
    }
    #content .demo-section input {
        width: 80%;
    }
</style>

</asp:Content>