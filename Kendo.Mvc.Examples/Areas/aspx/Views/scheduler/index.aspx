﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div id="team-schedule">
    <div id="people">
        <input checked type="checkbox" id="alex" value="1">
        <input checked type="checkbox" id="bob" value="2">
        <input type="checkbox" id="charlie" value="3">
    </div>
</div>
<%=Html.Kendo().Scheduler<Kendo.Mvc.Examples.Models.Scheduler.TaskViewModel>()
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
    .Resources(resource =>
    {
        resource.Add(m => m.OwnerID)
            .Title("Owner")
            .DataTextField("Text")
            .DataValueField("Value")
            .DataColorField("Color")
            .BindTo(new[] { 
                new { Text = "Alex", Value = 1, Color = "#f8a398" } ,
                new { Text = "Bob", Value = 2, Color = "#51a0ed" } ,
                new { Text = "Charlie", Value = 3, Color = "#56ca85" } 
            });
    })
    .DataSource(d => d
        .Model(m => {
            m.Id(f => f.TaskID);
            m.Field(f => f.Title).DefaultValue("No title");
            m.Field(f => f.OwnerID).DefaultValue(1);
            m.RecurrenceId(f => f.RecurrenceID);
        })
        .Read("Read", "Scheduler")
        .Create("Create", "Scheduler")
        .Destroy("Destroy", "Scheduler")
        .Update("Update", "Scheduler")
        .Filter(filters =>
        {
            filters.Add(model => model.OwnerID).IsEqualTo(1).Or().IsEqualTo(2);
        })
    )
%>

<script type="text/javascript">
    $(function () {
        $("#people :checkbox").change(function (e) {
            var checked = $.map($("#people :checked"), function (checkbox) {
                return parseInt($(checkbox).val());
            });

            var filter = {
                logic: "or",
                filters: $.map(checked, function (value) {
                    return {
                        operator: "eq",
                        field: "OwnerID",
                        value: value
                    };
                })
            };

            var scheduler = $("#scheduler").data("kendoScheduler");

            scheduler.dataSource.filter(filter);
        });
    })
</script>

<style>
    #scheduler {
        font-size: 14px;    
    }
    #team-schedule {
        background: url('<%=Url.Content("~/Content/web/scheduler/")%>team-schedule.png') transparent no-repeat;
        height: 115px;
        position: relative;
    }

    #people {
        background: url('<%=Url.Content("~/Content/web/scheduler/")%>scheduler-people.png') no-repeat;
        width: 345px;
        height: 115px;
        position: absolute;
        right: 0;
    }
    #alex {
        position: absolute;
        left: 4px;
        top: 81px;
    }
    #bob {
        position: absolute;
        left: 119px;
        top: 81px;
    }
    #charlie {
        position: absolute;
        left: 234px;
        top: 81px;
    }
</style>

</asp:Content>

