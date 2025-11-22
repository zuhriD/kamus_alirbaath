import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kamus_alirbaath/app/data/models/word_models.dart';
import '../../detail/views/detail_view.dart';

class HomeController extends GetxController {
  final TextEditingController searchC = TextEditingController();
  final RxString searchText = ''.obs;

  final words = <WordModel>[].obs;
  final filteredWords = <WordModel>[].obs;

  final RxInt currentTab = 0.obs;

  void changeTab(int index) {
    currentTab.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
    searchC.addListener(() => searchWord(searchC.text));
  }

  Future<void> loadJsonData() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/words_formatted_new.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    words.assignAll(jsonList.map((e) => WordModel.fromJson(e)).toList());
    filteredWords.assignAll(words);
  }

  void searchWord(String query) {
    searchText.value = query; // 🟢 simpan query untuk trigger Obx
    query = query.trim().toLowerCase();
    if (query.isEmpty) {
      filteredWords.assignAll(words);
      return;
    }
    filteredWords.assignAll(
      words.where(
        (w) =>
            w.arabGundul.toLowerCase().contains(query) ||
            w.kolokasi.toLowerCase().contains(query) ||
            w.arti.toLowerCase().contains(query),
      ),
    );
  }

  void openDetail(WordModel word) {
    Get.to(() => const DetailView(), arguments: word);
  }
}
