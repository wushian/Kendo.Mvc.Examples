<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" 
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.TreeList.EmployeeDirectoryModel>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section k-header">
    <%:Html.Kendo().TreeList<Kendo.Mvc.Examples.Models.TreeList.EmployeeDirectoryModel>()
        .Name("treelist")
        .Columns(columns =>
        {
            columns.Add().Field(f => f.FirstName).Width(250).Lockable(false).Locked(true);
            columns.Add().Field(e => e.LastName).Locked(true).Width(200);
            columns.Add().Field(e => e.Position).Width(400);
            columns.Add().Field(e => e.Extension).Title("Ext").Format("{0:#}").Width(150).Lockable(false);
        })        
        .Reorderable(true)
        .Resizable(true)
        .Sortable()
        .Filterable()
        .ColumnMenu()
        .DataSource(dataSource => dataSource
            .Read(read => read.Action("Index", "EmployeeDirectory"))
            .Model(m => {
                m.Id(f => f.EmployeeId);
                m.ParentId(f => f.ReportsTo);
                m.Field(f => f.FirstName);
                m.Field(f => f.LastName);
                m.Field(f => f.ReportsTo);
            })
        )
    %>
</div>
</asp:Content>
