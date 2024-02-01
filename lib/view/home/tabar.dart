// import 'package:flutter/material.dart';

// class TabBarCustom extends StatefulWidget {
//   final List<String> menu;
//   final ValueChanged<String> onTabChange;
//   final IconData Function(String) getIcon;

//   const TabBarCustom({
//     Key? key,
//     required this.menu,
//     required this.onTabChange,
//     required this.getIcon,
//   }) : super(key: key);

//   @override
//   State<TabBarCustom> createState() => _TabBarCustomState();
// }

// class _TabBarCustomState extends State<TabBarCustom>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   int _activeTab = 0;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: widget.menu.length, vsync: this);

//     _tabController.addListener(() {
//       setState(() {
//         _activeTab = _tabController.index;
//         widget.onTabChange(widget.menu[_activeTab]);
//       });
//     });
//   }

//   List<Widget> _buildTabUI() {
//     return widget.menu
//         .asMap()
//         .entries
//         .map((e) => buildTab(e.value, widget.getIcon(e.value), e.key))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(children: [
//         SizedBox(
//           height: 70,
//           child: TabBar(
//             isScrollable: true,
//             dividerColor: Colors.transparent,
//             controller: _tabController,
//             indicatorColor: Colors.transparent,
//             labelColor: Colors.white,
//             tabAlignment: TabAlignment.start,
//             tabs: _buildTabUI(),
//           ),
//         ),
//         const SizedBox(height: 10),
//       ]),
//     );
//   }

//   Widget buildTab(String label, IconData icon, int index) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: _activeTab == index
//             ? Colors.red
//             : Colors.grey, // Set the background color for tabs
//       ),
//       height: 60,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: Colors.white,
//             ),
//             SizedBox(width: 20),
//             Text(
//               label,
//               // style: GoogleFonts.poppins(
//               //   color: Colors.white,
//               // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
