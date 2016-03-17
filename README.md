# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

## Knowledge Base
### Money borrowed
### Interest
### Fees

## Questions
* Many articles says that is aways better to use Integer arithmetic, because it's much faster than floating point arithmetic. The current table is using Decimal for the value.
* I built a system for payment and coupons integrated with stripe with ruby before and I used integer for that. Works very well.
- http://www.setfiremedia.com/blog/7-top-tips-for-coding-with-currency
- http://stackoverflow.com/questions/3730019/why-not-use-double-or-float-to-represent-currency

## OBS
###(Grape)
* I'm using grape instead the controllers because it has many benefits including authentication integration, documentation generation, versioning system and also a better api dependency system, where I'm not going to depend on rails a lot, and also in the future I'm going to be able to use rake instead everything from rails.

### Payment date
I could use created_at as payment date but I'm creating this field just to follow the documentation spec.

# USAGE
## Documentation
You can test the documentation using this demo: [http://petstore.swagger.io/](http://petstore.swagger.io/)
You just need to replace the url inside the input for `http://localhost:3000/api/swagger_doc` and click in Explore.

![doc](https://cldup.com/3yiXSZNGpM.png)

# Endpoints
* `GET http://localhost:3000/api/v1/loans`
* `GET http://localhost:3000/api/v1/loans/{id}`
* `GET http://localhost:3000/api/v1/loans/{id}/payments`
* `POST http://localhost:3000/api/v1/loans/{id}/payments`
