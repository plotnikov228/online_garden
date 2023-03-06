// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequency_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnceADay _$OnceADayFromJson(Map<String, dynamic> json) => OnceADay(
      referencePoint: DateTime.parse(json['referencePoint'] as String),
      endPoint: DateTime.parse(json['endPoint'] as String),
      repeat: json['repeat'] as bool,
    );

Map<String, dynamic> _$OnceADayToJson(OnceADay instance) => <String, dynamic>{
      'referencePoint': instance.referencePoint.toIso8601String(),
      'endPoint': instance.endPoint.toIso8601String(),
      'repeat': instance.repeat,
      'text': instance.text
    };

OnceAWeek _$OnceAWeekFromJson(Map<String, dynamic> json) => OnceAWeek(
      referencePoint: DateTime.parse(json['referencePoint'] as String),
      endPoint: DateTime.parse(json['endPoint'] as String),
      day: json['day'] as int,
      repeat: json['repeat'] as bool,
    );

Map<String, dynamic> _$OnceAWeekToJson(OnceAWeek instance) => <String, dynamic>{
      'referencePoint': instance.referencePoint.toIso8601String(),
      'endPoint': instance.endPoint.toIso8601String(),
      'day': instance.day,
      'repeat': instance.repeat,
      'text': instance.text
    };

OnceAFewWeeks _$OnceAFewWeeksFromJson(Map<String, dynamic> json) =>
    OnceAFewWeeks(
      referencePoint: DateTime.parse(json['referencePoint'] as String),
      endPoint: DateTime.parse(json['endPoint'] as String),
      day: json['day'] as int,
      repeat: json['repeat'] as bool,
      weeksQuantity: json['weeksQuantity'] as int,
    );

Map<String, dynamic> _$OnceAFewWeeksToJson(OnceAFewWeeks instance) =>
    <String, dynamic>{
      'referencePoint': instance.referencePoint.toIso8601String(),
      'endPoint': instance.endPoint.toIso8601String(),
      'weeksQuantity': instance.weeksQuantity,
      'day': instance.day,
      'repeat': instance.repeat,
      'text': instance.text
    };

OnceAFewMonths _$OnceAFewMonthsFromJson(Map<String, dynamic> json) =>
    OnceAFewMonths(
      referencePoint: DateTime.parse(json['referencePoint'] as String),
      endPoint: DateTime.parse(json['endPoint'] as String),
      monthsQuantity: json['monthsQuantity'] as int,
      repeat: json['repeat'] as bool,
    );

Map<String, dynamic> _$OnceAFewMonthsToJson(OnceAFewMonths instance) =>
    <String, dynamic>{
      'referencePoint': instance.referencePoint.toIso8601String(),
      'endPoint': instance.endPoint.toIso8601String(),
      'monthsQuantity': instance.monthsQuantity,
      'repeat': instance.repeat,
      'text': instance.text
    };

OnConcreteDays _$OnConcreteDaysFromJson(Map<String, dynamic> json) =>
    OnConcreteDays(
      referencePoint: DateTime.parse(json['referencePoint'] as String),
      endPoint: DateTime.parse(json['endPoint'] as String),
      days: (json['days'] as List<dynamic>).map((e) => e as int).toList(),
      repeat: json['repeat'] as bool,
    );

Map<String, dynamic> _$OnConcreteDaysToJson(OnConcreteDays instance) =>
    <String, dynamic>{
      'referencePoint': instance.referencePoint.toIso8601String(),
      'endPoint': instance.endPoint.toIso8601String(),
      'days': instance.days,
      'repeat': instance.repeat,
      'text': instance.text
    };

OnConcreteDate _$OnConcreteDateFromJson(Map<String, dynamic> json) =>
    OnConcreteDate(
      endPoint: DateTime.parse(json['endPoint'] as String),
    );

Map<String, dynamic> _$OnConcreteDateToJson(OnConcreteDate instance) =>
    <String, dynamic>{
      'endPoint': instance.endPoint.toIso8601String(),
      'text': instance.text
    };
