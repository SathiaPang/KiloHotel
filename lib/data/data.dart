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
  String searchtab;

  SearchCategory({
    required this.searchtab,
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
        img: "assets/images/hotel.jpg",
        location: "Cambodia, Battambong",
        name: "Hotel 1",
        price: 150.0,
        category: "Recommended",
        searchcategory: "All Hotel"),
    Hotel(
        img: "assets/images/hotel.jpg",
        location: "Cambodia, kandal",
        name: "Hotel 1",
        price: 160.0,
        category: "Recommended",
        searchcategory: "All Hotel"),
    Hotel(
        img: "assets/images/hotel.jpg",
        location: "Cambodia, Kompot",
        name: "Hotel 2",
        price: 140.0,
        category: "Recommended",
        searchcategory: "All Hotel"),
    Hotel(
      img: "assets/images/hotel.jpg",
      location: "Cambodia, Kompong Cham",
      name: "Hotel 3",
      price: 100.0,
      category: "Popular",
      searchcategory: "All Hotel",
    ),
    Hotel(
        img: "assets/images/hotel.jpg",
        location: "Cambodia, MundulKiri",
        name: "Hotel 4",
        price: 200.0,
        category: "Trending",
        searchcategory: "All Hotel"),
    Hotel(
        img: "assets/images/hotel.jpg",
        location: "Cambodia, Siem Reab",
        name: "Hotel 5",
        price: 180.0, //
        category: "Trending",
        searchcategory: "All Hotel"),
    Hotel(
        img: "assets/images/hotel.jpg",
        location: "Cambodia, kandal",
        name: "Hotel 6",
        price: 160.0,
        category: "Recommended",
        searchcategory: "All Hotel"),
  ];
}
