class BookingModel {
  String? checkIn;
  String? checkOut;
  String? specialRequest;
  List<BookingDetail>? bookingDetail;

  BookingModel(
      {this.checkIn, this.checkOut, this.specialRequest, this.bookingDetail});

  BookingModel.fromJson(Map<String, dynamic> json) {
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    specialRequest = json['specialRequest'];
    if (json['bookingDetail'] != null) {
      bookingDetail = <BookingDetail>[];
      json['bookingDetail'].forEach((v) {
        bookingDetail!.add(new BookingDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkIn'] = this.checkIn;
    data['checkOut'] = this.checkOut;
    data['specialRequest'] = this.specialRequest;
    if (this.bookingDetail != null) {
      data['bookingDetail'] =
          this.bookingDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingDetail {
  int? roomTypeId;
  int? adult;
  int? child;

  BookingDetail({this.roomTypeId, this.adult, this.child});

  BookingDetail.fromJson(Map<String, dynamic> json) {
    roomTypeId = json['roomTypeId'];
    adult = json['adult'];
    child = json['child'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomTypeId'] = this.roomTypeId;
    data['adult'] = this.adult;
    data['child'] = this.child;
    return data;
  }
}
