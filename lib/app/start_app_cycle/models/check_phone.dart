// To parse this JSON data, do
//
//     final checkPhone = checkPhoneFromJson(jsonString);

import 'dart:convert';

CheckPhone checkPhoneFromJson(String str) => CheckPhone.fromJson(json.decode(str));

String checkPhoneToJson(CheckPhone data) => json.encode(data.toJson());

class CheckPhone {
    int? status;
    String? msg;
    String? type;

    CheckPhone({
        this.status,
        this.msg,
        this.type,
    });

    factory CheckPhone.fromJson(Map<String, dynamic> json) => CheckPhone(
        status: json["status"],
        msg: json["msg"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "type": type,
    };
}
