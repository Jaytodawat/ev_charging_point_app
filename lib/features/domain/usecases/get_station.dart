

import 'package:dartz/dartz.dart';
import 'package:ev_charging_point_app/features/domain/entities/station.dart';
import 'package:ev_charging_point_app/features/domain/repositories/station_repository.dart';

import '../../../core.exceptions/failure.dart';

class GetStations{
  final StationRepository repository;

  GetStations(this.repository);

  Future<Either<Failure, List<Station>>> call(){
    return repository.getStations();
  }

}