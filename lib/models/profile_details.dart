class ProfileDataModel {
  String? full_name;

  String? email;
  String? mobile;

  ProfileDataModel(
    this.full_name,
    this.email,
    this.mobile,
  );

  ProfileDataModel.fromJson(Map<String, String> json) {
    this.full_name = json["full_name"];
    this.mobile = json["mobile"];
    this.email = json["email"];
  }
}
