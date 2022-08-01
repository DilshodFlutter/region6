import 'dart:convert';

List<RegionModel> regionModelFromJson(String str) => List<RegionModel>.from(
    json.decode(str).map((x) => RegionModel.fromJson(x)));

class RegionModel {
  RegionModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.childs,
  });

  int id;
  String name;
  String slug;
  List<RegionModel> childs;

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        childs: json["childs"] == null
            ? <RegionModel>[]
            : List<RegionModel>.from(
                json["childs"].map((x) => RegionModel.fromJson(x))),
      );
}

//kakkakakakaka
