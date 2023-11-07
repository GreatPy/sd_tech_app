import 'package:sd_tech/models/pg.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/data/dummy_costumer.dart';

Pg pg1 = Pg(
  id: 1,
  customer: costumer1,
  status: Status.toBeScheduled,
  deliveryDate: null,
  techId: 1,
  doctorId: 1,
  createdAt: DateTime(2023),
);
