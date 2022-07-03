class EditAddressModel {
  String? first_name;
  String? last_name;
  String? street_address;
  String? street_address_two;
  String? city;
  String? state;
  String? pincode;
  String? mobile;

  EditAddressModel(
    this.first_name,
    this.last_name,
    this.street_address,
    this.street_address_two,
    this.city,
    this.state,
    this.pincode,
    this.mobile,
  );

  EditAddressModel.fromJson(Map<String, String> json) {
    this.first_name = json["first_name"];
    this.last_name = json["last_name"];
    this.street_address = json["street_address"];
    this.street_address_two = json["street_address_two"];
    this.city = json["city"];
    this.state = json["state"];
    this.pincode = json["pincode"];
    this.mobile = json["mobile"];
  }
}
