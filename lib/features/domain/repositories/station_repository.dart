import 'package:dartz/dartz.dart';
import 'package:ev_charging_point_app/core.exceptions/failure.dart';
import 'package:ev_charging_point_app/features/domain/entities/station.dart';

abstract class StationRepository {
  Future<Either<Failure, List<Station>>> getStations();
}
