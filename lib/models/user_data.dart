class UserData {
  final String nationalId;
  final String cardNum;
  final String cardPin;
  final String expiryDate;
  final String email;
  final String username;
  final String password;
  final String address;
  final int balance;

  UserData(
      {required this.address,
      required this.balance,
      required this.cardNum,
      required this.cardPin,
      required this.email,
      required this.expiryDate,
      required this.nationalId,
      required this.password,
      required this.username});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
      address: json["Address"],
      balance: json["Balance"],
      cardNum: json["CardNumber"],
      cardPin: json["CardPin"],
      email: json["Email"],
      expiryDate: json["ExpiryDate"],
      nationalId: json["NationalId"],
      password: json["Password"],
      username: json["Username"]);

  Map<String, dynamic> toJson() => {
        "NationalId": nationalId,
        "CardNumber": cardNum,
        "CardPin": cardPin,
        "ExpiryDate": expiryDate,
        "Email": email,
        "Username": username,
        "Address": address,
        "Password": password,
        "Balance": balance
      };
}
