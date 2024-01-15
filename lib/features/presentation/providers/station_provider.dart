import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_charging_point_app/features/data/datasources/station_data_sources.dart';
import 'package:ev_charging_point_app/features/data/repositories/station_repository_Impl.dart';
import 'package:ev_charging_point_app/features/domain/entities/station.dart';
import 'package:ev_charging_point_app/features/domain/repositories/station_repository.dart';
import 'package:ev_charging_point_app/features/domain/usecases/get_station.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stationDataSourceProvider = Provider<StationDataSource>((ref) {
  return StationDataSource(FirebaseFirestore.instance);
});

final stationRepositoryProvider = Provider<StationRepository>((ref) {
  final dataSource = ref.read(stationDataSourceProvider);
  return StationRepositoryImp(dataSource);
});

final getStationsProvider = Provider<GetStations>((ref) {
  final repository = ref.read(stationRepositoryProvider);
  return GetStations(repository);
});

final stationListNotifierProvider =
    StateNotifierProvider<StationListNotifier, List<Station>>((ref) {
  final getStations = ref.read(getStationsProvider);
  return StationListNotifier(getStations);
});

class StationListNotifier extends StateNotifier<List<Station>> {
  final GetStations _getStations;
  StationListNotifier(this._getStations) : super([]);

  Future<void> loadStations() async {
    final stationsOrFailure = await _getStations();
    stationsOrFailure.fold(
        (error) => state = [], (stations) => state = stations);
  }
}
