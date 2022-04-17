using CarNegotiator.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CarNegotiator.Controllers
{
    public class AdminController : Controller
    {
        private AutoNegotiatorDBEntities db = new AutoNegotiatorDBEntities();

        public ActionResult login()
        {
            ViewBag.Message = "Login";
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(User objUser)
        {

            User obj = db.Users.Where(a => a.emailAddress.Equals(objUser.emailAddress) && a.password.Equals(objUser.password)).FirstOrDefault();
            if (obj != null)
            {
                Session["UserID"] = obj.id.ToString();
                Session["UserName"] = obj.firstName.ToString();
                Session["UserType"] = "1"; //Admin
                return RedirectToAction("ManageRequests");
            }
            else
            {
                ViewBag.Error = "User Name or Password Incorrect";
                return RedirectToAction("Login");
            }
        }

        public ActionResult Logout()
        {
            Session["UserID"] = null;
            Session["UserName"] = null;
            Session["UserType"] = null;
            return RedirectToAction("login");
        }

        [HttpGet]
        public ActionResult GetTowns(int id)
        {
            IEnumerable<SelectListItem> towns = new SelectList(db.Towns.Where(s => s.provinceId == id), "id", "name");
            return Json(towns, JsonRequestBehavior.AllowGet);
        }




        // GET: Users/Create
        public ActionResult Register()
        {
            ViewBag.provinceId = new SelectList(db.Provinces, "id", "name");
            ViewBag.townId = new SelectList(db.Towns, "id", "name");
            ViewBag.userTypeId = new SelectList(db.UserTypes, "id", "Value");
            ViewBag.titleId = new SelectList(db.Titles, "id", "Value");

            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(User user)
        {
            user.createdDate = DateTime.Now;
            user.modifiedDate = DateTime.Now;
            user.userTypeId = 1;//Admin
            db.Users.Add(user);
            await db.SaveChangesAsync();

            Session["UserID"] = user.id.ToString();
            Session["UserName"] = user.firstName.ToString();
            Session["UserType"] = "1"; //Admin

            return View("Registered", user);
        }

        public ActionResult Contact()
        {
            return View();
        }

        public async Task<ActionResult> Bids(int id)
        {
            if (Session["UserID"] == null)
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }
            if (Convert.ToString(Session["UserType"]) != "1")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }



            IQueryable<BidVM> bidsQuery = (from a in db.CarRequests
                                                       join b in db.Bids on a.id equals b.requestId
                                                       join c in db.Dealers on b.dealerId equals c.id
                                                       join d in db.Provinces on c.provinceId equals d.id
                                                       join e in db.Towns on c.townId equals e.id
                                                       where b.requestId==id && b.isDealerInterested == true
                                                       orderby b.bidAmount ascending
                                                       select new BidVM
                                                       {
                                                           id = b.id,
                                                           DealerName = c.firstName,
                                                           MobileNumber = c.MobileNumber,
                                                           TelephoneNumber = c.TelephoneNumber,
                                                           emailAddress = c.emailAddress,
                                                           businessName = c.businessName,
                                                           Province = d.name,
                                                           Town = e.name,
                                                           bidAmount=b.bidAmount,
                                                           dealerComments=b.dealerComments,
                                                           bidUpdatedDate=b.bidUpdatedDate,
                                                           winningBid=b.isWinningBid
                                                       });
            return View(await bidsQuery.ToListAsync());
        }

        public async Task<ActionResult> Publish(int id)
        {
            if (Session["UserID"] == null)
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }
            if (Convert.ToString(Session["UserType"]) != "1")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }

            CarRequest cr = await db.CarRequests.FindAsync(id);
            cr.isRequestActive = true;
            await db.SaveChangesAsync();
            return RedirectToAction("ManageRequests");
        }

        public async Task<ActionResult> AcceptBid(int id)
        {
            if (Session["UserID"] == null)
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }
            if (Convert.ToString(Session["UserType"]) != "1")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }

            Bid bid = await db.Bids.FindAsync(id);
            bid.isWinningBid = true;
            await db.SaveChangesAsync();
            return RedirectToAction("ManageRequests");
        }

        public ActionResult Close(int id)
        {
            if (Session["UserID"] == null)
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }
            if (Convert.ToString(Session["UserType"]) != "1")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }
            CarRequest cr =  db.CarRequests.Find(id);
            cr.isRequestClosed = true;
             db.SaveChanges();
            return RedirectToAction("ManageRequests");
        }

        public async Task<ActionResult> ManageRequests()
        {
            if (Session["UserID"] == null)
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }
            if (Convert.ToString(Session["UserType"]) != "1")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }

            IQueryable<CarRequestVM> carRequestList = (from a in db.CarRequests
                             join b in db.CarVariants on a.carVariantId equals b.id
                             join c in db.CarModels on b.carModelId equals c.id
                             join d in db.CarMakes on c.carMakeId equals d.id
                             join e in db.Clients on a.clientId equals e.id
                             where a.isRequestClosed == false 
                             orderby a.id 
                             select new CarRequestVM
                             {
                                 id = a.id,
                                 carVariantId=a.carVariantId,
                                 ClientName = e.firstName,
                                 car = d.makeName + " " + b.carVariantName,
                                 requestedDate = a.requestedDate,
                                 deliveryRequestDate = a.deliveryRequestDate,
                                 clientComments = a.clientComments,
                                 AdminComments = a.AdminComments,
                                 isRequestActive=a.isRequestActive
                             });

            return View(await carRequestList.ToListAsync());
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
