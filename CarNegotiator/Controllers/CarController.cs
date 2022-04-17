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
    public class CarController : Controller
    {
        private AutoNegotiatorDBEntities db = new AutoNegotiatorDBEntities();



        [HttpGet]
        public ActionResult GetModels(int id)
        {
            IEnumerable<SelectListItem> models = new SelectList(db.CarModels.Where(s => s.carMakeId == id), "id", "carModelName");
            return Json(models, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Success(CarRequest car)
        {
            return View(car);
        }



        [HttpGet]
        public ActionResult GetVariants(int id)
        {
            IEnumerable<SelectListItem> variants = new SelectList(db.CarVariants.Where(s => s.carModelId == id), "id", "carVariantName");
            return Json(variants, JsonRequestBehavior.AllowGet);
        }


        public async Task<ActionResult> CarDetails(int id)
        {

            IQueryable<CarVariant> carVariant = db.CarVariants.Where(x => x.id == id);

            return View(await carVariant.ToListAsync());

        }



        public ActionResult Apply()
        {
            if (Session["UserID"] == null)
            {
                ViewBag.Error = "Please login to be able to request car";
                return RedirectToAction("Login", "Client", new { area = "" });
            }
            if (Convert.ToString(Session["UserType"]) != "5")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }
            else
            {


                ViewBag.requestMakeId = new SelectList(db.CarMakes, "id", "makeName");
                ViewBag.requestModelId = new SelectList(db.CarModels.Take(1), "id", "carModelName");
                ViewBag.requestVariantId = new SelectList(db.CarVariants.Take(1), "id", "carVariantName");

                ViewBag.tradeinMakeId = new SelectList(db.CarMakes, "id", "makeName");
                ViewBag.tradeinModelId = new SelectList(db.CarModels.Take(1), "id", "carModelName");
                ViewBag.tradeinVariantId = new SelectList(db.CarVariants.Take(1), "id", "carVariantName");

                ViewBag.tradeinFuelId = new SelectList(db.CarVariantFuels, "id", "value");
                ViewBag.tradeinYearId = new SelectList(db.CarVariantYears, "id", "value");

                ViewBag.colorChoice1Id = new SelectList(db.Colors, "id", "Value");
                ViewBag.colorChoice2Id = new SelectList(db.Colors, "id", "Value");
                ViewBag.colorChoice3Id = new SelectList(db.Colors, "id", "Value");

                ViewBag.financeHouseId = new SelectList(db.FinanceHouses, "id", "Value");
                ViewBag.paymentMethodId = new SelectList(db.PaymentMethods, "id", "Value");
                return View();
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Apply(CarRequest carRequest)
        {
            if (Session["UserID"] == null)
            {
                ViewBag.Error = "Please login to be able to request car";
                return RedirectToAction("Login", "Client", new { area = "" });
            }
            if (Convert.ToString(Session["UserType"]) != "5")
            {
                ViewBag.Error = "Please login";
                return RedirectToAction("Login");
            }

            if (ModelState.IsValid)
            {
                carRequest.clientId = Convert.ToInt32(Session["UserID"]);
                carRequest.requestedDate = DateTime.Now;
                carRequest.isRequestActive = false;
                carRequest.isRequestClosed = false;
                carRequest.carVariantId = carRequest.requestVariantId;
                db.CarRequests.Add(carRequest);
                await db.SaveChangesAsync();
                return View("Success", carRequest);
            }

            ViewBag.makeId = new SelectList(db.CarMakes, "id", "makeName");
            ViewBag.modelId = new SelectList(db.CarModels, "id", "carModelName");
            ViewBag.variantId = new SelectList(db.CarVariants, "id", "carVariantName");

            ViewBag.tradeinMakeId = new SelectList(db.CarMakes, "id", "makeName", carRequest.tradeinMakeId);
            ViewBag.tradeinModelId = new SelectList(db.CarModels, "id", "carModelName", carRequest.tradeinModelId);
            ViewBag.tradeinVariantId = new SelectList(db.CarVariants, "id", "carVariantName", carRequest.tradeinVariantId);

            ViewBag.tradeinFuelId = new SelectList(db.CarVariantFuels, "id", "value", carRequest.tradeinFuelId);
            ViewBag.tradeinYearId = new SelectList(db.CarVariantYears, "id", "id", carRequest.tradeinYearId);

            ViewBag.colorChoice1Id = new SelectList(db.Colors, "id", "Value", carRequest.colorChoice1Id);
            ViewBag.colorChoice2Id = new SelectList(db.Colors, "id", "Value", carRequest.colorChoice2Id);
            ViewBag.colorChoice3Id = new SelectList(db.Colors, "id", "Value", carRequest.colorChoice3Id);

            ViewBag.financeHouseId = new SelectList(db.FinanceHouses, "id", "Value", carRequest.financeHouseId);
            ViewBag.paymentMethodId = new SelectList(db.PaymentMethods, "id", "Value", carRequest.paymentMethodId);
            return View(carRequest);
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
