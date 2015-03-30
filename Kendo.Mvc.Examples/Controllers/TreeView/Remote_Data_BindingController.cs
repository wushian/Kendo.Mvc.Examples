﻿using System.Web.Mvc;
using System.Linq;
using Kendo.Mvc.Examples.Models;

namespace Kendo.Mvc.Examples.Controllers
{
    public partial class TreeViewController : Controller
    {
        public ActionResult Remote_Data_Binding()
        {
            return View();
        }

        public JsonResult Employees(int? id)
        {
            var dataContext = new SampleEntities();

            var employees = from e in dataContext.Employees
                            where (id.HasValue ? e.ReportsTo == id : e.ReportsTo == null)
                            select new {
                                id = e.EmployeeID,
                                Name = e.FirstName + " " + e.LastName,
                                hasChildren = e.Employees1.Any()
                            };

            return Json(employees, JsonRequestBehavior.AllowGet);
        }
    }
}