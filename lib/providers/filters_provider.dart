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

  void setFilters(Map<Status, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Status, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredTypedExams = Provider((ref) {
  final typedExams = ref.watch(allSigngleTypedExamsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return typedExams.where((typedExam) {
    if (activeFilters[Status.cancelByHost]! &&
        typedExam.roughExam.status == Status.cancelByHost) {
      return false;
    }
    if (activeFilters[Status.doesnTWant]! &&
        typedExam.roughExam.status == Status.doesnTWant) {
      return false;
    }
    if (activeFilters[Status.noShow]! &&
        typedExam.roughExam.status == Status.noShow) {
      return false;
    }
    if (activeFilters[Status.lateCancelation]! &&
        typedExam.roughExam.status == Status.lateCancelation) {
      return false;
    }
    if (activeFilters[Status.timelyCancelation]! &&
        typedExam.roughExam.status == Status.timelyCancelation) {
      return false;
    }
    if (activeFilters[Status.conducted]! &&
        typedExam.roughExam.status == Status.conducted) {
      return false;
    }
    if (activeFilters[Status.scheduled]! &&
        typedExam.roughExam.status == Status.scheduled) {
      return false;
    }
    if (activeFilters[Status.toBeScheduled]! &&
        typedExam.roughExam.status == Status.toBeScheduled) {
      return false;
    }

    return true;
  }).toList();
});
