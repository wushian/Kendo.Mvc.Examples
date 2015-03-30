﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Kendo.Mvc.Examples.Models;

namespace Kendo.Mvc.Examples.Controllers
{
    public partial class SparklinesController : Controller
    {
        public ActionResult Remote_Data_Binding()
        {
            return View();
        }

        [HttpPost]
        public ActionResult _Weather(string station, int year, int month)
        {
            IEnumerable<Weather> result;

            using (var db = new SampleEntities())
            {
                var q = from w in db.Weathers
                        where w.Station == station && w.Date.Year == year && w.Date.Month == month
                        select w;

                result = q.ToList();
            }

            return Json(result);
        }
    }
}