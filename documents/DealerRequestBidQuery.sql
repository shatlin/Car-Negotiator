


            --IQueryable<RequestsBidsVM> requestsBidsQuery = (from a in db.CarRequests
            --                                           join b in db.CarVariants on a.carVariantId equals b.id
            --                                           join c in db.CarModels on b.carModelId equals c.id
            --                                           join d in db.CarMakes on c.carMakeId equals d.id
            --                                           join e in db.Clients on a.clientId equals e.id
            --                                           join f in db.Bids on a.id equals f.requestId
            --                                           join g in db.Dealers on f.dealerId equals g.id
            --                                           join h in db.DealerMakes on g.id equals h.dealerId
            --                                           join i in db.DealerProvinces on g.id equals i.dealerId
            --                                           where 
            --                                           a.isRequestClosed == false && 
            --                                           a.isRequestActive==true && 
            --                                           g.id==Id && 
            --                                           h.carMakeId==d.id && 
            --                                           h.dealerId==Id &&
            --                                           i.provinceId==e.provinceId &&
            --                                           i.dealerId==Id
            --                                           orderby a.id
            --                                           select new RequestsBidsVM
            --                                           {
            --                                               requestId = a.id,
            --                                               car =  d.makeName + " " + a.CarVariant1.carVariantName,
            --                                               Colors=a.Color.Value + "," + a.Color1.Value + " , "+ a.Color2.Value,
            --                                               isFinanceApproved =a.financeApproved,
            --                                               Province=e.Province.name,
            --                                               Town= e.Town.name,
            --                                               requestedDate = a.requestedDate,
            --                                               BidClosingDate = a.deliveryRequestDate,
            --                                           });

select a.id as requestID, b.carVariantName,c.carModelName,d.makeName,e.firstName,f.name, h.Name
from 
	CarRequests a, CarVariants b, CarModels c , CarMakes d,Clients e,Provinces f, Towns h
where 
	a.carVariantId=b.id
	and b.carModelId=c.id
	and c.carMakeId=d.id
	and a.clientId=e.id
	and e.provinceId=f.id
	and e.townId=h.id
	and a.isRequestClosed='false'
	and a.isRequestActive='true'