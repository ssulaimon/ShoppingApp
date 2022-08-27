class PaymentDetails {
  String name;
  String cardNumber;
  String expMonth;
  String expYear;
  String cvv;
  String date;
  String amountPaid;
  String itemNumber;
  PaymentDetails({
    required this.amountPaid,
    required this.cardNumber,
    required this.cvv,
    required this.date,
    required this.expMonth,
    required this.expYear,
    required this.name,
    required this.itemNumber,
  });
}
