class RegisterResponse {
  final String firstName;
  final String lastName;
  final String middleName;
  final String email;
  final String id;

  RegisterResponse({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.email,
    required this.id,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    print('Parsing RegisterResponse: $json');

    final body = json['body'];
    if (body == null) {
      throw Exception("Invalid API response: 'body' field not found");
    }

    return RegisterResponse(
      firstName: body['firstName'] ?? '',
      lastName: body['lastName'] ?? '',
      middleName: body['middleName'] ?? '',
      email: body['email'] ?? '',
      id: body['id'] ?? '',
    );
  }
}
