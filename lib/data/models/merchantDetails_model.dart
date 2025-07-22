class MerchantDetailResponse {
  final String businessName;

  MerchantDetailResponse({
    required this.businessName,
   
  });

  factory MerchantDetailResponse.fromJson(Map<String, dynamic> json) {
    print('Parsing MerchantDetailResponse: $json');
    if (json.containsKey("body") &&
        
        json["body"].containsKey("kyc") 
        ) {
      return MerchantDetailResponse(
        businessName: json["body"]["kyc"]["businessDetails"]["businessName"],
      );
    } else {
      throw Exception("Invalid API response: Token or KYC or Business Details not found");
    }
  }
}