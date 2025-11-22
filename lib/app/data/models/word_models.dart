class WordModel {
  final int id;
  final String arabGundul;
  final String kolokasi;
  final String arti;
  final List<ContohKalimat> contohKalimat;
  final String sheet;

  WordModel({
    required this.id,
    required this.arabGundul,
    required this.kolokasi,
    required this.arti,
    required this.contohKalimat,
    required this.sheet,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      id: json['id'] ?? 0,
      arabGundul: json['arab_gundul'] ?? '',
      kolokasi: json['kolokasi'] ?? '',
      arti: json['arti'] ?? '',
      contohKalimat:
          (json['contoh_kalimat'] as List?)
              ?.map((e) => ContohKalimat.fromJson(e))
              .toList() ??
          [],
      sheet: json['sheet'] ?? '',
    );
  }
}

class ContohKalimat {
  final String arab;
  final String indo;

  ContohKalimat({required this.arab, required this.indo});

  factory ContohKalimat.fromJson(Map<String, dynamic> json) {
    return ContohKalimat(arab: json['arab'] ?? '', indo: json['indo'] ?? '');
  }
}
