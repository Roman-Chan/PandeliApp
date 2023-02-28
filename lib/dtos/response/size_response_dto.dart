// To parse this JSON data, do
//
//     final sizeResponseDto = sizeResponseDtoFromMap(jsonString);

import 'dart:convert';

SizeResponseDto sizeResponseDtoFromMap(String str) => SizeResponseDto.fromMap(json.decode(str));

String sizeResponseDtoToMap(SizeResponseDto data) => json.encode(data.toMap());

class SizeResponseDto {
    SizeResponseDto({
        required this.id,
        required this.imgUrl,
        required this.size,
        required this.price,
        required this.status,
    });

    final String id;
    final String imgUrl;
    final String size;
    final int price;
    final bool status;

    factory SizeResponseDto.fromMap(Map<String, dynamic> json) => SizeResponseDto(
        id: json["_id"],
        imgUrl: json["imgURL"],
        size: json["size"],
        price: json["price"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "imgURL": imgUrl,
        "size": size,
        "price": price,
        "status": status,
    };
}
