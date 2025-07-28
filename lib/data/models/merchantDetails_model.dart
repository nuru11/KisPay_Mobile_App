class MerchantDetailResponse {
  final String businessName;
  final String phoneNumber;

  MerchantDetailResponse({
    required this.businessName,
    required this.phoneNumber,
   
  });

  factory MerchantDetailResponse.fromJson(Map<String, dynamic> json) {
    print('Parsing MerchantDetailResponse: $json');
    if (json.containsKey("body") &&
        
        json["body"].containsKey("kyc") 
        ) {
      return MerchantDetailResponse(
        businessName: json["body"]["kyc"]["businessDetails"]["businessName"],
        phoneNumber: json["body"]["phoneNumber"],
      );
    } else {
      throw Exception("Invalid API response: Token or KYC or Business Details not found");
    }
  }
}