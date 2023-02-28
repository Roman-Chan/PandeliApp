// To parse this JSON data, do
//
//     final designResponseDto = designResponseDtoFromMap(jsonString);

import 'dart:convert';

DesignResponseDto designResponseDtoFromMap(String str) => DesignResponseDto.fromMap(json.decode(str));

String designResponseDtoToMap(DesignResponseDto data) => json.encode(data.toMap());

class DesignResponseDto {
    DesignResponseDto({
        required this.id,
        required this.imgUrl,
        required this.description,
        required this.price,
        required this.status,
    });

    final String id;
    final String imgUrl;
    final String description;
    final int price;
    final bool status;

    factory DesignResponseDto.fromMap(Map<String, dynamic> json) => DesignResponseDto(
        id: json["_id"],
        imgUrl: json["imgURL"],
        description: json["description"],
        price: json["price"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "imgURL": imgUrl,
        "description": description,
        "price": price,
        "status": status,
    };
}
