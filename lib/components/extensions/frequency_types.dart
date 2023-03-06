import 'package:online_garden/components/models/frequency_types.dart';

extension SearchFrequencyTypes on Map<String, dynamic> {
  mapInFrequencyTypes () {
    switch(this['text'] as String){
      case 'once a day':
        return OnceADay.fromJson(this);
      case 'once a week':
        return OnceAWeek.fromJson(this);
      case 'on concrete days in a week':
        return OnConcreteDays.fromJson(this);
      case 'once a few months':
        return OnceAFewMonths.fromJson(this);
      case 'on concrete date':
        return OnConcreteDate.fromJson(this);
      default:
        return OnceAFewWeeks.fromJson(this);
    }
  }
}