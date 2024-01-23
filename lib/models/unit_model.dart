class Unit {
  final int id;
  final String pointId;
  final String systemGuid;
  final String plant;
  final String unit;
  final String code;

  Unit(
      {required this.id,
      required this.pointId,
      required this.systemGuid,
      required this.plant,
      required this.unit,
      required this.code});

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      pointId: json['point_id'],
      systemGuid: json['system_guid'],
      plant: json['plant_name'],
      unit: json['code'],
      code: json['code'],
    );
  }

  static List<Unit> listFromJson(List<dynamic> data) =>
      List.from(data.map((e) => Unit.fromJson(e)));
}
