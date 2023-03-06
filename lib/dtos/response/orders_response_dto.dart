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
    required this.orderId,
        required this.imgUrl,
        required this.size,
        required this.flavor,
        required this.stuffing,
        required this.total,
        required this.status,
        required this.orderDay,
  });

  final String orderId;
    final String imgUrl;
    final String size;
    final String flavor;
    final String stuffing;
    final int total;
    final String status;
    final String orderDay;

  factory OrderResponseDto.fromMap(Map<String, dynamic> json) =>
      OrderResponseDto(
          orderId: json["orderId"],
        imgUrl: json["imgURL"],
        size: json["size"],
        flavor: json["flavor"],
        stuffing: json["stuffing"],
        total: json["total"],
        status: json["status"],
        orderDay: json["orderDay"],
      );

  Map<String, dynamic> toMap() => {
        "orderId": orderId,
        "imgURL": imgUrl,
        "size": size,
        "flavor": flavor,
        "stuffing": stuffing,
        "total": total,
        "status": status,
        "orderDay": orderDay,
      };
}
