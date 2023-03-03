class MilkRecord {
  final String? date;
  final String? phoneNumber;
  final double? rate;
  final int? fat;
  final String? name;
  final double? weight;
  final String? animal;
  final double? snf;
  final String? time;
  final double? value;

  MilkRecord({
    this.date,
    this.phoneNumber,
    this.rate,
    this.fat,
    this.name,
    this.weight,
    this.animal,
    this.snf,
    this.time,
    this.value,
  });

  MilkRecord.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String?,
        phoneNumber = json['phoneNumber'] as String?,
        rate = json['rate'] as double?,
        fat = json['fat'] as int?,
        name = json['name'] as String?,
        weight = json['weight'] as double?,
        animal = json['animal'] as String?,
        snf = json['snf'] as double?,
        time = json['time'] as String?,
        value = json['value'] as double?;

  Map<String, dynamic> toJson() => {
        'date': date,
        'phoneNumber': phoneNumber,
        'rate': rate,
        'fat': fat,
        'name': name,
        'weight': weight,
        'animal': animal,
        'snf': snf,
        'time': time,
        'value': value
      };
}
