class ResetResponse {
  int status;
  String message;
  String messageKey;
  String? data; // Adjusted to handle string data
  dynamic paging;

  ResetResponse({
    required this.status,
    required this.message,
    required this.messageKey,
    required this.data,
    required this.paging,
  });

  factory ResetResponse.fromJson(Map<String, dynamic> json) {
    return ResetResponse(
      status: json['status'],
      message: json['message'],
      messageKey: json['messageKey'],
      data: json['data'],
      paging: json['paging'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'messageKey': messageKey,
      'data': data,
      'paging': null,
    };
  }
}
