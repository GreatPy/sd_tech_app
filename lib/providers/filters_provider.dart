import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sd_tech/providers/typed_exams_provider.dart';
import 'package:sd_tech/models/enums/status.dart';
// import 'package:sd_tech/models/typed_exams.dart';
// import 'package:sd_tech/models/enums/status.dart';
// import 'package:sd_tech/models/typed_exam.dart';
// import 'package:meals/providers/meal_provider.dart';

class FiltersNotifier extends StateNotifier<Map<Status, bool>> {
  //Initialisation
  FiltersNotifier()
      : super({
          Status.cancelByHost: false,
          Status.doesnTWant: false,
          Status.noShow: false,
          Status.lateCancelation: false,
          Status.timelyCancelation: false,
          Status.conducted: false,
          Status.scheduled: false,
          Status.toBeScheduled: false,
        });

  //Update methods (always REPLACE, never MUTATE)
  void setFilter(Status filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    }; // state hold data's value
  }

  // void setFilters(Map<Status, bool> chosenFilters) {
  //   state = chosenFilters;
  // }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Status, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredTypedExamsProvider = Provider((ref) {
  final typedExams = ref.watch(allSigngleTypedExamsProvider);
  final activeFilters = ref.watch(filtersProvider);
  var result = typedExams.where((typedExam) {
    if (activeFilters[Status.cancelByHost]! &&
        typedExam.roughExam.status == Status.cancelByHost) {
      return true;
    }
    if (activeFilters[Status.doesnTWant]! &&
        typedExam.roughExam.status == Status.doesnTWant) {
      return true;
    }
    if (activeFilters[Status.noShow]! &&
        typedExam.roughExam.status == Status.noShow) {
      return true;
    }
    if (activeFilters[Status.lateCancelation]! &&
        typedExam.roughExam.status == Status.lateCancelation) {
      return true;
    }
    if (activeFilters[Status.timelyCancelation]! &&
        typedExam.roughExam.status == Status.timelyCancelation) {
      return true;
    }
    if (activeFilters[Status.conducted]! &&
        typedExam.roughExam.status == Status.conducted) {
      return true;
    }
    if (activeFilters[Status.scheduled]! &&
        typedExam.roughExam.status == Status.scheduled) {
      return true;
    }
    if (activeFilters[Status.toBeScheduled]! &&
        typedExam.roughExam.status == Status.toBeScheduled) {
      return true;
    }

    return false;
  }).toList();
  if (activeFilters[Status.cancelByHost] == false &&
      activeFilters[Status.doesnTWant] == false &&
      activeFilters[Status.noShow] == false &&
      activeFilters[Status.timelyCancelation] == false &&
      activeFilters[Status.lateCancelation] == false &&
      activeFilters[Status.conducted] == false &&
      activeFilters[Status.scheduled] == false &&
      activeFilters[Status.toBeScheduled] == false) {
    result = typedExams;
  }
  return result;
});
