

import 'package:ev_charging_point_app/features/domain/entities/station.dart';

import '../repositories/station_repository.dart';

class AddStation{
  final StationRepository repository;

  AddStation(this.repository);

  Future<void> call(Station station){
    return repository.addStation(station);
  }

}