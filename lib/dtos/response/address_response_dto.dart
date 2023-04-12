class AddressResponseDto {
  AddressResponseDto({
    required this.index,
    required this.address,
    // required this.addresses,
  });

  final int index;
  final String address;

  factory AddressResponseDto.fromMap(Map<String, dynamic> json) =>
      AddressResponseDto(index: json['index'], address: json['address']);

  Map<String, dynamic> toJson() => {
        "index": index,
        "address": address,
      };
}

  // final List<String> addresses;

  // int get length => addresses.length;

  // String operator [](int index) => addresses[index]; // definición del operador '[]'

  // factory AddressResponseDto.fromJson(Map<String, dynamic> json) =>
  //     AddressResponseDto(
  //       addresses: (json["addresses"] as List<dynamic>).map((address) => address.toString()).toList(),
  //     );
