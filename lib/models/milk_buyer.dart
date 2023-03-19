class MilkBuyer {
  final bool? evening;
  final bool? morning;
  final String? name;
  final String? phoneNumber;

  MilkBuyer({
    this.evening,
    this.morning,
    this.name,
    this.phoneNumber,
  });

  MilkBuyer.fromJson(Map<String, dynamic> json)
      : evening = json['evening'] as bool?,
        morning = json['morning'] as bool?,
        name = json['name'] as String?,
        phoneNumber = json['phoneNumber'] as String?;

  Map<String, dynamic> toJson() => {
        'evening': evening,
        'morning': morning,
        'name': name,
        'phoneNumber': phoneNumber
      };
}
