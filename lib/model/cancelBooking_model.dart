class CancelBookingModel {
  int status;
  String message;
  String messageKey;

  CancelBookingModel({
    required this.status,
    required this.message,
    required this.messageKey,
  });

  factory CancelBookingModel.fromJson(Map<String, dynamic> json) =>
      CancelBookingModel(
        status: json["status"],
        message: json["message"],
        messageKey: json["messageKey"],
      );
}
