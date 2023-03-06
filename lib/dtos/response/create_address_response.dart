// To parse this JSON data, do
//
//     final createAddressRequestDto = createAddressRequestDtoFromJson(jsonString);

import 'dart:convert';

CreateAddressRequestDto createAddressRequestDtoFromJson(String str) =>
    CreateAddressRequestDto.fromJson(json.decode(str));

String createAddressRequestDtoToJson(CreateAddressRequestDto data) =>
    json.encode(data.toJson());

class CreateAddressRequestDto {
  CreateAddressRequestDto({
    required this.address,
    
  });

  final String address;

  factory CreateAddressRequestDto.fromJson(Map<String, dynamic> json) =>
      CreateAddressRequestDto(
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
      };
}
