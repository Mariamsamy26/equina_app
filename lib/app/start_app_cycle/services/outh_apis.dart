import 'package:equina_task/app/start_app_cycle/models/login.dart';
import 'package:equina_task/services/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OuthApis {
  static int userId = -1;

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
        userId = response.data['contact_id'];
        await cacheUserId(userId);
        return logIn;
      } else {
        return null;
      }
    } catch (e) {
      throw "logIn error $e";
    }
  }

  Future<void> cacheUserId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', id);
  }

  static Future<void> loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('user_id') ?? -1;
    print(" Loaded userId: $userId");
  }

  static Future<void> deleteUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
  }
}
