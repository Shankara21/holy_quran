import 'dart:convert';

AsmaulHusna asmaulHusnaFromJson(String str) =>
    AsmaulHusna.fromJson(json.decode(str));

String asmaulHusnaToJson(AsmaulHusna data) => json.encode(data.toJson());

class AsmaulHusna {
  String index;
  String latin;
  String arabic;
  String translationId;
  String translationEn;

  AsmaulHusna({
    required this.index,
    required this.latin,
    required this.arabic,
    required this.translationId,
    required this.translationEn,
  });

  factory AsmaulHusna.fromJson(Map<String, dynamic> json) => AsmaulHusna(
        index: json["index"],
        latin: json["latin"],
        arabic: json["arabic"],
        translationId: json["translation_id"],
        translationEn: json["translation_en"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "latin": latin,
        "arabic": arabic,
        "translation_id": translationId,
        "translation_en": translationEn,
      };
}
