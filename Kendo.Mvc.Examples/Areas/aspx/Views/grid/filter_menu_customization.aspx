<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<% Html.Kendo().Grid<Kendo.Mvc.Examples.Models.EmployeeViewModel>()
    .Name("Grid")
    .Columns(columns =>
    {
        columns.Template(e =>
        { %> @item.FirstName  @item.LastName<% })
                .ClientTemplate("#=FirstName# #=LastName#")
                .Title("Name");
        columns.Bound(e => e.City)
                .Filterable(filterable => filterable.UI("cityFilter"))
                .Width(200);
        columns.Bound(e => e.Title)
                .Filterable(filterable => filterable.UI("titleFilter"))
                .Width(350);
    })        
    .Filterable(filterable => filterable
        .Extra(false)
         .Operators(operators => operators
            .ForString(str => str.Clear()
                .StartsWith("Starts with")
                .IsEqualTo("Is equal to")
                .IsNotEqualTo("Is not equal to")
            ))
        )

    .DataSource(dataSource => dataSource
        .Ajax()
        .Read(read => read.Action("FilterMenuCustomization_Read", "Grid"))
     ).Render();
    %>

<script type="text/javascript">
    function cityFilter(element) {
        element.kendoDropDownList({
            dataSource: {
                transport: {
                    read: "<%= Url.Action("FilterMenuCustomization_Cities") %>"
                }
            },
            optionLabel: "--Select Value--"
        });
    }

    function titleFilter(element) {
        element.kendoAutoComplete({
            dataSource: {
                transport: {                    
                    read: "<%= Url.Action("FilterMenuCustomization_Titles") %>"
                }
            }
        });
    }
</script>
</asp:Content>
