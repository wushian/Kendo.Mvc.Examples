﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<%=
    Html.Kendo().Scheduler<Kendo.Mvc.Examples.Models.Scheduler.TaskViewModel>()
        .Name("scheduler")
        .Date(new DateTime(2013, 6, 13))
        .StartTime(new DateTime(2013, 6, 13, 7, 00, 00))
        .Height(400)
        .Timezone("Etc/UTC")
        .Selectable(true)
        .Events(e =>
        {
            e.DataBinding("scheduler_dataBinding");
            e.DataBound("scheduler_dataBound");
            e.Change("scheduler_change");
            e.Save("scheduler_save");
            e.Remove("scheduler_remove");
            e.Cancel("scheduler_cancel");
            e.Edit("scheduler_edit");
            e.Add("scheduler_add");
            e.MoveStart("scheduler_moveStart");
            e.Move("scheduler_move");
            e.MoveEnd("scheduler_moveEnd");
            e.ResizeStart("scheduler_resizeStart");
            e.Resize("scheduler_resize");
            e.ResizeEnd("scheduler_resizeEnd");
            e.Navigate("scheduler_navigate");
        })
        .Views(views =>
        {
            views.DayView();
            views.WeekView(weekView => weekView.Selected(true));
            views.MonthView();
            views.AgendaView();
            views.TimelineView();
        })
        .DataSource(d => d
            .Model(m => {
                m.Id(f => f.TaskID);
                m.Field(f => f.Title).DefaultValue("No title");
                m.RecurrenceId(f => f.RecurrenceID);
            })
            .Read("Read", "Scheduler")
            .Create("Create", "Scheduler")
            .Destroy("Destroy", "Scheduler")
            .Update("Update", "Scheduler")
        )
%>

<div class="demo-section">
    <h3 class="title">Console log</h3>
    <div class="console"></div>
</div>
<script>
    function scheduler_dataBinding(e) {
        kendoConsole.log("dataBinding");
    }

    function scheduler_dataBound(e) {
        kendoConsole.log("dataBound");
    }

    function scheduler_change(e) {
        var start = e.start; //selection start date
        var end = e.end; //selection end date
        var slots = e.slots; //list of selected slots
        var events = e.events; //list of selected Scheduler events

        var message = "change:: selection from {0:g} till {1:g}";

        if (events.length) {
            message += ". The selected event is '" + events[events.length - 1].title + "'";
        }

        kendoConsole.log(kendo.format(message, start, end));
    }

    function scheduler_save(e) {
        kendoConsole.log("save");
    }

    function scheduler_remove(e) {
        kendoConsole.log("remove");
    }

    function scheduler_cancel(e) {
        kendoConsole.log("cancel");
    }

    function scheduler_edit(e) {
        kendoConsole.log("edit");
    }

    function scheduler_add(e) {
        kendoConsole.log("add");
    }

    function scheduler_moveStart(e) {
        kendoConsole.log("moveStart");
    }

    function scheduler_move(e) {
        kendoConsole.log("move");
    }

    function scheduler_moveEnd(e) {
        kendoConsole.log("moveEnd");
    }

    function scheduler_resizeStart(e) {
        kendoConsole.log("resizeStart");
    }

    function scheduler_resize(e) {
        kendoConsole.log("resize");
    }

    function scheduler_resizeEnd(e) {
        kendoConsole.log("resizeEnd");
    }

    function scheduler_navigate(e) {
        kendoConsole.log(kendo.format("navigate:: action:{0}; view:{1}; date:{2:d};", e.action, e.view, e.date));
    }
</script>


</asp:Content>

