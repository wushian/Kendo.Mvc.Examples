﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.Examples.Models;

namespace Kendo.Mvc.Examples.Controllers
{
    public partial class SplitViewController : Controller
    {
        private ProductService productService;

        public SplitViewController()
        {
            productService = new ProductService(new SampleEntities());
        }

        protected override void Dispose(bool disposing)
        {
            productService.Dispose();

            base.Dispose(disposing);
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Categories([DataSourceRequest] DataSourceRequest request)
        {
            var dataContext = new SampleEntities();
            var categories = dataContext.Categories
                        .Select(c => new CategoryViewModel
                        {
                            CategoryID = c.CategoryID,
                            CategoryName = c.CategoryName
                        })
                        .OrderBy(e => e.CategoryName);

            return Json(categories.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Products([DataSourceRequest] DataSourceRequest request)
        {
            var products = productService.Read()
                        .OrderBy(p => p.ProductName);

            return Json(products.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Order_Details([DataSourceRequest] DataSourceRequest request)
        {
            var dataContext = new SampleEntities();
            var details = dataContext.Order_Details
                .Select(d => new 
                        {
                            Discount = d.Discount,
                            Quantity = d.Quantity,
                            UnitPrice = d.UnitPrice,
                            ProductID = d.ProductID
                        });

            return Json(details.ToDataSourceResult(request));
        }
    }
}
