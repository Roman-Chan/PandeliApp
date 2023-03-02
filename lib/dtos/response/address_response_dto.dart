class AddressResponseDto {
  AddressResponseDto({
    required this.addresses,
  });

  final List<String> addresses;

  int get length => addresses.length;

  String operator [](int index) => addresses[index]; // definición del operador '[]'

  factory AddressResponseDto.fromJson(Map<String, dynamic> json) =>
      AddressResponseDto(
        addresses: (json["addresses"] as List<dynamic>).map((address) => address.toString()).toList(),
      );
      
  Map<String, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
      };
}