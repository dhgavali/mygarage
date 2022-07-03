class OrderReceiptModel {
  String? serviceTotal;
  String? serviceName;
  String? orderId;
  String? paymentStatus;
  String? paymentId;

  OrderReceiptModel(this.serviceTotal, this.serviceName, this.orderId,
      this.paymentStatus, this.paymentId);

  OrderReceiptModel.fromJson(Map<String, String> json) {
    this.serviceTotal = json['serviceTotal'];
    this.serviceName = json['serviceName'];
    this.orderId = json['orderId'];
    this.paymentStatus = json['paymentStatus'];
    this.paymentId = json['paymentId'];
  }
}
