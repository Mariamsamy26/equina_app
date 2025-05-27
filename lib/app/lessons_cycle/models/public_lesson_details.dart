// To parse this JSON data, do
//
//     final publicLessonDetails = publicLessonDetailsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

PublicLessonDetails publicLessonDetailsFromJson(String str) => PublicLessonDetails.fromJson(json.decode(str));

String publicLessonDetailsToJson(PublicLessonDetails data) => json.encode(data.toJson());

class PublicLessonDetails {
  PublicLessonDetails({
    this.status,
    this.lessonDetails,
  });

  int? status;
  LessonDetails? lessonDetails;

  factory PublicLessonDetails.fromJson(Map<String, dynamic> json) => PublicLessonDetails(
        status: json["status"] == null ? null : json["status"],
        lessonDetails: json["lesson_details"] == null ? null : LessonDetails.fromJson(json["lesson_details"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "lesson_details": lessonDetails == null ? null : lessonDetails!.toJson(),
      };
}

class LessonDetails {
  LessonDetails({
    this.id,
    this.name,
    this.competenciesId,
    this.description,
    this.classDuration,
    this.categoryId,
    this.categoryName,
    this.minPax,
    this.maxPax,
    this.lessonLevel,
    this.dbName,
    this.rate,
    this.rateCount,
    this.discount,
    this.givePoints,
    this.groupRedeemPoints,
    this.privateRedeemPoints,
    this.semiPrivateRedeemPoints,
    this.tripsHire,
    this.fullClassesLesson,
    this.openClassesLesson,
    this.seasonalLesson,
    this.normalLesson,
    this.lessonRepetition,
    this.groupActive,
    this.privateActive,
    this.semiPrivateActive,
    this.childGroup,
    this.adultGroup,
    this.childPrivate,
    this.adultPrivate,
    this.childSemiPrivate,
    this.adultSemiPrivate,
    this.childOwnHorseGroup,
    this.childClubHorseGroup,
    this.childOwnHorsePrivate,
    this.childClubHorsePrivate,
    this.childOwnHorseSemiPrivate,
    this.childClubHorseSemiPrivate,
    this.adultOwnHorseGroup,
    this.adultClubHorseGroup,
    this.adultOwnHorsePrivate,
    this.adultClubHorsePrivate,
    this.adultOwnHorseSemiPrivate,
    this.adultClubHorseSemiPrivate,
    this.seasonStartingDate,
    this.seasonEndDate,
    this.tripStartingDate,
    this.tripEndDate,
    this.tripmo,
    this.triptu,
    this.tripwe,
    this.tripth,
    this.tripfr,
    this.tripsa,
    this.tripsu,
    this.oneInterval,
    this.twoInterval,
    this.threeInterval,
    this.interval1FromTime,
    this.interval1ToTime,
    this.interval2FromTime,
    this.interval2ToTime,
    this.interval3FromTime,
    this.interval3ToTime,
    this.tripInterval1FromTime,
    this.tripInterval1ToTime,
    this.tripInterval2FromTime,
    this.tripInterval2ToTime,
    this.tripInterval3FromTime,
    this.tripInterval3ToTime,
    this.packageBuy1,
    this.packageBuy2,
    this.packageBuy3,
    this.packagePercentage1Discount,
    this.packageFixed1Discount,
    this.packagePoints1,
    this.packagePercentage2Discount,
    this.packageFixed2Discount,
    this.packagePoints2,
    this.packagePercentage3Discount,
    this.packageFixed3Discount,
    this.packagePoints3,
    this.booked,
    this.isInCart,
    this.group,
    this.private,
    this.semiPrivate,
    this.dates,
    this.minChildAge,
    this.maxChildAge,
    this.type,
    this.reservationPeriod,
    this.mo,
    this.tu,
    this.we,
    this.th,
    this.fr,
    this.sa,
    this.su,
    this.numberOfClasses,
    this.startingDate,
    this.openLessonEndDate,
    this.showMedicalReport,
    this.showRidingSkills,
    this.userPoints,
    this.includeOneClassPackage,
    this.familyDiscount,
    this.tripBookedDates,
    this.redeemActive,
    this.redeemValue,
    this.futureBooked,
    this.classTypeDescription,
    this.lessonType,
    this.lessonLevelString,
    this.beginner,
    this.intermediate,
    this.advanced,
    this.clubNumber,
  });

  int? id;
  String? name;
  dynamic competenciesId;
  String? description;
  double? classDuration;
  int? categoryId;
  String? categoryName;
  double? minPax;
  double? maxPax;
  int? lessonLevel;
  String? dbName;
  int? rate;
  int? rateCount;
  double? discount;
  int? givePoints;
  int? groupRedeemPoints;
  int? privateRedeemPoints;
  int? semiPrivateRedeemPoints;
  bool? tripsHire;
  bool? fullClassesLesson;
  bool? openClassesLesson;
  bool? seasonalLesson;
  bool? normalLesson;
  bool? lessonRepetition;
  String? groupActive;
  String? privateActive;
  String? semiPrivateActive;
  bool? childGroup;
  bool? adultGroup;
  bool? childPrivate;
  bool? adultPrivate;
  bool? childSemiPrivate;
  bool? adultSemiPrivate;
  double? childOwnHorseGroup;
  double? childClubHorseGroup;
  double? childOwnHorsePrivate;
  double? childClubHorsePrivate;
  double? childOwnHorseSemiPrivate;
  double? childClubHorseSemiPrivate;
  double? adultOwnHorseGroup;
  double? adultClubHorseGroup;
  double? adultOwnHorsePrivate;
  double? adultClubHorsePrivate;
  double? adultOwnHorseSemiPrivate;
  double? adultClubHorseSemiPrivate;
  String? seasonStartingDate;
  String? seasonEndDate;
  String? tripStartingDate;
  String? tripEndDate;
  bool? mo;
  bool? tu;
  bool? we;
  bool? th;
  bool? fr;
  bool? sa;
  bool? su;
  bool? tripmo;
  bool? triptu;
  bool? tripwe;
  bool? tripth;
  bool? tripfr;
  bool? tripsa;
  bool? tripsu;
  bool? oneInterval;
  bool? twoInterval;
  bool? threeInterval;
  String? interval1FromTime;
  String? interval1ToTime;
  String? interval2FromTime;
  String? interval2ToTime;
  String? interval3FromTime;
  String? interval3ToTime;
  String? tripInterval1FromTime;
  String? tripInterval1ToTime;
  String? tripInterval2FromTime;
  String? tripInterval2ToTime;
  String? tripInterval3FromTime;
  String? tripInterval3ToTime;
  double? packageBuy1;
  double? packageBuy2;
  double? packageBuy3;
  double? packagePercentage1Discount;
  double? packageFixed1Discount;
  double? packagePoints1;
  double? packagePercentage2Discount;
  double? packageFixed2Discount;
  double? packagePoints2;
  double? packagePercentage3Discount;
  double? packageFixed3Discount;
  double? packagePoints3;
  bool? booked;
  bool? isInCart;
  bool? group;
  bool? private;
  bool? semiPrivate;
  List<DateTime>? dates;
  List<DateTime>? tripBookedDates;
  int? minChildAge;
  int? maxChildAge;
  String? type;
  int? reservationPeriod;
  double? numberOfClasses;
  String? startingDate;
  String? openLessonEndDate;
  bool? showMedicalReport;
  bool? showRidingSkills;
  int? userPoints;
  bool? includeOneClassPackage;
  bool? familyDiscount;
  bool? redeemActive;
  int? redeemValue;
  bool? futureBooked;
  String? classTypeDescription;
  String? lessonType;
  String? lessonLevelString;
  bool? beginner;
  bool? intermediate;
  bool? advanced;
  String? clubNumber;

  factory LessonDetails.fromJson(Map<String, dynamic> json) => LessonDetails(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        competenciesId: json["competencies_id"],
        description: json["description"] == null ? null : json["description"],
        classDuration: json["class_duration"] == null ? null : json["class_duration"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
        minPax: json["min_pax"] == null ? null : json["min_pax"],
        maxPax: json["max_pax"] == null ? null : json["max_pax"],
        lessonLevel: json["lesson_level"] == null ? null : json["lesson_level"],
        dbName: json["db_name"] == null ? null : json["db_name"],
        rate: json["rate"] == null ? null : json["rate"],
        rateCount: json["rate_count"] == null ? null : json["rate_count"],
        discount: json["discount"] == null ? null : json["discount"],
        givePoints: json["give_points"] == null ? null : json["give_points"],
        groupRedeemPoints: json["group_redeem_points"] == null ? null : json["group_redeem_points"],
        privateRedeemPoints: json["private_redeem_points"] == null ? null : json["private_redeem_points"],
        semiPrivateRedeemPoints: json["semi_private_redeem_points"] == null ? null : json["semi_private_redeem_points"],
        tripsHire: json["trips_hire"] == null ? null : json["trips_hire"],
        fullClassesLesson: json["full_classes_lesson"] == null ? null : json["full_classes_lesson"],
        openClassesLesson: json["open_classes_lesson"] == null ? null : json["open_classes_lesson"],
        seasonalLesson: json["seasonal_lesson"] == null ? null : json["seasonal_lesson"],
        normalLesson: json["normal_lesson"] == null ? null : json["normal_lesson"],
        lessonRepetition: json["lesson_repetition"] == null ? null : json["lesson_repetition"],
        groupActive: json["group_active"] == null ? null : json["group_active"],
        privateActive: json["private_active"] == null ? null : json["private_active"],
        semiPrivateActive: json["semi_private_active"] == null ? null : json["semi_private_active"],
        childGroup: json["child_group"] == null ? null : json["child_group"],
        adultGroup: json["adult_group"] == null ? null : json["adult_group"],
        childPrivate: json["child_private"] == null ? null : json["child_private"],
        adultPrivate: json["adult_private"] == null ? null : json["adult_private"],
        childSemiPrivate: json["child_semi_private"] == null ? null : json["child_semi_private"],
        adultSemiPrivate: json["adult_semi_private"] == null ? null : json["adult_semi_private"],
        childOwnHorseGroup: json["child_own_horse_group"] == null ? null : json["child_own_horse_group"]!.ceilToDouble(),
        childClubHorseGroup: json["child_club_horse_group"] == null ? null : json["child_club_horse_group"]!.ceilToDouble(),
        childOwnHorsePrivate: json["child_own_horse_private"] == null ? null : json["child_own_horse_private"]!.ceilToDouble(),
        childClubHorsePrivate: json["child_club_horse_private"] == null ? null : json["child_club_horse_private"]!.ceilToDouble(),
        childOwnHorseSemiPrivate:
            json["child_own_horse_semi_private"] == null ? null : json["child_own_horse_semi_private"]!.ceilToDouble(),
        childClubHorseSemiPrivate:
            json["child_club_horse_semi_private"] == null ? null : json["child_club_horse_semi_private"]!.ceilToDouble(),
        adultOwnHorseGroup: json["adult_own_horse_group"] == null ? null : json["adult_own_horse_group"]!.ceilToDouble(),
        adultClubHorseGroup: json["adult_club_horse_group"] == null ? null : json["adult_club_horse_group"]!.ceilToDouble(),
        adultOwnHorsePrivate: json["adult_own_horse_private"] == null ? null : json["adult_own_horse_private"]!.ceilToDouble(),
        adultClubHorsePrivate: json["adult_club_horse_private"] == null ? null : json["adult_club_horse_private"]!.ceilToDouble(),
        adultOwnHorseSemiPrivate:
            json["adult_own_horse_semi_private"] == null ? null : json["adult_own_horse_semi_private"]!.ceilToDouble(),
        adultClubHorseSemiPrivate:
            json["adult_club_horse_semi_private"] == null ? null : json["adult_club_horse_semi_private"]!.ceilToDouble(),
        seasonStartingDate: json["season_starting_date"] == null ? null : json["season_starting_date"],
        seasonEndDate: json["season_end_date"] == null ? null : json["season_end_date"],
        tripStartingDate: json["trip_starting_date"] == null ? null : json["trip_starting_date"],
        tripEndDate: json["trip_end_date"] == null ? null : json["trip_end_date"],
        tripmo: json["tripmo"] == null ? null : json["tripmo"],
        triptu: json["triptu"] == null ? null : json["triptu"],
        tripwe: json["tripwe"] == null ? null : json["tripwe"],
        tripth: json["tripth"] == null ? null : json["tripth"],
        tripfr: json["tripfr"] == null ? null : json["tripfr"],
        tripsa: json["tripsa"] == null ? null : json["tripsa"],
        tripsu: json["tripsu"] == null ? null : json["tripsu"],
        oneInterval: json["one_interval"] == null ? null : json["one_interval"],
        twoInterval: json["two_interval"] == null ? null : json["two_interval"],
        threeInterval: json["three_interval"] == null ? null : json["three_interval"],
        interval1FromTime: json["interval_1_from_time"] == null ? null : json["interval_1_from_time"],
        interval1ToTime: json["interval_1_to_time"] == null ? null : json["interval_1_to_time"],
        interval2FromTime: json["interval_2_from_time"] == null ? null : json["interval_2_from_time"],
        interval2ToTime: json["interval_2_to_time"] == null ? null : json["interval_2_to_time"],
        interval3FromTime: json["interval_3_from_time"] == null ? null : json["interval_3_from_time"],
        interval3ToTime: json["interval_3_to_time"] == null ? null : json["interval_3_to_time"],
        tripInterval1FromTime: json["trip_interval_1_from_time"] == null ? null : json["trip_interval_1_from_time"],
        tripInterval1ToTime: json["trip_interval_1_to_time"] == null ? null : json["trip_interval_1_to_time"],
        tripInterval2FromTime: json["trip_interval_2_from_time"] == null ? null : json["trip_interval_2_from_time"],
        tripInterval2ToTime: json["trip_interval_2_to_time"] == null ? null : json["trip_interval_2_to_time"],
        tripInterval3FromTime: json["trip_interval_3_from_time"] == null ? null : json["trip_interval_3_from_time"],
        tripInterval3ToTime: json["trip_interval_3_to_time"] == null ? null : json["trip_interval_3_to_time"],
        packageBuy1: json["package_buy_1"] == null ? null : json["package_buy_1"],
        packageBuy2: json["package_buy_2"] == null ? null : json["package_buy_2"],
        packageBuy3: json["package_buy_3"] == null ? null : json["package_buy_3"],
        packagePercentage1Discount: json["package_percentage_1_discount"] == null ? null : json["package_percentage_1_discount"],
        packageFixed1Discount: json["package_fixed_1_discount"] == null ? null : json["package_fixed_1_discount"],
        packagePoints1: json["package_points_1"] == null ? null : json["package_points_1"],
        packagePercentage2Discount: json["package_percentage_2_discount"] == null ? null : json["package_percentage_2_discount"],
        packageFixed2Discount: json["package_fixed_2_discount"] == null ? null : json["package_fixed_2_discount"],
        packagePoints2: json["package_points_2"] == null ? null : json["package_points_2"],
        packagePercentage3Discount: json["package_percentage_3_discount"] == null ? null : json["package_percentage_3_discount"],
        packageFixed3Discount: json["package_fixed_3_discount"] == null ? null : json["package_fixed_3_discount"],
        packagePoints3: json["package_points_3"] == null ? null : json["package_points_3"],
        booked: json["booked"] == null ? null : json["booked"],
        isInCart: json["is_in_cart"] == null ? null : json["is_in_cart"],
        group: json["group"] == null ? null : json["group"],
        private: json["private"] == null ? null : json["private"],
        semiPrivate: json["semi_private"] == null ? null : json["semi_private"],
        dates: json["dates"] == null ? null : List<DateTime>.from(json["dates"].map((x) => DateTime.parse(x))),
        tripBookedDates:
            json["trip_dates_list"] == null ? null : List<DateTime>.from(json["trip_dates_list"].map((x) => DateTime.parse(x))),
        minChildAge: json["min_child_age"] == null ? null : json["min_child_age"],
        maxChildAge: json["max_child_age"] == null ? null : json["max_child_age"],
        type: json["type"] == null ? null : json["type"],
        reservationPeriod: json["reservation_period"] == null ? null : json["reservation_period"],
        mo: json["mo"] == null ? null : json["mo"],
        tu: json["tu"] == null ? null : json["tu"],
        we: json["we"] == null ? null : json["we"],
        th: json["th"] == null ? null : json["th"],
        fr: json["fr"] == null ? null : json["fr"],
        sa: json["sa"] == null ? null : json["sa"],
        su: json["su"] == null ? null : json["su"],
        numberOfClasses: json["num_of_classes"] == null ? null : json["num_of_classes"],
        startingDate: json["starting_date"] == null ? null : json["starting_date"],
        openLessonEndDate: json["open_lesson_end_date"] == null ? null : json["open_lesson_end_date"],
        showMedicalReport: json["show_medical_report"] == null ? null : json["show_medical_report"],
        showRidingSkills: json["show_riding_skills"] == null ? null : json["show_riding_skills"],
        userPoints: json["user_points"] == null ? null : json["user_points"],
        includeOneClassPackage: json["include_1_class_package"] == null ? null : json["include_1_class_package"],
        familyDiscount: json["family_discount"] == null ? null : json["family_discount"],
        redeemActive: json["redeem"] == null ? null : json["redeem"],
        redeemValue: json["redeem_value"] == null ? null : json["redeem_value"],
        futureBooked: json["future_booked"] == null ? null : json["future_booked"],
        classTypeDescription: json["class_type_description"] == null ? null : json["class_type_description"],
        lessonType: json["lesson_type"] == null ? null : json["lesson_type"],
        lessonLevelString: json["lesson_level_string"] == null ? null : json["lesson_level_string"],
        beginner: json["beginner"] == null ? null : json["beginner"],
        intermediate: json["intermediate"] == null ? null : json["intermediate"],
        advanced: json["advanced"] == null ? null : json["advanced"],
        clubNumber: json["club_number"] == null ? null : json["club_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "competencies_id": competenciesId,
        "description": description == null ? null : description,
        "class_duration": classDuration == null ? null : classDuration,
        "category_id": categoryId == null ? null : categoryId,
        "category_name": categoryName == null ? null : categoryName,
        "min_pax": minPax == null ? null : minPax,
        "max_pax": maxPax == null ? null : maxPax,
        "lesson_level": lessonLevel == null ? null : lessonLevel,
        "db_name": dbName == null ? null : dbName,
        "rate": rate == null ? null : rate,
        "rate_count": rateCount == null ? null : rateCount,
        "discount": discount == null ? null : discount,
        "give_points": givePoints == null ? null : givePoints,
        "group_redeem_points": groupRedeemPoints == null ? null : groupRedeemPoints,
        "private_redeem_points": privateRedeemPoints == null ? null : privateRedeemPoints,
        "semi_private_redeem_points": semiPrivateRedeemPoints == null ? null : semiPrivateRedeemPoints,
        "trips_hire": tripsHire == null ? null : tripsHire,
        "full_classes_lesson": fullClassesLesson == null ? null : fullClassesLesson,
        "open_classes_lesson": openClassesLesson == null ? null : openClassesLesson,
        "seasonal_lesson": seasonalLesson == null ? null : seasonalLesson,
        "normal_lesson": normalLesson == null ? null : normalLesson,
        "lesson_repetition": lessonRepetition == null ? null : lessonRepetition,
        "group_active": groupActive == null ? null : groupActive,
        "private_active": privateActive == null ? null : privateActive,
        "semi_private_active": semiPrivateActive == null ? null : semiPrivateActive,
        "child_group": childGroup == null ? null : childGroup,
        "adult_group": adultGroup == null ? null : adultGroup,
        "child_private": childPrivate == null ? null : childPrivate,
        "adult_private": adultPrivate == null ? null : adultPrivate,
        "child_semi_private": childSemiPrivate == null ? null : childSemiPrivate,
        "adult_semi_private": adultSemiPrivate == null ? null : adultSemiPrivate,
        "child_own_horse_group": childOwnHorseGroup == null ? null : childOwnHorseGroup,
        "child_club_horse_group": childClubHorseGroup == null ? null : childClubHorseGroup,
        "child_own_horse_private": childOwnHorsePrivate == null ? null : childOwnHorsePrivate,
        "child_club_horse_private": childClubHorsePrivate == null ? null : childClubHorsePrivate,
        "child_own_horse_semi_private": childOwnHorseSemiPrivate == null ? null : childOwnHorseSemiPrivate,
        "child_club_horse_semi_private": childClubHorseSemiPrivate == null ? null : childClubHorseSemiPrivate,
        "adult_own_horse_group": adultOwnHorseGroup == null ? null : adultOwnHorseGroup,
        "adult_club_horse_group": adultClubHorseGroup == null ? null : adultClubHorseGroup,
        "adult_own_horse_private": adultOwnHorsePrivate == null ? null : adultOwnHorsePrivate,
        "adult_club_horse_private": adultClubHorsePrivate == null ? null : adultClubHorsePrivate,
        "adult_own_horse_semi_private": adultOwnHorseSemiPrivate == null ? null : adultOwnHorseSemiPrivate,
        "adult_club_horse_semi_private": adultClubHorseSemiPrivate == null ? null : adultClubHorseSemiPrivate,
        "season_starting_date": seasonStartingDate == null ? null : seasonStartingDate,
        "season_end_date": seasonEndDate == null ? null : seasonEndDate,
        "trip_end_date": tripEndDate == null ? null : tripEndDate,
        "tripmo": tripmo == null ? null : tripmo,
        "triptu": triptu == null ? null : triptu,
        "tripwe": tripwe == null ? null : tripwe,
        "tripth": tripth == null ? null : tripth,
        "tripfr": tripfr == null ? null : tripfr,
        "tripsa": tripsa == null ? null : tripsa,
        "tripsu": tripsu == null ? null : tripsu,
        "one_interval": oneInterval == null ? null : oneInterval,
        "two_interval": twoInterval == null ? null : twoInterval,
        "three_interval": threeInterval == null ? null : threeInterval,
        "interval_1_from_time": interval1FromTime == null ? null : interval1FromTime,
        "interval_1_to_time": interval1ToTime == null ? null : interval1ToTime,
        "interval_2_from_time": interval2FromTime == null ? null : interval2FromTime,
        "interval_2_to_time": interval2ToTime == null ? null : interval2ToTime,
        "interval_3_from_time": interval3FromTime == null ? null : interval3FromTime,
        "interval_3_to_time": interval3ToTime == null ? null : interval3ToTime,
        "package_buy_1": packageBuy1 == null ? null : packageBuy1,
        "package_buy_2": packageBuy2 == null ? null : packageBuy2,
        "package_buy_3": packageBuy3 == null ? null : packageBuy3,
        "package_percentage_1_discount": packagePercentage1Discount == null ? null : packagePercentage1Discount,
        "package_fixed_1_discount": packageFixed1Discount == null ? null : packageFixed1Discount,
        "package_points_1": packagePoints1 == null ? null : packagePoints1,
        "package_percentage_2_discount": packagePercentage2Discount == null ? null : packagePercentage2Discount,
        "package_fixed_2_discount": packageFixed2Discount == null ? null : packageFixed2Discount,
        "package_points_2": packagePoints2 == null ? null : packagePoints2,
        "package_percentage_3_discount": packagePercentage3Discount == null ? null : packagePercentage3Discount,
        "package_fixed_3_discount": packageFixed3Discount == null ? null : packageFixed3Discount,
        "package_points_3": packagePoints3 == null ? null : packagePoints3,
        "booked": booked == null ? null : booked,
        "is_in_cart": isInCart == null ? null : isInCart,
        "group": group == null ? null : group,
        "private": private == null ? null : private,
        "semi_private": semiPrivate == null ? null : semiPrivate,
        "dates": dates == null
            ? null
            : List<dynamic>.from(dates!.map((x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "min_child_age": minChildAge == null ? null : minChildAge,
        "max_child_age": maxChildAge == null ? null : maxChildAge,
        "mo": mo == null ? null : mo,
        "tu": tu == null ? null : tu,
        "we": we == null ? null : we,
        "th": th == null ? null : th,
        "fr": fr == null ? null : fr,
        "sa": sa == null ? null : sa,
        "su": su == null ? null : su,
      };
}
