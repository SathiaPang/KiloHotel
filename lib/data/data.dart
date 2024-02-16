class RoomCategory {
  String tab;

  RoomCategory({
    required this.tab,
  });

  static List<RoomCategory> getList() => [
        RoomCategory(tab: 'Recommended'),
        RoomCategory(tab: 'Popular'),
        RoomCategory(tab: 'Trending'),
      ];
}

class Hotel {
  String img, name, location, category;
  double price;

  Hotel(
      {required this.img,
      required this.location,
      required this.name,
      required this.price,
      required this.category});

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
        location: map['location'],
        name: map['name'],
        price: map['price'],
        category: map['category']);
  }

  static List<Hotel> hotel = [
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 1",
        price: 150.0,
        category: "Recommended" // Replace with the actual price
        ),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 1",
        price: 150.0,
        category: "Recommended" // Replace with the actual price
        ),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 2",
        price: 150.0,
        category: "Recommended" // Replace with the actual price
        // Replace with the actual price
        ),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 3",
        price: 150.0,
        category: "Popular" // Replace with the actual price
        // Replace with the actual price
        ),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 4",
        price: 150.0, // Replace with the actual price
        category: "Trending"),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 5",
        price: 150.0, // Replace with the actual price
        category: "Trending"),
  ];
}
