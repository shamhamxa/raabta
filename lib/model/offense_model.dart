class OffenseModel {
  String message;
  bool status;
  List<Data>? data;

  OffenseModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory OffenseModel.fromJson(Map<String, dynamic> json) {
    return OffenseModel(
      message: json['message'],
      status: json['status'],
      data: List<Data>.from(json['data'].map((e) => Data.fromJson(e))),
    );
  }
}

class Data {
  String? id;
  String? offenceCodes;
  String? engTitle;
  String? urdTitle;
  String? motorCycle;
  String? carJeep;
  String? ltv;
  String? psvHtv;

  Data({
    required this.id,
    required this.offenceCodes,
    required this.engTitle,
    required this.urdTitle,
    required this.motorCycle,
    required this.carJeep,
    required this.ltv,
    required this.psvHtv,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        offenceCodes: json['offence_codes'],
        engTitle: json['eng_title'],
        urdTitle: json['urd_title'],
        motorCycle: json['MotorCycle'],
        carJeep: json['Car/Jeep'],
        ltv: json['LTV'],
        psvHtv: json['PSV/HTV']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['offence_codes'] = offenceCodes;
    data['eng_title'] = engTitle;
    data['urd_title'] = urdTitle;
    data['MotorCycle'] = motorCycle;
    data['Car/Jeep'] = carJeep;
    data['LTV'] = ltv;
    data['PSV/HTV'] = psvHtv;
    return data;
  }
}
