import 'dart:convert';

UserResponseDto userResponseDtoFromJson(String str) => UserResponseDto.fromJson(json.decode(str));

String userResponseDtoToJson(UserResponseDto data) => json.encode(data.toJson());

class UserResponseDto {
    UserResponseDto({
        required this.name,
        required this.lastname,
        required this.email,
    });

    final String name;
    final String lastname;
    final String email;

    factory UserResponseDto.fromJson(Map<String, dynamic> json) => UserResponseDto(
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
    );

    factory UserResponseDto.fromMap(Map<String, dynamic> json) => UserResponseDto(
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "email": email,
    };
}