import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  static Future<List<User>> getUser() async {
    try {
      String url = 'https://reqres.in/api/users?page=2';
      var uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print(response.statusCode);
        final List<User> user = userFromJson(response.body);
        return user;
      } else {
        print('failed');
        return <User>[];
      }
    } catch (e) {
      print(e.toString());
      return <User>[];
    }
  }
}

List<User> userFromJson(String string) =>
    List<User>.from(json.decode(string)["data"].map((x) => User.fromJson(x)));

class User {
  String email = '';
  String first_name = '';
  String last_name = '';
  String avatar = '';

  User(
      {required this.email,
      required this.avatar,
      required this.first_name,
      required this.last_name});

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar'],
      );
  Map<String, dynamic> toJson() => {
        'emial': email,
        'firat_name': first_name,
        'last_name': last_name,
        'avatar': avatar,
      };
  static List<User> user = [];
}
// normal api but have access to internal api check the error message
// class HttpService {
//   static int? MobileNumberstatus;
//   static int? otpStatus;
//   static var MobileNumbererrorMessage = '';
//   static var otperrorMessage = '';
//   static Future<String> sendMobileNumber(String mobileNumber) async {
//     try {
//       String uri = 'http://196.189.44.36:8089/payment/amole/authorization';
//       final response = await http
//           .post(Uri.parse(uri), body: {'MobileOrCardNumber': mobileNumber});
//       if (response.statusCode == 200) {
//         MobileNumberstatus = 200;
//         String res = response.body;
//         print(res.toString());
//         return res;
//       } else {
//         var res = json.decode(response.body);
//         MobileNumbererrorMessage = res["ErrorMessages"][0].toString();
//         return '';
//       }
//     } catch (e) {
//       return '';
//     }
//   }
//
//   static Future<String> otpAndTransaction(
//       {required String mobileOrCardNumber,
//       required String expirationDate,
//       required String pin,
//       required String amount,
//       required String transactionId,
//       required String transactionDescription,
//       required String vendorAccountId}) async {
//     String uri = 'http://196.189.44.36:8089/payment/amole/transaction';
//     try {
//       var response = await http.post(Uri.parse(uri), body: {
//         "MobileOrCardNumber": mobileOrCardNumber,
//         "ExpirationDate": expirationDate,
//         "Pin": pin,
//         "Amount": amount,
//         "TransactionId": transactionId,
//         "TranactionDescription": transactionDescription,
//         "VendorAccountId": vendorAccountId,
//       });
//       if (response.statusCode == 200) {
//         otpStatus = 200;
//         String res = response.body;
//         print(res.toString());
//         return res;
//       } else {
//         var res = json.decode(response.body);
//         otperrorMessage = res["ErrorMessages"][0].toString();
//         return '';
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }
// }
//
// class MobileOrCardNumber {
//   String mobileOrCardNumber = '';
//
//   MobileOrCardNumber({required this.mobileOrCardNumber});
//
//   factory MobileOrCardNumber.fromJson(Map<String, dynamic> json) =>
//       MobileOrCardNumber(mobileOrCardNumber: json['MobileOrCardNumber']);
//   Map<String, dynamic> toJson() => {'MobileOrCardNumber': mobileOrCardNumber};
// }
//
// class OtpAndTransaction {
//   OtpAndTransaction({
//     required this.mobileOrCardNumber,
//     required this.expirationDate,
//     required this.pin,
//     required this.amount,
//     required this.transactionId,
//     required this.tranactionDescription,
//     required this.vendorAccountId,
//   });
//
//   String mobileOrCardNumber;
//   String expirationDate;
//   String pin;
//   String amount;
//   String transactionId;
//   String tranactionDescription;
//   String vendorAccountId;
//
//   factory OtpAndTransaction.fromJson(Map<String, dynamic> json) =>
//       OtpAndTransaction(
//         mobileOrCardNumber: json["MobileOrCardNumber"],
//         expirationDate: json["ExpirationDate"],
//         pin: json["Pin"],
//         amount: json["Amount"],
//         transactionId: json["TransactionId"],
//         tranactionDescription: json["TranactionDescription"],
//         vendorAccountId: json["VendorAccountId"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "MobileOrCardNumber": mobileOrCardNumber,
//         "ExpirationDate": expirationDate,
//         "Pin": pin,
//         "Amount": amount,
//         "TransactionId": transactionId,
//         "TranactionDescription": tranactionDescription,
//         "VendorAccountId": vendorAccountId,
//       };
// }
