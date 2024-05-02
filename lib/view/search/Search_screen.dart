import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/search_controller.dart';

import 'demoSearch.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final Rx<Color> iconColor = Colors.black.obs;
  final SearchDataController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearch(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: white,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Recommended ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: '(484,579)',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            _ListItemView()
          ],
        ),
      ),
    );
  }

  Widget _ListItemView() => Expanded(
        child: DemoSearch(),
      );

  Widget _buildSearch() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: Get.height / 16,
          child: TextField(
            onChanged: (value) => _searchController.searchByTitle(),
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.3),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      );
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hotel/constant/appRoute.dart';
// import 'package:hotel/constant/constant.dart';
// import 'package:hotel/controller/search_controller.dart';
// import 'package:hotel/model/room_model.dart';

// class SearchScreen extends StatefulWidget {
//   SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen>
//     with TickerProviderStateMixin {
//   final SearchDataController _findController = Get.find();
//   final Rx<Color> iconColor = Colors.black.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: greenAccent,
//       body: Column(
//         children: [
//           // SizedBox(
//           //   height: Get.height / 20,
//           // ),
//           _buildSearch(),
//           Text("data"),
//           Expanded(
//             child: FutureBuilder<List<Datum>>(
//                 future: _findController.searchByTitle(),
//                 builder: (context, snapshot) {
//                   var data = snapshot.data;
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else
//                     return ListView.builder(
//                       itemCount: data?.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             Get.toNamed(AppRoute.bookindeDetail,
//                                 arguments: data![index]);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 20),
//                             child: Container(
//                               height: 120,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: white,
//                               ),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 7),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       height: 100,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               "${data?[index].image}"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 10),
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             '"${data?[index].title}"',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 17),
//                                           ),
//                                           SizedBox(height: 5),
//                                           Text(
//                                             '"${data?[index].subTitle}"',
//                                             style: TextStyle(fontSize: 14),
//                                           ),
//                                           SizedBox(height: 5),
//                                           Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.star,
//                                                 color: Colors.amber,
//                                               ),
//                                               Text(
//                                                 '5.0',
//                                                 style: TextStyle(
//                                                     fontSize: 17,
//                                                     color: Colors.green),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "\$ ${data?[index].price}",
//                                           style: TextStyle(
//                                             color: Colors.green,
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text("/night"),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearch() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Container(
//           height: Get.height / 16,
//           child: TextField(
//             onChanged: (value) => _findController.searchByTitle(),
//             autofocus: true,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey.withOpacity(0.3),
//               hintText: 'Search',
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//         ),
//       );
// }

  // Widget _buildSearch() => Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 10),
  //       child: TextFormField(
  //         autofocus: false,
  //         onTap: () {
  //           showSearch(context: context, delegate: SearchItem());
  //         },
  //         decoration: InputDecoration(
  //           filled: true,
  //           fillColor: borderfield.withOpacity(0.3),
  //           hintText: 'Search....',
  //           prefixIcon: Icon(Icons.search),
  //           suffixIcon: Padding(
  //             padding: const EdgeInsets.only(right: 15.0),
  //             child: IconButton(
  //               onPressed: () {
  //                 // showSearch(context: context, delegate: SearchItem());
  //               },
  //               icon: Icon(
  //                 Icons.tune,
  //                 color: Colors.green,
  //               ),
  //             ),
  //           ),
  //           border: OutlineInputBorder(
  //             borderSide: BorderSide.none,
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //         ),
  //       ),
  //     );

