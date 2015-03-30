<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src=" <%= Url.Content("~/Content/web/integration/jquery.signalr-1.1.3.min.js")%>"></script>
<script>
    var hub,
        hubStart;

    $(function () {
        var hubUrl = "http://demos.telerik.com/kendo-ui/service/signalr/hubs";
        var connection = $.hubConnection(hubUrl, { useDefaultPath: false });
        hub = connection.createHubProxy("productHub");
        hubStart = connection.start({ jsonp: true });
    });

    function onPush(e) {
        var notification = $("#notification").data("kendoNotification");
        notification.success(e.type);
    }
</script>

<%= Html.Kendo().Notification()
    .Name("notification")
    .Width("100%")
    .Position(position => position
        .Top(0)
        .Left(0))
%>

<%= Html.Kendo().Grid<Kendo.Mvc.Examples.Models.ProductViewModel>()
    .Name("Grid")
    .Columns(columns =>
    {
        columns.Bound(p => p.ProductName);
        columns.Bound(p => p.UnitPrice).Width(140);
        columns.Bound(p => p.UnitsInStock).Width(140);
        columns.Bound(p => p.Discontinued).Width(100);
        columns.Command(command =>
        {
            command.Destroy();
        }).Width(110);
    })
    .ToolBar(toolbar =>
    {
        toolbar.Create();
        toolbar.Save();
    })
    .Editable(editable => editable.Mode(GridEditMode.InCell))
    .Pageable()
    .Navigatable()
    .Sortable()
    .Scrollable()
    .DataSource(dataSource => dataSource
        .SignalR()
        .AutoSync(true)
        .Events(events => events.Push("onPush"))
        .Sort(s => s.Add("CreatedAt").Descending())
        .Transport(tr => tr
            .Promise("hubStart")
            .Hub("hub")
            .Client(c => c
                .Read("read")
                .Create("create")
                .Update("update")
                .Destroy("destroy"))
            .Server(s => s
                .Read("read")
                .Create("create")
                .Update("update")
                .Destroy("destroy")))
        .Schema(schema => schema
            .Model(model =>
            {
                model.Id("ID");
                model.Field("ID", typeof(string)).Editable(false);
                model.Field("CreatedAt", typeof(DateTime));
                model.Field("UnitPrice", typeof(int));
            }
            )
        )
    )
%>
<br />
<div class="configuration-horizontal">
    <span class="configHead">Information</span>
    <p>
    This demo demonstrates real-time push-notifications from <a href="http://signalr.net/">SignalR</a>.
    </p>
    <p>
        To see the real-time updates:
    </p>
    <ol>
        <li>Open this page in another browser window by clicking <a href="./signalr" target="_new">here</a></li>
        <li>Create, update or destroy Grid items.</li>
    </ol>
</div>
</asp:Content>
