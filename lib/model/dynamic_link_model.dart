import 'dart:convert';

DynamicLinkModel dynamicLinkModelFromJson(String str) =>
    DynamicLinkModel.fromJson(json.decode(str));

String dynamicLinkModelToJson(DynamicLinkModel data) =>
    json.encode(data.toJson());

class DynamicLinkModel {
  DynamicLinkModel({
    this.id,
    this.route,
    this.image,
    this.api,
    this.pageType,
  });

  DynamicLinkModel.fromJson(dynamic json) {
    id = json['id'];
    route = json['route'];
    image = json['image'];
    api = json['api'];
    pageType = json['page_type'];
  }

  num? id;
  String? route;
  String? image;
  String? api;
  String? pageType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['route'] = route;
    map['image'] = image;
    map['api'] = api;
    map['page_type'] = pageType;
    return map;
  }
}
