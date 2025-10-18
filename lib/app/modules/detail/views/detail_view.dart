import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus_alirbaath/app/data/models/word_models.dart';
import 'package:kamus_alirbaath/app/theme/app_theme.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final WordModel word = Get.arguments;

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Hero(
          tag: word.kolokasi,
          child: Material(
            color: Colors.transparent,
            child: Text(
              word.kolokasi,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Amiri',
                fontSize: 26,
                color: kPrimary,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Arti
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: kShadow,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              word.arti,
              style: const TextStyle(fontSize: 17, color: kTextDark),
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            "Contoh Kalimat",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: kTextDark,
            ),
          ),
          const SizedBox(height: 12),

          // Daftar kalimat
          ...word.contohKalimat.map(
            (c) => Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 3,
              shadowColor: kShadow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              c.arab,
                              style: const TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 22,
                                color: kPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      c.indo,
                      style: const TextStyle(fontSize: 15, color: kTextDark),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
