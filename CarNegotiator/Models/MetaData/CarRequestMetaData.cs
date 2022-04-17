//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarNegotiator.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;


    public partial class CarRequestMetaData
    {

        [Display(Name = " Please select by when you need the Delivery (Required)", Prompt = "Please select Delivery Date")]
        [Required(ErrorMessage = "Delivery Date is required")]
        public System.DateTime deliveryRequestDate { get; set; }

        [Display(Name = " Please select your First Color Choice", Prompt = "First Color Choice")]
        public Nullable<int> colorChoice1Id { get; set; }

        [Display(Name = " Please select your Second Color Choice", Prompt = "Second Color Choice")]
        public Nullable<int> colorChoice2Id { get; set; }

        [Display(Name = " Please select your Third Color Choice", Prompt = "Third Color Choice")]
        public Nullable<int> colorChoice3Id { get; set; }

        [Display(Name = "If your preferred colors are not available, can a dealer bid on any color?")]
        public bool canOfferDifferentColor { get; set; }

        [Display(Name = "Please select your payment method")]
        public Nullable<int> paymentMethodId { get; set; }

        [Display(Name = "Is your Finance Approved?")]
        public bool financeApproved { get; set; }

        [Display(Name = "Please select Finance House")]
        public Nullable<int> financeHouseId { get; set; }

        [Display(Name = "Please enter deposit Amount if available")]
        public Nullable<int> depositAmount { get; set; }

        [Display(Name = "Do you have a trade in Vehicle?")]
        public bool tradeinVehicleAvailable { get; set; }

        [Display(Name = "Please select your trade in Vehicle's make")]
        public Nullable<int> tradeinMakeId { get; set; }

        [Display(Name = "Please select your trade in Vehicle's Model")]
        public Nullable<int> tradeinModelId { get; set; }

        [Display(Name = "Please select your trade in Vehicle's Variant")]
        public Nullable<int> tradeinVariantId { get; set; }

        [Display(Name = "Please select your trade in Vehicle's Year")]
        public Nullable<int> tradeinYearId { get; set; }

        [Display(Name = "Please select your trade in Vehicle's Fuel Type")]
        public Nullable<int> tradeinFuelId { get; set; }

        [Display(Name = "Please add further description of the trade in vehicle")]
        [DataType(DataType.MultilineText)]
        public string tradeinDescription { get; set; }

        public Nullable<int> tradeinValue { get; set; }

        [Display(Name = "Please enter the KM run of your trade in Vehicle")]
        public Nullable<int> tradeinKMs { get; set; }

        [Display(Name = "Please add further comments about your request")]
        [DataType(DataType.MultilineText)]
        public string clientComments { get; set; }

        public bool isRequestActive { get; set; }
        public Nullable<int> winningBidId { get; set; }
        public Nullable<bool> clientAcceptedWinningBid { get; set; }
        public Nullable<int> actualSellingPrice { get; set; }
        public Nullable<int> commissionCalculated { get; set; }
        public Nullable<int> commisionReceived { get; set; }
        public string AdminComments { get; set; }
        public int carVariantId { get; set; }
    }

    [MetadataType(typeof(CarRequestMetaData))]
    public partial class CarRequest
    {
        [Display(Name = "Please select your Requesting Vehicle's Make (Required)")]
        public int requestMakeId { get; set; }
        [Display(Name = "Please select your requesting Vehicle's Model (Required)")]
        public int requestModelId { get; set; }
        [Display(Name = "Please select your requesting Vehicle's Variant (Required)")]
        public int requestVariantId { get; set; }

    }
}