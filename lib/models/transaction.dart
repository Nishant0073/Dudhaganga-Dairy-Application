class AmountTransaction {
  final String? amountPaid;
  final String? date;
  final String? initialBalance;
  final String? remaningBalance;

  AmountTransaction({
    this.amountPaid,
    this.date,
    this.initialBalance,
    this.remaningBalance,
  });

  AmountTransaction.fromJson(Map<String, dynamic> json)
      : amountPaid = json['amountPaid'] as String?,
        date = json['date'] as String?,
        initialBalance = json['initialBalance'] as String?,
        remaningBalance = json['remaningBalance'] as String?;

  Map<String, dynamic> toJson() => {
        'amountPaid': amountPaid,
        'date': date,
        'initialBalance': initialBalance,
        'remaningBalance': remaningBalance
      };
}
