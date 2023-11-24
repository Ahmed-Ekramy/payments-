class PaymentInputModel{
  final String amount;
  final String currency;

  PaymentInputModel(this.amount,this.currency);
  toJson(){
    return{
      "amount":amount,
      "currency":currency
    };
  }
}