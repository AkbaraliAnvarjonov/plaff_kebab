class Courier {
  String? phone;
  String? firstName;
  String? lastName;
  String? vehicleNumber;

  Courier({this.phone, this.firstName, this.lastName, this.vehicleNumber});

  Courier.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    vehicleNumber = json['vehicle_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['vehicle_number'] = vehicleNumber;
    return data;
  }
}
