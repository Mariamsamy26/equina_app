
import 'package:equina_task/app/lessons_cycle/models/public_lesson_details.dart';
import 'package:equina_task/app/lessons_cycle/models/lessons_list.dart';
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

   Future<PublicLessonDetails?> getPublicLessonDetails({required int lessonId ,required int contactId}) async {
    String url = "http://equinaapis.ordarawy.com/lesson_details/$lessonId/$contactId";


    try {
      final response = await DioClient.client.get(url);

      if (response.statusCode == 200) {
        PublicLessonDetails publicLessonDetails = PublicLessonDetails.fromJson(response.data);
        return publicLessonDetails;
      } else {
        return null;
      }
    } catch (e) {
      throw "getPublicLessonDetails error $e";
    }
  }


}
