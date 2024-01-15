import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_charging_point_app/features/data/datasources/station_data_sources.dart';
import 'package:ev_charging_point_app/features/data/models/station_model.dart';
import 'package:ev_charging_point_app/features/data/repositories/station_repository_Impl.dart';
import 'package:ev_charging_point_app/features/domain/entities/station.dart';
import 'package:ev_charging_point_app/features/domain/repositories/station_repository.dart';
import 'package:ev_charging_point_app/features/domain/usecases/get_station.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../domain/usecases/add_station.dart';

final stationDataSourceProvider = Provider<StationDataSource>((ref) {
  return StationDataSource(FirebaseFirestore.instance);
});

final stationRepositoryProvider = Provider<StationRepository>((ref) {
  final dataSource = ref.read(stationDataSourceProvider);
  return StationRepositoryImp(dataSource);
});

final addStationProvider = Provider<AddStation>((ref) {
  final repository = ref.read(stationRepositoryProvider);
  return AddStation(repository);
});


final getStationsProvider = Provider<GetStations>((ref) {
  final repository = ref.read(stationRepositoryProvider);
  return GetStations(repository);
});



final stationListNotifierProvider =StateNotifierProvider<StationListNotifier, List<Station>>((ref){

final getStations =ref.read(getStationsProvider);
final addStation = ref.read(addStationProvider);
return StationListNotifier(getStations, addStation);

});

class StationListNotifier extends StateNotifier<List<Station>> {
  final GetStations _getStations;
  final AddStation _addStation;

  StationListNotifier(this._getStations, this._addStation,)
      : super([]);

  Future<void> addNewStation(Station station)async {
    await _addStation(station);
  }

  Future<void> loadStations()async {
    final stationsOrFailure = await _getStations();
    stationsOrFailure.fold((error) => state = [], (stations) => state = stations);
  }
}


// Future<void> changeChargingStatus(int index)async {
//   await _changeChargingStatus(index);
// }
//
// Future<void> changeLikeStatus(int index)async {
//   await _changeLikeStatus(index);
// }

// final chargingStatusProvider = Provider<ChangeChargingStatus>((ref) {
//   final repository = ref.read(stationRepositoryProvider);
//   return ChangeChargingStatus(repository);
// });
//
// final likeStatusProvider = Provider<ChangeLikeStatus>((ref) {
//   final repository = ref.read(stationRepositoryProvider);
//   return ChangeLikeStatus(repository);
// });
//
// final chargingStatusProvider1 = StateNotifierProvider<ChargingStatusNotifier, bool>((ref){
//     return ChargingStatusNotifier(ref.watch(stationRepositoryProvider));
// });
//
// class ChargingStatusNotifier extends StateNotifier<bool>{
//   final StationRepository repository;
//
//   ChargingStatusNotifier(this.repository) : super(false);
//
//   void toggleStatus(int index) async{
//     state = !state;
//     await repository.changeChargingStatus(index);
//
//   }
// }