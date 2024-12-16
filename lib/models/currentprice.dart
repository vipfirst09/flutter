class Time {
  const Time({required this.updated});

  final String? updated;

  factory Time.fromJson(Map<String, dynamic> object) {
    return Time(updated: object['updated']);
  }
}

class Currentprice {
  const Currentprice({required this.time, required this.disclaimer});

  final Time time;
  final String disclaimer;

  factory Currentprice.fromJson(Map<String, dynamic> object) {
    return Currentprice(
        time: Time.fromJson(object['time']), disclaimer: object['disclaimer']);
  }
}
