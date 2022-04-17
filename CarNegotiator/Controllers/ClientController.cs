using CarNegotiator.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CarNegotiator.Controllers
{
    public class ClientController : Controller
    {
        private AutoNegotiatorDBEntities db = new AutoNegotiatorDBEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session["UserID"] = null;
            Session["UserName"] = null;
            Session["UserType"] = null;
            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Client objUser)
        {

            Client obj = db.Clients.Where(a => a.emailAddress.Equals(objUser.emailAddress) && a.password.Equals(objUser.password)).FirstOrDefault();
            if (obj != null)
            {
                Session["UserID"] = obj.id.ToString();
                Session["UserName"] = obj.firstName.ToString();
                Session["UserType"] = "5"; //Client
                return RedirectToAction("Apply", "Car", new { area = "" });
            }
            else
            {
                ViewBag.Error = "User Name or Password Incorrect";
                return RedirectToAction("Login");
            }
        }





        public ActionResult Terms()
        {
            return View();
        }

        public ActionResult faq()
        {

            return View((db.Faqs.
                            Where(s => s.faqtypeId ==
                                        db.Faq_Types.
                                        Where(p => p.id == 1).
                                        Select(p => p.id).
                                        FirstOrDefault())).
                            ToList());
        }


        public ActionResult Contact()
        {
            return View();
        }




        // GET: Clients/Create
        public ActionResult Register()
        {
            ViewBag.bestTimeToContactId = new SelectList(db.BestTimeToContacts, "id", "Value");
            ViewBag.provinceId = new SelectList(db.Provinces, "id", "name");
            ViewBag.townId = new SelectList(db.Towns.Take(1), "id", "name");
            ViewBag.titleId = new SelectList(db.Titles, "id", "Value");
            return View();
        }

        // POST: Clients/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(Client client)
        {

            client.createdDate = DateTime.Now;
            db.Clients.Add(client);
            await db.SaveChangesAsync();
            int id = client.id;
            Session["UserID"] = client.id.ToString();
            Session["UserName"] = client.firstName.ToString();
            Session["UserType"] = "5"; //Client
            return View("Registered", client);
        }

        // GET: Clients/Details/5
        public ActionResult Registered(Client client)
        {
            return View(client);
        }

        [HttpGet]
        public ActionResult GetTowns(int id)
        {
            IEnumerable<SelectListItem> towns = new SelectList(db.Towns.Where(s => s.provinceId == id), "id", "name");
            return Json(towns, JsonRequestBehavior.AllowGet);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
