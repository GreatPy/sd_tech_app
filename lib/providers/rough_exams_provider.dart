import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sd_tech/data/dummy_pg.dart';
import 'package:sd_tech/data/dummy_psg.dart';
import 'package:sd_tech/models/rough_exam.dart';

class PgNotifier extends StateNotifier<List<RoughExam>> {
  //Initialisation
  PgNotifier() : super(pgs);
}

class PsgNotifier extends StateNotifier<List<RoughExam>> {
  //Initialisation
  PsgNotifier() : super(psgs);
}

final pgProvider =
    StateNotifierProvider<PgNotifier, List<RoughExam>>((ref) => PgNotifier());
final psgProvider =
    StateNotifierProvider<PsgNotifier, List<RoughExam>>((ref) => PsgNotifier());
