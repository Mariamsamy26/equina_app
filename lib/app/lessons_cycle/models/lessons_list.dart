// To parse this JSON data, do
//
//     final LessonsList = LessonsListFromJson(jsonString);

import 'dart:convert';

LessonsList LessonsListFromJson(String str) =>
    LessonsList.fromJson(json.decode(str));

String LessonsListToJson(LessonsList data) => json.encode(data.toJson());

class LessonsList {
  int? status;
  List<Lesson>? lessons;

  LessonsList({this.status, this.lessons});

  factory LessonsList.fromJson(Map<String, dynamic> json) => LessonsList(
    status: json["status"],
    lessons:
        json["lessons"] == null
            ? []
            : List<Lesson>.from(
              json["lessons"]!.map((x) => Lesson.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "lessons":
        lessons == null
            ? []
            : List<dynamic>.from(lessons!.map((x) => x.toJson())),
  };
}

class Lesson {
  int? id;
  String? name;
  dynamic competenciesId;
  String? description;
  double? classDuration;
  int? categoryId;
  String? categoryName;
  double? minPax;
  double? maxPax;
  double? semiPrivateMinPax;
  double? semiPrivateMaxPax;
  double? privateMinPax;
  double? privateMaxPax;
  String? lessonDescription;
  double? numOfClasses;
  int? lessonLevel;
  bool? beginner;
  bool? intermediate;
  bool? advanced;
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
  String? startingDate;
  String? seasonStartingDate;
  String? seasonEndDate;
  String? tripStartingDate;
  String? tripEndDate;
  String? openLessonEndDate;
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
  bool? include1ClassPackage;
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
  bool? clubPromotion;
  double? additionalDiscount;
  double? additionalDiscountFixed;
  double? additionalDiscountPercentage;
  bool? equinaPromotion;
  bool? booked;
  String? lessonLevelString;
  String? lessonLevelFilter;
  List<String>? days;
  double? startingPrice;
  String? imageUrl;
  bool? group;
  bool? private;
  bool? semiPrivate;
  String? lessonCurrency;
  String? clubName;
  String? clubPhone;
  String? lat;
  String? long;
  String? clubAddress;
  double? clubRating;
  String? clubDescription;
  int? rangeOfPricesFrom;
  int? rangeOfPricesTo;
  int? horsesNumber;
  String? trainingTypes;
  String? specializedIn;
  String? lessontype;
  String? courseEndDate;
  //* //* //*
  double? startedFromCalculated;

  Lesson({
    this.startedFromCalculated,
    this.id,
    this.name,
    this.competenciesId,
    this.description,
    this.classDuration,
    this.categoryId,
    this.categoryName,
    this.minPax,
    this.maxPax,
    this.semiPrivateMinPax,
    this.semiPrivateMaxPax,
    this.privateMinPax,
    this.privateMaxPax,
    this.lessonDescription,
    this.numOfClasses,
    this.lessonLevel,
    this.beginner,
    this.intermediate,
    this.advanced,
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
    this.startingDate,
    this.seasonStartingDate,
    this.seasonEndDate,
    this.tripStartingDate,
    this.tripEndDate,
    this.openLessonEndDate,
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
    this.include1ClassPackage,
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
    this.clubPromotion,
    this.additionalDiscount,
    this.additionalDiscountFixed,
    this.additionalDiscountPercentage,
    this.equinaPromotion,
    this.booked,
    this.lessonLevelString,
    this.lessonLevelFilter,
    this.days,
    this.startingPrice,
    this.imageUrl,
    this.group,
    this.private,
    this.semiPrivate,
    this.lessonCurrency,
    this.clubName,
    this.clubPhone,
    this.lat,
    this.long,
    this.clubAddress,
    this.clubRating,
    this.clubDescription,
    this.rangeOfPricesFrom,
    this.rangeOfPricesTo,
    this.horsesNumber,
    this.trainingTypes,
    this.specializedIn,
    this.lessontype,
    this.courseEndDate,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json["id"],
    name: json["name"],
    competenciesId: json["competencies_id"],
    description: json["description"],
    classDuration: json["class_duration"]?.toDouble(),
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    minPax: json["min_pax"]?.toDouble(),
    maxPax: json["max_pax"]?.toDouble(),
    semiPrivateMinPax: json["semi_private_min_pax"]?.toDouble(),
    semiPrivateMaxPax: json["semi_private_max_pax"]?.toDouble(),
    privateMinPax: json["private_min_pax"]?.toDouble(),
    privateMaxPax: json["private_max_pax"]?.toDouble(),
    lessonDescription: json["lesson_description"],
    numOfClasses: json["num_of_classes"]?.toDouble(),
    lessonLevel: json["lesson_level"],
    beginner: json["beginner"],
    intermediate: json["intermediate"],
    advanced: json["advanced"],
    dbName: json["db_name"],
    rate: json["rate"],
    rateCount: json["rate_count"],
    discount: json["discount"]?.toDouble(),
    givePoints: json["give_points"],
    groupRedeemPoints: json["group_redeem_points"],
    privateRedeemPoints: json["private_redeem_points"],
    semiPrivateRedeemPoints: json["semi_private_redeem_points"],
    tripsHire: json["trips_hire"],
    fullClassesLesson: json["full_classes_lesson"],
    openClassesLesson: json["open_classes_lesson"],
    seasonalLesson: json["seasonal_lesson"],
    normalLesson: json["normal_lesson"],
    lessonRepetition: json["lesson_repetition"],
    groupActive: json["group_active"],
    privateActive: json["private_active"],
    semiPrivateActive: json["semi_private_active"],
    childGroup: json["child_group"],
    adultGroup: json["adult_group"],
    childPrivate: json["child_private"],
    adultPrivate: json["adult_private"],
    childSemiPrivate: json["child_semi_private"],
    adultSemiPrivate: json["adult_semi_private"],
    childOwnHorseGroup: json["child_own_horse_group"]?.toDouble(),
    childClubHorseGroup: json["child_club_horse_group"]?.toDouble(),
    childOwnHorsePrivate: json["child_own_horse_private"]?.toDouble(),
    childClubHorsePrivate: json["child_club_horse_private"]?.toDouble(),
    childOwnHorseSemiPrivate: json["child_own_horse_semi_private"]?.toDouble(),
    childClubHorseSemiPrivate:
        json["child_club_horse_semi_private"]?.toDouble(),
    adultOwnHorseGroup: json["adult_own_horse_group"]?.toDouble(),
    adultClubHorseGroup: json["adult_club_horse_group"]?.toDouble(),
    adultOwnHorsePrivate: json["adult_own_horse_private"]?.toDouble(),
    adultClubHorsePrivate: json["adult_club_horse_private"]?.toDouble(),
    adultOwnHorseSemiPrivate: json["adult_own_horse_semi_private"]?.toDouble(),
    adultClubHorseSemiPrivate:
        json["adult_club_horse_semi_private"]?.toDouble(),
    startingDate: json["starting_date"],
    seasonStartingDate: json["season_starting_date"],
    seasonEndDate: json["season_end_date"],
    tripStartingDate: json["trip_starting_date"],
    tripEndDate: json["trip_end_date"],
    openLessonEndDate: json["open_lesson_end_date"],
    tripmo: json["tripmo"],
    triptu: json["triptu"],
    tripwe: json["tripwe"],
    tripth: json["tripth"],
    tripfr: json["tripfr"],
    tripsa: json["tripsa"],
    tripsu: json["tripsu"],
    oneInterval: json["one_interval"],
    twoInterval: json["two_interval"],
    threeInterval: json["three_interval"],
    interval1FromTime: json["interval_1_from_time"],
    interval1ToTime: json["interval_1_to_time"],
    interval2FromTime: json["interval_2_from_time"],
    interval2ToTime: json["interval_2_to_time"],
    interval3FromTime: json["interval_3_from_time"],
    interval3ToTime: json["interval_3_to_time"],
    tripInterval1FromTime: json["trip_interval_1_from_time"],
    tripInterval1ToTime: json["trip_interval_1_to_time"],
    tripInterval2FromTime: json["trip_interval_2_from_time"],
    tripInterval2ToTime: json["trip_interval_2_to_time"],
    tripInterval3FromTime: json["trip_interval_3_from_time"],
    tripInterval3ToTime: json["trip_interval_3_to_time"],
    include1ClassPackage: json["include_1_class_package"],
    packageBuy1: json["package_buy_1"]?.toDouble(),
    packageBuy2: json["package_buy_2"]?.toDouble(),
    packageBuy3: json["package_buy_3"]?.toDouble(),
    packagePercentage1Discount:
        json["package_percentage_1_discount"]?.toDouble(),
    packageFixed1Discount: json["package_fixed_1_discount"]?.toDouble(),
    packagePoints1: json["package_points_1"]?.toDouble(),
    packagePercentage2Discount:
        json["package_percentage_2_discount"]?.toDouble(),
    packageFixed2Discount: json["package_fixed_2_discount"]?.toDouble(),
    packagePoints2: json["package_points_2"]?.toDouble(),
    packagePercentage3Discount:
        json["package_percentage_3_discount"]?.toDouble(),
    packageFixed3Discount: json["package_fixed_3_discount"]?.toDouble(),
    packagePoints3: json["package_points_3"]?.toDouble(),
    clubPromotion: json["club_promotion"],
    additionalDiscount: json["additional_discount"]?.toDouble(),
    additionalDiscountFixed: json["additional_discount_fixed"]?.toDouble(),
    additionalDiscountPercentage:
        json["additional_discount_percentage"]?.toDouble(),
    equinaPromotion: json["equina_promotion"],
    booked: json["booked"],
    lessonLevelString: json["lesson_level_string"],
    lessonLevelFilter: json["lesson_level_filter"],
    days:
        json["days"] == null
            ? []
            : List<String>.from(json["days"]!.map((x) => x)),
    startingPrice: json["starting_price"]?.toDouble(),
    imageUrl: json["image_url"],
    group: json["group"],
    private: json["private"],
    semiPrivate: json["semi_private"],
    lessonCurrency: json["lesson_currency"],
    clubName: json["club_name"],
    clubPhone: json["club_phone"],
    lat: json["lat"],
    long: json["long"],
    clubAddress: json["club_address"],
    clubRating: json["club_rating"]?.toDouble(),
    clubDescription: json["club_description"],
    rangeOfPricesFrom: json["range_of_prices_from"],
    rangeOfPricesTo: json["range_of_prices_to"],
    horsesNumber: json["horses_number"],
    trainingTypes: json["training_types"],
    specializedIn: json["specialized_in"],
    lessontype: json["lessontype"],
    courseEndDate: json["course_end_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "competencies_id": competenciesId,
    "description": description,
    "class_duration": classDuration,
    "category_id": categoryId,
    "category_name": categoryName,
    "min_pax": minPax,
    "max_pax": maxPax,
    "semi_private_min_pax": semiPrivateMinPax,
    "semi_private_max_pax": semiPrivateMaxPax,
    "private_min_pax": privateMinPax,
    "private_max_pax": privateMaxPax,
    "lesson_description": lessonDescription,
    "num_of_classes": numOfClasses,
    "lesson_level": lessonLevel,
    "beginner": beginner,
    "intermediate": intermediate,
    "advanced": advanced,
    "db_name": dbName,
    "rate": rate,
    "rate_count": rateCount,
    "discount": discount,
    "give_points": givePoints,
    "group_redeem_points": groupRedeemPoints,
    "private_redeem_points": privateRedeemPoints,
    "semi_private_redeem_points": semiPrivateRedeemPoints,
    "trips_hire": tripsHire,
    "full_classes_lesson": fullClassesLesson,
    "open_classes_lesson": openClassesLesson,
    "seasonal_lesson": seasonalLesson,
    "normal_lesson": normalLesson,
    "lesson_repetition": lessonRepetition,
    "group_active": groupActive,
    "private_active": privateActive,
    "semi_private_active": semiPrivateActive,
    "child_group": childGroup,
    "adult_group": adultGroup,
    "child_private": childPrivate,
    "adult_private": adultPrivate,
    "child_semi_private": childSemiPrivate,
    "adult_semi_private": adultSemiPrivate,
    "child_own_horse_group": childOwnHorseGroup,
    "child_club_horse_group": childClubHorseGroup,
    "child_own_horse_private": childOwnHorsePrivate,
    "child_club_horse_private": childClubHorsePrivate,
    "child_own_horse_semi_private": childOwnHorseSemiPrivate,
    "child_club_horse_semi_private": childClubHorseSemiPrivate,
    "adult_own_horse_group": adultOwnHorseGroup,
    "adult_club_horse_group": adultClubHorseGroup,
    "adult_own_horse_private": adultOwnHorsePrivate,
    "adult_club_horse_private": adultClubHorsePrivate,
    "adult_own_horse_semi_private": adultOwnHorseSemiPrivate,
    "adult_club_horse_semi_private": adultClubHorseSemiPrivate,
    "starting_date": startingDate,
    "season_starting_date": seasonStartingDate,
    "season_end_date": seasonEndDate,
    "trip_starting_date": tripStartingDate,
    "trip_end_date": tripEndDate,
    "open_lesson_end_date": openLessonEndDate,
    "tripmo": tripmo,
    "triptu": triptu,
    "tripwe": tripwe,
    "tripth": tripth,
    "tripfr": tripfr,
    "tripsa": tripsa,
    "tripsu": tripsu,
    "one_interval": oneInterval,
    "two_interval": twoInterval,
    "three_interval": threeInterval,
    "interval_1_from_time": interval1FromTime,
    "interval_1_to_time": interval1ToTime,
    "interval_2_from_time": interval2FromTime,
    "interval_2_to_time": interval2ToTime,
    "interval_3_from_time": interval3FromTime,
    "interval_3_to_time": interval3ToTime,
    "trip_interval_1_from_time": tripInterval1FromTime,
    "trip_interval_1_to_time": tripInterval1ToTime,
    "trip_interval_2_from_time": tripInterval2FromTime,
    "trip_interval_2_to_time": tripInterval2ToTime,
    "trip_interval_3_from_time": tripInterval3FromTime,
    "trip_interval_3_to_time": tripInterval3ToTime,
    "include_1_class_package": include1ClassPackage,
    "package_buy_1": packageBuy1,
    "package_buy_2": packageBuy2,
    "package_buy_3": packageBuy3,
    "package_percentage_1_discount": packagePercentage1Discount,
    "package_fixed_1_discount": packageFixed1Discount,
    "package_points_1": packagePoints1,
    "package_percentage_2_discount": packagePercentage2Discount,
    "package_fixed_2_discount": packageFixed2Discount,
    "package_points_2": packagePoints2,
    "package_percentage_3_discount": packagePercentage3Discount,
    "package_fixed_3_discount": packageFixed3Discount,
    "package_points_3": packagePoints3,
    "club_promotion": clubPromotion,
    "additional_discount": additionalDiscount,
    "additional_discount_fixed": additionalDiscountFixed,
    "additional_discount_percentage": additionalDiscountPercentage,
    "equina_promotion": equinaPromotion,
    "booked": booked,
    "lesson_level_string": lessonLevelString,
    "lesson_level_filter": lessonLevelFilter,
    "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x)),
    "starting_price": startingPrice,
    "image_url": imageUrl,
    "group": group,
    "private": private,
    "semi_private": semiPrivate,
    "lesson_currency": lessonCurrency,
    "club_name": clubName,
    "club_phone": clubPhone,
    "lat": lat,
    "long": long,
    "club_address": clubAddress,
    "club_rating": clubRating,
    "club_description": clubDescription,
    "range_of_prices_from": rangeOfPricesFrom,
    "range_of_prices_to": rangeOfPricesTo,
    "horses_number": horsesNumber,
    "training_types": trainingTypes,
    "specialized_in": specializedIn,
    "lessontype": lessontype,
    "course_end_date": courseEndDate,
  };
}
