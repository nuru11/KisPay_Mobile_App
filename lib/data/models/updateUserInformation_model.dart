class UpdateUserInformation {
  final String firstName;
  final String lastName;
  final String middleName;
  

  UpdateUserInformation({
    required this.firstName,
    required this.lastName,
    required this.middleName,
   
  });

  factory UpdateUserInformation.fromJson(Map<String, dynamic> json) {
    print('Parsing UpdateUserInformation: $json');
    if (json.containsKey("body")) {
      return UpdateUserInformation(
        firstName: json["body"]["firstName"],
        lastName: json["body"]["lastName"],
        middleName: json["body"]["middleName"],
      );
    } else {
      throw Exception("Invalid API response");
    }
  }
}