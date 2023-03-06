// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:online_garden/components/extensions/days.dart';
import 'package:online_garden/components/extensions/frequency_types.dart';
import 'package:online_garden/components/extensions/task_types.dart';
import 'package:online_garden/components/models/frequency_types.dart';
import 'package:online_garden/components/models/task_types.dart';

void main() {
  group('Testing extensions', (){
    test('test extension <DaysInString>', () {
      var day = DateTime.monday.dayInText();
      expect(day, 'Monday');
      day = DateTime.sunday.dayInText();
      expect(day, 'Sunday');
    });
    test('test extensions <SearchTaskTypes>', () {
      Watering taskType = Watering();
      Watering taskTypeWithExtension = 'Watering'.stringInTaskTypes();
      expect(taskType.text, taskTypeWithExtension.text);
    });
    test('test extensions <SearchFrequencyTypes>', () {
      OnceADay onceADay = OnceADay(referencePoint: DateTime.now(), endPoint: DateTime.now(), repeat: false);
      OnceADay onceADayWithExtension = onceADay.toJson().mapInFrequencyTypes();
      expect(onceADay.text, onceADayWithExtension.text);
    });
  });
}
