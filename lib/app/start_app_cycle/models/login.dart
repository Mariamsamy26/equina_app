
import 'dart:convert';

LogIn logInFromJson(String str) => LogIn.fromJson(json.decode(str));

String logInToJson(LogIn data) => json.encode(data.toJson());

class LogIn {
    int? status;
    int? contactId;

    LogIn({
        this.status,
        this.contactId,
    });

    factory LogIn.fromJson(Map<String, dynamic> json) => LogIn(
        status: json["status"],
        contactId: json["contact_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "contact_id": contactId,
    };
}
