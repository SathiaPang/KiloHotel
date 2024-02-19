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

class SearchCategory {
  String Searchtab;

  SearchCategory({
    required this.Searchtab,
  });

  static List<RoomCategory> getSearchList() => [
        RoomCategory(tab: 'All Hotel'),
        RoomCategory(tab: 'Recommended'),
        RoomCategory(tab: 'Popular'),
        RoomCategory(tab: 'Trending'),
      ];
}

class Hotel {
  String img, name, location, category, searchcategory;
  double price;

  Hotel(
      {required this.img,
      required this.location,
      required this.name,
      required this.price,
      required this.category,
      required this.searchcategory});

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'location': location,
      'name': name,
      'price': price,
      'searchcategory': searchcategory,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
        img: map['img'],
        location: map['location'],
        name: map['name'],
        price: map['price'],
        category: map['category'],
        searchcategory: map['searchcategory']);
  }

  static List<Hotel> hotel = [
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 1",
        price: 150.0,
        category: "Recommended",
        searchcategory: "All Hotel" // Replace with the actual price
        ),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 1",
        price: 150.0,
        category: "Recommended", // Replace with the actual price
        searchcategory: "All Hotel"),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 2",
        price: 150.0,
        category: "Recommended", // Replace with the actual price
        searchcategory: "All Hotel"),
    Hotel(
      img: "assets/images/hotel.jpg", // Provide the actual image URL
      location: "Hotel Location",
      name: "Hotel 3",
      price: 150.0,
      category: "Popular", // Replace with the actual price
      searchcategory: "All Hotel",
    ),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 4",
        price: 150.0, // Replace with the actual price
        category: "Trending",
        searchcategory: "All Hotel"),
    Hotel(
        img: "assets/images/hotel.jpg", // Provide the actual image URL
        location: "Hotel Location",
        name: "Hotel 5",
        price: 150.0, // Replace with the actual price
        category: "Trending",
        searchcategory: "All Hotel"),
  ];
}
