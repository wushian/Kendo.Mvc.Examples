﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="MainContent" runat="server">
<%=Html.Kendo().Scheduler<Kendo.Mvc.Examples.Models.Scheduler.MeetingViewModel>()
    .Name("scheduler")
    .Date(new DateTime(2013,6 ,13))
    .StartTime(new DateTime(2013, 6, 13, 7, 00, 00))
    .MajorTick(60)
    .Views(views =>
    {
        views.TimelineView(timeline => timeline.EventHeight(50));
        views.TimelineWeekView(timeline => timeline.EventHeight(50));
        views.TimelineWorkWeekView(timeline => timeline.EventHeight(50));
        views.TimelineMonthView(timeline => {
            timeline.StartTime(new DateTime(2013, 6, 13, 00, 00, 00));
            timeline.EndTime(new DateTime(2013, 6, 13, 00, 00, 00));
            timeline.MajorTick(1440);
            timeline.EventHeight(50);
        });
    })
    .Timezone("Etc/UTC")
    .Group(group => group.Resources("Rooms", "Attendees").Orientation(SchedulerGroupOrientation.Vertical))
    .Resources(resource =>
         {
            resource.Add(m => m.RoomID)
                .Title("Room")
                .Name("Rooms")
                .DataTextField("Text")
                .DataValueField("Value")
                .DataColorField("Color")
                .BindTo(new[] { 
                    new { Text = "Meeting Room 101", Value = 1, Color = "#6eb3fa" },
                    new { Text = "Meeting Room 201", Value = 2, Color = "#f58a8a" } 
                });
            resource.Add(m => m.Attendees)
                .Title("Attendees")
                .Name("Attendees")
                .Multiple(true)
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
                m.Id(f => f.MeetingID);     
                m.Field(f => f.Title).DefaultValue("No title");
                m.RecurrenceId(f => f.RecurrenceID);                                                  
            })
            .Read("Grouping_Vertical_Read", "Scheduler")
                .Create(create => create.Action("Grouping_Vertical_Create", "Scheduler").Data("serialize"))
                .Destroy("Grouping_Vertical_Destroy", "Scheduler")
                .Update(update => update.Action("Grouping_Vertical_Update", "Scheduler").Data("serialize"))
    )
%>

<script type="text/javascript">
    function serialize(data) {
        for (var property in data) {
            if ($.isArray(data[property])) {
                serializeArray(property, data[property], data);
            }
        }
    }

    function serializeArray(prefix, array, result) {
        for (var i = 0; i < array.length; i++) {
            if ($.isPlainObject(array[i])) {
                for (var property in array[i]) {
                    result[prefix + "[" + i + "]." + property] = array[i][property];
                }
            }
            else {
                result[prefix + "[" + i + "]"] = array[i];
            }
        }
    }
</script>

</asp:Content>
