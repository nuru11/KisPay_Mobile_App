class LoginResponse {
  final String token;
  final String firstName;
  final String lastName;
  final String middleName;
  final String email;
  final List<String> roles;
  final String id;

  LoginResponse({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.email,
    required this.roles,
    required this.id,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    print('Parsing LoginResponse: $json');
    if (json.containsKey("body") &&
        json["body"].containsKey("token") &&
        json["body"].containsKey("user")) {
      return LoginResponse(
        token: json["body"]["token"],
        firstName: json["body"]["user"]["firstName"],
        lastName: json["body"]["user"]["lastName"],
        middleName: json["body"]["user"]["middleName"],
        email: json["body"]["user"]["email"],
        roles: List<String>.from(json["body"]["user"]["roles"] ?? []),
        id: json["body"]["user"]["id"],
      );
    } else {
      throw Exception("Invalid API response: Token or User Data not found");
    }
  }
}