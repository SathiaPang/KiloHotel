import 'package:get/get.dart';
import 'package:hotel/data/data.dart';
import 'package:hotel/repo/homeRepositary.dart';

class FindController extends GetxController {
  FindController({required this.homeRepository});
  final repo = <Hotel>[].obs;
  final searchcategory = <RoomCategory>[].obs;
  final HomeRepository homeRepository;
  final selectedIndex = 0.obs;
  final click = true.obs;

  List<Hotel> _allList = [];

  final RxBool isGridVisible = false.obs;

  @override
  void onInit() async {
    // Get Category
    final tabcate = homeRepository.getSearchCategory();
    searchcategory(tabcate);

    // Get list Hotel
    _allList = await homeRepository.getSearchList();
    filTerByIndex(0);
    super.onInit();
  }

  void filTerByIndex(int index) {
    selectedIndex(index);
    final catergorysearch = searchcategory[index];
    final tmplist =
        _allList.where((e) => e.category == catergorysearch.tab).toList();
    repo(tmplist);
    print(selectedIndex);
    update();
  }

  void changeToList() {
    click(!click.value);
    toggleView();
  }

  void changeToGrid() {
    click(!click.value);
    showGridView();
  }

  void toggleView() {
    isGridVisible.value = false;
    update();
  }

  void showGridView() {
    isGridVisible.value = true;
    update();
  }
}
