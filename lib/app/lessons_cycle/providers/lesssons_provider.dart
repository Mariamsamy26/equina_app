import 'package:equina_task/app/lessons_cycle/models/public_lesson_details.dart';
import 'package:equina_task/app/lessons_cycle/models/lessons_list.dart';
import 'package:equina_task/app/lessons_cycle/services/lessons_apis.dart';
import 'package:flutter/material.dart';

class LessonsProvider with ChangeNotifier {
  //* VARIABLES
  String _selectedPriceFor = "";
  LessonsList _lessonsList = LessonsList();
  PublicLessonDetails _publicLessonDetails = PublicLessonDetails();

  //* GETTERS
  LessonsList get lessonsList => _lessonsList;
  PublicLessonDetails get publicLessonDetails => _publicLessonDetails;
  String get selectedPriceFor => _selectedPriceFor;

  //* API CALLS
  Future<void> getAllLessons(int contactId) async {
    _lessonsList = (await LessonsApis().getAllLessons(contactId: contactId))!;
    notifyListeners();
  }

  Future<void> getPublicLessonDetails({
    required int lessonId,
    required int contactId,
  }) async {
    _publicLessonDetails =
        (await LessonsApis().getPublicLessonDetails(
          lessonId: lessonId,
          contactId: contactId,
        ))!;
    notifyListeners();
  }

  //* STATE UPDATER
  void updateSelectedPriceFor(String value) {
    _selectedPriceFor = value;
    notifyListeners();
  }

  //* PRICE LOOKUP
  double? getSelectedPrice() {
    final details = _publicLessonDetails.lessonDetails;
    if (details == null) return 0;

    switch (_selectedPriceFor) {
      case 'adultOwnHorseGroup':
        return details.adultOwnHorseGroup;
      case 'adultClubHorseGroup':
        return details.adultClubHorseGroup;
      case 'adultOwnHorsePrivate':
        return details.adultOwnHorsePrivate;
      case 'adultClubHorsePrivate':
        return details.adultClubHorsePrivate;
      case 'childOwnHorseGroup':
        return details.childOwnHorseGroup;
      case 'childClubHorseGroup':
        return details.childClubHorseGroup;
      case 'childOwnHorsePrivate':
        return details.childOwnHorsePrivate;
      case 'childClubHorsePrivate':
        return details.childClubHorsePrivate;
      case 'adultOwnHorseSemiPrivate':
        return details.adultOwnHorseSemiPrivate;
      case 'adultClubHorseSemiPrivate':
        return details.adultClubHorseSemiPrivate;
      case 'childOwnHorseSemiPrivate':
        return details.childOwnHorseSemiPrivate;
      case 'childClubHorseSemiPrivate':
        return details.childClubHorseSemiPrivate;
      default:
        return 0;
    }
  }

//* PRICE not 0
  bool ckickPriceNotZero(String value) {
  _selectedPriceFor = value;
  final selectedPrice =  getSelectedPrice();

  if (selectedPrice != null && selectedPrice > 0) {
    updateSelectedPriceFor(_selectedPriceFor);
    return true;
  } else {
    return false;
  }
}


}
