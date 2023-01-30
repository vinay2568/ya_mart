
class AppModel{


  static String userToken='';
  static String slug='';
  static String building='';
  static String street='';
  static String landmark='';
  static String pincode='';
  static String city='';
  static String stateName='';
  static String accountNumber='';
  static String ifscCode='';
  static String gstNumber='';
  static String businessName='';
  static String businessType='';
  static String businessAddress='';
  static String userId='';
  static String fullName='';

  static String setTokenValue(String token)
  {
    userToken=token;
    return userToken;
  }
  static String setUserIdValue(String token)
  {
    userId=token;
    return userId;
  }
  static String setFullName(String token)
  {
    fullName=token;
    return fullName;
  }
  static String setgstNumberValue(String token)
  {
    gstNumber=token;
    return gstNumber;
  }
  static String setbusinessNameValue(String token)
  {
    businessName=token;
    return businessName;
  }
  static String setbusinessTypeValue(String token)
  {
    businessType=token;
    return businessType;
  }

  static String setbusinessAddressValue(String token)
  {
    businessAddress=token;
    return businessAddress;
  }
  static String setSlugValue(String slugValue)
  {
    slug=slugValue;
    return slug;
  }
  static String setAccountNumberValue(String slugValue)
  {
    accountNumber=slugValue;
    return accountNumber;
  }

  static String setIfscCodeValue(String slugValue)
  {
    ifscCode=slugValue;
    return ifscCode;
  }
  static String setBuildingValue(String value)
  {
    building=value;
    return building;
  }

  static String setStreetValue(String value)
  {
    street=value;
    return street;
  }
  static String setLandmarkValue(String value)
  {
    landmark=value;
    return landmark;
  }

  static String setPincodeValue(String value)
  {
    pincode=value;
    return pincode;
  }
  static String setCityValue(String value)
  {
    city=value;
    return city;
  }
  static String setStateNameValue(String value)
  {
    stateName=value;
    return stateName;
  }
}
