# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

# Knowledge Base
### Money borrowed
### Interest
### Fees

### Questions
* Many articles says that is aways better to use Integer arithmetic, because it's much faster than floating point arithmetic. The current table is using Decimal for the value.
* I built a system for payment and coupons integrated with stripe with ruby before and I used integer for that. Works very well.
- http://www.setfiremedia.com/blog/7-top-tips-for-coding-with-currency
- http://stackoverflow.com/questions/3730019/why-not-use-double-or-float-to-represent-currency
