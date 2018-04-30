using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CrowdDJ_Server.Controllers
{
    public class AdministratorController : Controller
    {
        // GET: Administrator
        public ActionResult Login()
        {
            return View();
        }
    }
}