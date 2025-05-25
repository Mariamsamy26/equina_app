import 'package:equina_task/app/start_app_cycle/models/login.dart';
import 'package:equina_task/services/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OuthApis {
  Future<int?> checkPhone({required String phoneNumber}) async {
    String url = "http://equinaapis.ordarawy.com/checkmail/$phoneNumber";

    try {
      final response = await DioClient.client.get(url);

      if (response.statusCode == 200) {
        int status = response.data['status'];
        return status;
      } else {
        return null;
      }
    } catch (e) {
      throw "checkPhone error $e";
    }
  }

  Future<LogIn?> logIn({
    required String phone,
    required String password,
  }) async {
    String url = "http://equinaapis.ordarawy.com/CheckLogin";
    try {
      final response = await DioClient.client.post(
        url,
        data: {"email": phone, "password": password},
      );

      if (response.statusCode == 200) {
        LogIn logIn = LogIn.fromJson(response.data);

        if (logIn.status == 1) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('user_id', logIn.contactId!);
        }

        return logIn;
      } else {
        return null;
      }
    } catch (e) {
      throw "logIn error $e";
    }
  }

  // static Future<void> deleteUserId() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('user_id');
  // }
}
