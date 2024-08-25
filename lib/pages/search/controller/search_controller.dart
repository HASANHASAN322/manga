
import 'package:get/get.dart';

class MySearchController extends GetxController {
  static MySearchController get instance => Get.find() ;

  var searchQuery = ''.obs;

  var allItems = <String>[

  ].obs;

  List<String> get filteredItems {
    if (searchQuery.isEmpty) {
      return [];
    }
    return allItems
        .where((item) =>
        item.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
