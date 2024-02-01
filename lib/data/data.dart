class Room {
  String name, location, price, img, tab;

  Room({
    required this.tab,
    required this.price,
    required this.img,
    required this.name,
    required this.location,
  });

  static List<Room> getList() => [
        Room(tab: 'Recommended', price: "", img: "", name: "", location: ""),
        Room(tab: 'Popular', price: "", img: "", name: "", location: ""),
        Room(tab: 'Trending', price: "", img: "", name: "", location: "")
      ];
}

class Hotel {
  String img, name, location, tab;
  double price;

  Hotel({
    required this.img,
    required this.tab,
    required this.location,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'location': location,
      'name': name,
      'price': price,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      img: map['img'],
      tab: map['tab'],
      location: map['location'],
      name: map['name'],
      price: map['price'],
    );
  }

  static List<Hotel> hotel = [
    Hotel(
      tab: "Recommended",
      img: "assets/images/hotel.jpg", // Provide the actual image URL
      location: "Hotel Location",
      name: "Hotel 1",
      price: 150.0, // Replace with the actual price
    ),
    Hotel(
      tab: "Recommended",
      img: "assets/images/hotel.jpg", // Provide the actual image URL
      location: "Hotel Location",
      name: "Hotel 2",
      price: 150.0, // Replace with the actual price
    ),
    Hotel(
      tab: "Recommended",
      img: "assets/images/hotel.jpg", // Provide the actual image URL
      location: "Hotel Location",
      name: "Hotel 3",
      price: 150.0, // Replace with the actual price
    ),
    Hotel(
      tab: "Recommended",
      img: "assets/images/hotel.jpg", // Provide the actual image URL
      location: "Hotel Location",
      name: "Hotel 4",
      price: 150.0, // Replace with the actual price
    ),
    Hotel(
      tab: "Recommended",
      img: "assets/images/hotel.jpg", // Provide the actual image URL
      location: "Hotel Location",
      name: "Hotel 5",
      price: 150.0, // Replace with the actual price
    ),
  ];
}
