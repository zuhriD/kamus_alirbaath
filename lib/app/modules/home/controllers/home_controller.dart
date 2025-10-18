import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kamus_alirbaath/app/data/models/word_models.dart';
import '../../detail/views/detail_view.dart';

class HomeController extends GetxController {
  final TextEditingController searchC = TextEditingController();

  final words = <WordModel>[].obs;
  final filteredWords = <WordModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/words_formatted.json',
      );
      final List<dynamic> jsonList = json.decode(jsonString);

      words.assignAll(jsonList.map((e) => WordModel.fromJson(e)).toList());
      filteredWords.assignAll(words);
    } catch (e) {
      print("❌ Error loading JSON: $e");
    }
  }

  void searchWord(String query) {
    query = query.trim().toLowerCase();
    if (query.isEmpty) {
      filteredWords.assignAll(words);
      return;
    }

    final results =
        words.where((w) {
          final arab = w.kolokasi.toLowerCase();
          final arti = w.arti.toLowerCase();
          return arab.contains(query) || arti.contains(query);
        }).toList();

    filteredWords.assignAll(results);
  }

  void openDetail(WordModel word) {
    Get.to(
      () => const DetailView(),
      arguments: word,
      transition: Transition.cupertino,
    );
  }
}
