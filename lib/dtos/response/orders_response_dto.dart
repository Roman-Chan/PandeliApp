// To parse this JSON data, do
//
//     final orderResponseDto = orderResponseDtoFromMap(jsonString);

import 'dart:convert';

OrderResponseDto orderResponseDtoFromMap(String str) =>
    OrderResponseDto.fromMap(json.decode(str));

String orderResponseDtoToMap(OrderResponseDto data) =>
    json.encode(data.toMap());

class OrderResponseDto {
  OrderResponseDto({
    required this.user,
    required this.imgUrl,
    required this.size,
    required this.flavor,
    required this.idStuffing,
    required this.status,
  });

  final String user;
  final String imgUrl;
  final String size;
  final String flavor;
  final String idStuffing;
  final String status;

  factory OrderResponseDto.fromMap(Map<String, dynamic> json) =>
      OrderResponseDto(
        user: json["user"],
        imgUrl: json["imgURL"],
        size: json["size"],
        flavor: json["flavor"],
        idStuffing: json["id_stuffing"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "imgURL": imgUrl,
        "size": size,
        "flavor": flavor,
        "id_stuffing": idStuffing,
        "status": status,
      };
}
