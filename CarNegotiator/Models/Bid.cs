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
    
    public partial class Bid
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bid()
        {
            this.CarRequests = new HashSet<CarRequest>();
        }
    
        public int id { get; set; }
        public Nullable<int> dealerId { get; set; }
        public int requestId { get; set; }
        public Nullable<int> bidAmount { get; set; }
        public Nullable<bool> isWinningBid { get; set; }
        public Nullable<System.DateTime> bidCreatedDate { get; set; }
        public Nullable<System.DateTime> winningDate { get; set; }
        public Nullable<bool> isDealerInterested { get; set; }
        public string dealerComments { get; set; }
        public string adminComments { get; set; }
        public string adminId { get; set; }
        public Nullable<System.DateTime> bidUpdatedDate { get; set; }
    
        public virtual CarRequest CarRequest { get; set; }
        public virtual Dealer Dealer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CarRequest> CarRequests { get; set; }
    }
}
