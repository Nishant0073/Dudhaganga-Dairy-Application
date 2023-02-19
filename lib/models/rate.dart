class Rate {
  double? fat;
  double? snf;
  double? value;
  Rate({this.fat, this.snf, this.value});

  Map<String, Object?> toJson() => {
        'fat': fat,
        'snf': snf,
        'value': value,
      };
}
