import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/search/controller/search_controller.dart';
import '../../utils/constants/colors.dart';


class Search extends StatelessWidget {
  const Search({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MySearchController()) ;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: AppBar(
          backgroundColor: MyColors.bgColor,
          title: TextField(
            onChanged: (value) {
              controller.updateSearchQuery(value);
            },
            decoration: const InputDecoration(
              hintText: 'ابحث هنا...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white54),
              icon: Icon(Icons.content_paste_search, color: MyColors.grayColor),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Obx(() {
          var filteredItems = controller.filteredItems;
          return filteredItems.isEmpty
              ? Center(
            child: Text(
              controller.searchQuery.isEmpty
                  ? 'ابدأ بالبحث...'
                  : 'لا توجد نتائج',
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
          )
              : ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  filteredItems[index],
                  style: const TextStyle(color: Colors.black),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
