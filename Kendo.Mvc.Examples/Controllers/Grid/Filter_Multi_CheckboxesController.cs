using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Kendo.Mvc.Examples.Models;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using System.Reflection;

namespace Kendo.Mvc.Examples.Controllers
{
    public partial class GridController : Controller
    {
        public ActionResult Filter_Multi_Checkboxes()
        {
            return View();
        }

        public ActionResult Unique(string field)
        {
            var result = GetEmployees().Distinct(new EmployeeComparer(field));

            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }

    public class EmployeeComparer : IEqualityComparer<EmployeeViewModel>
    {
        private string field;

        private PropertyInfo prop;

        public EmployeeComparer(string field)
        {
            this.field = field;
            prop = typeof(EmployeeViewModel).GetProperty(field);
        }

        public bool Equals(EmployeeViewModel x, EmployeeViewModel y)
        {
            return prop.GetValue(x, null).Equals(prop.GetValue(y, null));
        }

        public int GetHashCode(EmployeeViewModel obj)
        {
            return prop.GetValue(obj, null).GetHashCode();
        }
    }
}
