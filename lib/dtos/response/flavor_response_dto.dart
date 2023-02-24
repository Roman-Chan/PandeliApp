// To parse this JSON data, do
//
//     final flavorResponseDto = flavorResponseDtoFromMap(jsonString);

import 'dart:convert';

FlavorResponseDto flavorResponseDtoFromMap(String str) => FlavorResponseDto.fromMap(json.decode(str));

String flavorResponseDtoToMap(FlavorResponseDto data) => json.encode(data.toMap());

class FlavorResponseDto {
    FlavorResponseDto({
        required this.id,
        required this.imgUrl,
        required this.flavor,
        required this.price,
        required this.status,
    });

    final String id;
    final String imgUrl;
    final String flavor;
    final int price;
    final bool status;

    factory FlavorResponseDto.fromMap(Map<String, dynamic> json) => FlavorResponseDto(
        id: json["_id"],
        imgUrl: json["imgURL"],
        flavor: json["flavor"],
        price: json["price"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "imgURL": imgUrl,
        "flavor": flavor,
        "price": price,
        "status": status,
    };
}
