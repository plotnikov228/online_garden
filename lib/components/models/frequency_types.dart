import 'package:json_annotation/json_annotation.dart';

part 'frequency_types.g.dart';

abstract class FrequencyTypes {
  final text = '';
  final bool repeat = false;

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class OnceADay extends FrequencyTypes {
  final DateTime referencePoint;
  final DateTime endPoint;
  @override
  final bool repeat;
  @override
  final text = 'once a day';

  OnceADay(
      {required this.referencePoint,
      required this.endPoint,
      required this.repeat});

  @override
  Map<String, dynamic> toJson() => _$OnceADayToJson(this);

  @override
  factory OnceADay.fromJson(Map<String, dynamic> json) {
    return _$OnceADayFromJson(json);
  }
}

@JsonSerializable()
class OnceAWeek extends FrequencyTypes {
  final DateTime referencePoint;
  final DateTime endPoint;
  final int day;
  final bool repeat;
  @override
  final text = 'once a week';

  OnceAWeek(
      {required this.referencePoint,
      required this.endPoint,
      required this.day,
      required this.repeat});

  @override
  Map<String, dynamic> toJson() => _$OnceAWeekToJson(this);

  @override
  factory OnceAWeek.fromJson(Map<String, dynamic> json) {
    return _$OnceAWeekFromJson(json);
  }
}

@JsonSerializable()
class OnceAFewWeeks extends FrequencyTypes {
  final DateTime referencePoint;
  final DateTime endPoint;
  final int weeksQuantity;
  final int day;
  final bool repeat;
  @override
  final text = 'once a few weeks';

  OnceAFewWeeks(
      {required this.referencePoint,
      required this.endPoint,
      required this.day,
      required this.repeat,
      required this.weeksQuantity});

  @override
  Map<String, dynamic> toJson() => _$OnceAFewWeeksToJson(this);

  @override
  factory OnceAFewWeeks.fromJson(Map<String, dynamic> json) {
    return _$OnceAFewWeeksFromJson(json);
  }
}

@JsonSerializable()
class OnceAFewMonths extends FrequencyTypes {
  final DateTime referencePoint;
  final DateTime endPoint;
  final int monthsQuantity;
  final bool repeat;
  @override
  final text = 'once a few months';

  OnceAFewMonths(
      {required this.referencePoint,
      required this.endPoint,
      required this.monthsQuantity,
      required this.repeat});

  @override
  Map<String, dynamic> toJson() => _$OnceAFewMonthsToJson(this);

  @override
  factory OnceAFewMonths.fromJson(Map<String, dynamic> json) {
    return _$OnceAFewMonthsFromJson(json);
  }
}

@JsonSerializable()
class OnConcreteDays extends FrequencyTypes {
  final DateTime referencePoint;
  final DateTime endPoint;
  final List<int> days;
  final bool repeat;
  @override
  final text = 'on concrete days in a week';

  OnConcreteDays(
      {required this.referencePoint,
      required this.endPoint,
      required this.days,
      required this.repeat});

  @override
  Map<String, dynamic> toJson() => _$OnConcreteDaysToJson(this);

  @override
  factory OnConcreteDays.fromJson(Map<String, dynamic> json) {
    return _$OnConcreteDaysFromJson(json);
  }
}

@JsonSerializable()
class OnConcreteDate extends FrequencyTypes {
  final DateTime endPoint;
  @override
  final text = 'on concrete date';

  OnConcreteDate({required this.endPoint});

  @override
  Map<String, dynamic> toJson() => _$OnConcreteDateToJson(this);

  @override
  factory OnConcreteDate.fromJson(Map<String, dynamic> json) {
    return _$OnConcreteDateFromJson(json);
  }
}
