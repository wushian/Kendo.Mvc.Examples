﻿using System.Collections.Generic;
using System.Web.Mvc;
using Kendo.Mvc.Examples.Models;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using System.Linq;
using System;

namespace Kendo.Mvc.Examples.Controllers
{
    public partial class PivotGridController : Controller
    {
        public ActionResult Excel_Export()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Excel_Export_Save(string contentType, string base64, string fileName)
        {
            var fileContents = Convert.FromBase64String(base64);

            return File(fileContents, contentType, fileName);
        }
    }
}
