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
    public class DealerController : Controller
    {
        private AutoNegotiatorDBEntities db = new AutoNegotiatorDBEntities();

        public ActionResult login()
        {
            return View();
        }

      
            public ActionResult Logout()
            {
                Session["UserID"] = null;
                Session["UserName"] = null;
                Session["UserType"] = null;
                return RedirectToAction("login");
            }
     

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Dealer objDealer)
        {
            Dealer obj = db.Dealers.Where(a => a.emailAddress.Equals(objDealer.emailAddress) && a.password.Equals(objDealer.password)).FirstOrDefault();
            if (obj != null)
            {
                Session["UserID"] = obj.id.ToString();
                Session["UserName"] = obj.firstName.ToString();
                Session["UserType"] = "4"; //Dealer
                return RedirectToAction("ManageRequests");
            }

            else
            {
                ViewBag.Error = "User Name or Password Incorrect";
                return RedirectToAction("Login");
            }
        }


        [HttpPost]
        public async Task<ActionResult> ProcessBids(RequestsBidsVM requestsBidsVM)
        {
            if(Session["UserID"]==null)
            {
                ViewBag.Error = "User Name or Password Incorrect";
                return RedirectToAction("Login");
            }
            if (Convert.ToString(Session["UserType"]) != "4")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }

            int dealerId = Convert.ToInt32(Session["UserID"]);

            Bid bid = db.Bids.Where(x => x.requestId == requestsBidsVM.requestId && x.dealerId == dealerId).FirstOrDefault();

            if (Request.Form["Bid"] != null)
            {
                if (bid == null)
                {
                    db.Bids.Add(new Bid { dealerId = requestsBidsVM.dealerId, requestId = requestsBidsVM.requestId, bidAmount = requestsBidsVM.YourBid, bidCreatedDate = DateTime.Now, isDealerInterested = true });
                }
                else
                {
                    bid.bidAmount = requestsBidsVM.YourBid;
                    bid.isDealerInterested = true;
                    bid.bidUpdatedDate = DateTime.Now;
                }
            }

            if (Request.Form["Reject"] != null)
            {
                if (bid == null)
                {
                    db.Bids.Add(new Bid { dealerId = requestsBidsVM.dealerId, requestId = requestsBidsVM.requestId, bidAmount = null, bidCreatedDate = DateTime.Now, isDealerInterested = false });
                }
                else
                {
                    bid.isDealerInterested = false;
                    bid.bidUpdatedDate = DateTime.Now;
                }
            }


            await db.SaveChangesAsync();
            return RedirectToAction("ManageRequests");
        }


        // GET: Dealers/Create
        public ActionResult Register()
        {
            ViewBag.townId = new SelectList(db.Towns, "id", "name");
            ViewBag.provinceId = new SelectList(db.Provinces, "id", "name");
            ViewBag.titleId = new SelectList(db.Titles, "id", "Value");
            ViewBag.paymentGatewayId = new SelectList(db.PaymentGateways, "id", "Value");

            Dealer model = new Dealer();

            DbSet<Province> provinces = db.Provinces;
            DbSet<CarMake> makes = db.CarMakes;

            List<CheckBoxListItem> checkBoxListItems = new List<CheckBoxListItem>();
            foreach (Province province in provinces)
            {
                checkBoxListItems.Add(new CheckBoxListItem()
                {
                    ID = province.id,
                    Display = province.name,
                    IsChecked = false
                });
            }
            model.ProvicesToSelect = checkBoxListItems;

            checkBoxListItems = new List<CheckBoxListItem>();

            foreach (CarMake make in makes)
            {
                checkBoxListItems.Add(new CheckBoxListItem()
                {
                    ID = make.id,
                    Display = make.makeName,
                    IsChecked = false
                });
            }

            model.MakesToSelect = checkBoxListItems;
            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(Dealer dealer)
        {
            dealer.createdDate = DateTime.Now;
            dealer.modifiedDate = DateTime.Now;
            db.Dealers.Add(dealer);
            await db.SaveChangesAsync();

            foreach (CheckBoxListItem cbli in dealer.ProvicesToSelect)
            {
                if (cbli.IsChecked)
                {
                    dealer.DealerProvinces.Add(new DealerProvince { dealerId = dealer.id, provinceId = cbli.ID, isActive = true });
                }
            }

            foreach (CheckBoxListItem cbli in dealer.MakesToSelect)
            {
                if (cbli.IsChecked)
                {
                    dealer.DealerMakes.Add(new DealerMake { dealerId = dealer.id, carMakeId = cbli.ID, isActive = true });
                }
            }
            await db.SaveChangesAsync();

            Session["UserID"] = dealer.id.ToString();
            Session["UserName"] = dealer.firstName.ToString();
            Session["UserType"] = "4"; //Dealer

            return RedirectToAction("ManageRequests");
        }



        public ActionResult ManageRequests()
        {
            if (Session["UserID"] == null)
            {
                ViewBag.Error = "User Name or Password Incorrect";
                return RedirectToAction("Login");
            }
            if (Convert.ToString(Session["UserType"]) != "4")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }

            int dealerId = Convert.ToInt32(Session["UserID"]);

            List<RequestsBidsVM> requestsBidsFinal = new List<RequestsBidsVM>();
            List<RequestsBidsVM> requestsBidsX = (from a in db.CarRequests
                                                  join b in db.CarVariants on a.carVariantId equals b.id
                                                  join c in db.CarModels on b.carModelId equals c.id
                                                  join d in db.CarMakes on c.carMakeId equals d.id
                                                  join e in db.Clients on a.clientId equals e.id
                                                  where
                                                  a.isRequestClosed == false &&
                                                  a.isRequestActive == true
                                                  orderby a.id
                                                  select new RequestsBidsVM
                                                  {
                                                      requestId = a.id,
                                                      carVariantId=a.carVariantId,
                                                      dealerId = dealerId,
                                                      car = d.makeName + " " + a.CarVariant1.carVariantName,
                                                      carMakeId = d.id,
                                                      Colors = a.Color.Value + "," + a.Color1.Value + " , " + a.Color2.Value,
                                                      isFinanceApproved = a.financeApproved,
                                                      Province = e.Province.name,
                                                      provinceId = e.provinceId,
                                                      Town = e.Town.name,
                                                      requestedDate = a.requestedDate,
                                                      BidClosingDate = a.deliveryRequestDate,
                                                  }).ToList();

            foreach (RequestsBidsVM rvm in requestsBidsX)
            {
                rvm.WinningBid = db.Bids.Where(x => x.requestId == rvm.requestId).Min(x => x.bidAmount);
                Bid bid = db.Bids.Where(x => x.requestId == rvm.requestId && x.dealerId == dealerId).FirstOrDefault();
                if (bid != null)
                {
                    rvm.YourBid = bid.bidAmount;
                    rvm.isDealerInterested = bid.isDealerInterested;
                }
            }

            int[] dealerMakes = db.DealerMakes.Where(x => x.dealerId == dealerId).Select(x => x.carMakeId).ToArray();
            int[] dealerProvinces = db.DealerProvinces.Where(x => x.dealerId == dealerId).Select(x => x.provinceId).ToArray();

            foreach (RequestsBidsVM rb in requestsBidsX)
            {
                bool ignore = false;

                if (!dealerProvinces.Contains(rb.provinceId))
                {
                    ignore = true;
                }
                if (!dealerMakes.Contains(rb.carMakeId))
                {
                    ignore = true;
                }
                if (rb.isDealerInterested == false)
                {
                    ignore = true;
                }

                if (!ignore)
                {
                    requestsBidsFinal.Add(rb);
                }
            }
            return View(requestsBidsFinal);
        }


        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult faq()
        {
            return View((db.Faqs.
                            Where(s => s.faqtypeId ==
                                        db.Faq_Types.
                                        Where(p => p.id == 2).
                                        Select(p => p.id).
                                        FirstOrDefault())).
                            ToList());
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
