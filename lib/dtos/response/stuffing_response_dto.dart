// To parse this JSON data, do
//
//     final stuffingResponseDto = stuffingResponseDtoFromMap(jsonString);

import 'dart:convert';

StuffingResponseDto stuffingResponseDtoFromMap(String str) => StuffingResponseDto.fromMap(json.decode(str));

String stuffingResponseDtoToMap(StuffingResponseDto data) => json.encode(data.toMap());

class StuffingResponseDto {
    StuffingResponseDto({
        required this.id,
        required this.imgUrl,
        required this.stuffing,
        required this.price,
        required this.status,
    });

    final String id;
    final String imgUrl;
    final String stuffing;
    final int price;
    final bool status;

    factory StuffingResponseDto.fromMap(Map<String, dynamic> json) => StuffingResponseDto(
        id: json["_id"],
        imgUrl: json["imgURL"],
        stuffing: json["stuffing"],
        price: json["price"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "imgURL": imgUrl,
        "stuffing": stuffing,
        "price": price,
        "status": status,
    };
}
