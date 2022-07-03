class InvoiceModel {
  String? customerName;
  String? vehicle;
  String? technicianName;
  String? garageName;
  String? serviceTotal;
  String? serviceName;
  String? date;
  String? paymentMode;

  InvoiceModel(
      this.customerName,
      this.vehicle,
      this.technicianName,
      this.garageName,
      this.serviceTotal,
      this.serviceName,
      this.date,
      this.paymentMode);

  InvoiceModel.fromJson(Map<String, String> json) {
    this.customerName = json["customerName"];
    this.vehicle = json["vehicle"];
    this.technicianName = json["technicianName"];
    this.garageName = json["garageName"];
    this.serviceTotal = json["serviceTotal"];
    this.serviceName = json["serviceName"];
    this.date = json["date"];
    this.paymentMode = json["paymentMode"];
  }
}
