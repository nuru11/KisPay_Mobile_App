class ForgetPasswordResponse {
  
  final String message;

  ForgetPasswordResponse({
   
    required this.message,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    print('Parsing LoginResponse: $json');
    if (json.containsKey("message")) {
      return ForgetPasswordResponse(
       
        message: json["message"],
      );
    } else {
      throw Exception("Invalid API response: Token or User Data not found");
    }
  }
}