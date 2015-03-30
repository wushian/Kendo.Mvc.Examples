namespace Kendo.Mvc.Examples.Controllers
{
    using Kendo.Mvc.UI;
    using Kendo.Mvc.Extensions;
    using Kendo.Mvc.Examples.Models;

    using System.Linq;
    using System.Web.Mvc;
    using System.Collections.Generic;

    public partial class MultiSelectController : Controller
    {
        public ActionResult Grouping()
        {
            return View();
        }

        public ActionResult Customers_Read(string text)
        {
            var result = GetCustomers().Where(c => c.ContactName.Contains(text)).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        private static IEnumerable<CustomerViewModel> GetCustomers()
        {
            var northwind = new SampleEntities();
            return northwind.Customers.Select(customer => new CustomerViewModel
            {
                CustomerID = customer.CustomerID,
                CompanyName = customer.CompanyName,
                ContactName = customer.ContactName,
                ContactTitle = customer.ContactTitle,
                Address = customer.Address,
                City = customer.City,
                Region = customer.Region,
                PostalCode = customer.PostalCode,
                Country = customer.Country,
                Phone = customer.Phone,
                Fax = customer.Fax,
                Bool = customer.Bool
            });
        }
    }
}