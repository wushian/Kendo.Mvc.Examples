namespace Kendo.Mvc.Examples.Controllers
{
    using Kendo.Mvc.UI;
    using Kendo.Mvc.Extensions;
    using Kendo.Mvc.Examples.Models;

    using System.Linq;
    using System.Web.Mvc;
    using System.Collections.Generic;

    public partial class AutoCompleteController : Controller
    {
        public ActionResult Virtualization()
        {
            return View();
        }

        public ActionResult Virtualization_Read([DataSourceRequest] DataSourceRequest request)
        {
            return Json(GetOrders().ToDataSourceResult(request));
        }

        private static IEnumerable<OrderViewModel> GetOrders()
        {
            var northwind = new SampleEntities();

            return northwind.Orders.Select(order => new OrderViewModel
            {
                ContactName = order.Customer.ContactName,
                Freight = order.Freight,
                OrderDate = order.OrderDate,
                ShippedDate = order.ShippedDate,
                OrderID = order.OrderID,
                ShipAddress = order.ShipAddress,
                ShipCountry = order.ShipCountry,
                ShipName = order.ShipName,
                ShipCity = order.ShipCity,
                EmployeeID = order.EmployeeID,
                CustomerID = order.CustomerID
            });
        }
    }
}