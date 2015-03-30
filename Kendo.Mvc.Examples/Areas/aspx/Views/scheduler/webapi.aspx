﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<%: Html.Kendo().Scheduler<Kendo.Mvc.Examples.Models.Scheduler.TaskViewModel>()
    .Name("scheduler")
    .Date(new DateTime(2013, 6, 13))
    .StartTime(new DateTime(2013, 6, 13, 7, 00, 00))
    .Height(600)
    .Views(views =>
    {
        views.DayView();
        views.WeekView(weekView => weekView.Selected(true));
        views.MonthView();
        views.AgendaView();
        views.TimelineView();
    })
    .Timezone("Etc/UTC")
    .DataSource(d => d
        .Model(m => { 
               m.Id(f => f.TaskID);  
               m.Field(f => f.Title).DefaultValue("No title");
               m.RecurrenceId(f => f.RecurrenceID);                                                     
        })
        .Events(events => events.Error("error_handler"))
        .Read(read => read.Url(Url.Content("~/api/task")).Type(HttpVerbs.Get))
        .Create(create => create.Url(Url.Content("~/api/task")).Type(HttpVerbs.Post))
        .Update(update => update.Url(Url.Content("~/api/task")).Type(HttpVerbs.Put))
        .Destroy(destroy => destroy.Url(Url.Content("~/api/task")).Type(HttpVerbs.Delete))
    )
%>
<script>
    function error_handler(e) {
        var errors = $.parseJSON(e.xhr.responseText);

        if (errors) {
            alert("Errors:\n" + errors.join("\n"));
        }
    }

    $(function() {
        var scheduler = $("#scheduler").data("kendoScheduler");

        // Web API needs the ID of the entity to be part of the URL e.g. PUT /api/Product/80
        scheduler.dataSource.transport.options.update.url = function(data) {
            return "<%= Url.Content("~/api/task/") %>" + data.TaskID;
        }

        // Web API needs the ID of the entity to be part of the URL e.g. DELETE /api/Product/80
        scheduler.dataSource.transport.options.destroy.url = function(data) {
            return "<%= Url.Content("~/api/task/") %>" + data.TaskID;
        }
    });
</script>
</asp:Content>