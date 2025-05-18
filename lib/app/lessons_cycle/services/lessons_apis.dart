import 'package:equina_task/app/lessons_cycle/models/lessons_list';
import 'package:equina_task/services/dio_client.dart';

class LessonsApis {
  Future<LessonsList?> getAllLessons({required int contactId}) async {
    String url = "http://equinaapis.ordarawy.com/lessons_list/$contactId";

    try {
      final response = await DioClient.client.get(url);

      if (response.statusCode == 200) {
        LessonsList lessonsList = LessonsList.fromJson(response.data);
 
        return lessonsList;
      } else {
        return null;
      }
    } catch (e) {
      throw "getAllLessons error $e";
    }
  }
}
