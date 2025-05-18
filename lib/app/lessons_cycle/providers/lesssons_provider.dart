
import 'package:equina_task/app/lessons_cycle/models/lessons_list';
import 'package:equina_task/app/lessons_cycle/services/lessons_apis.dart';
import 'package:flutter/material.dart';

class LessonsProvider with ChangeNotifier{

    //* VARIABLES

    LessonsList _lessonsList = LessonsList();

    //* GETTER

    LessonsList get lessonsList => _lessonsList;


    //*read  

    Future<void> getAllLessons(int contactId)async{
      _lessonsList = (await LessonsApis().getAllLessons(contactId: contactId))!;

      notifyListeners();
    }

}