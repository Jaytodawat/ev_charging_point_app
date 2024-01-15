
import 'package:dartz/dartz.dart';

import 'package:ev_charging_point_app/core.exceptions/failure.dart';
import 'package:ev_charging_point_app/features/data/datasources/station_data_sources.dart';
import 'package:ev_charging_point_app/features/data/models/station_model.dart';

import 'package:ev_charging_point_app/features/domain/entities/station.dart';

import '../../domain/repositories/station_repository.dart';

class StationRepositoryImp implements StationRepository{

  final StationDataSource dataSource;

  StationRepositoryImp(this.dataSource);



  // @override
  // Future<bool> changeChargingStatus(int index) async {
  //   return dataSource.changeChargingStatus(index);
  // }

  @override
  Future<Either<Failure, List<Station>>> getStations() async{
    try{
    final stationModels = await dataSource.getStations();
    List<Station> res = stationModels.map((model) => model.toEntity()).toList();
    return Right(res);
    } catch(e){
      return Left(SomeSpecificError(e.toString()));
    }
  }
  //
  // @override
  // Future<bool> changeLikeStatus(int index) async{
  //   return dataSource.changeChargingStatus(index);
  // }

  @override
  Future<void> addStation(Station station) async {
    StationModel stationModel = StationModel.fromEntity(station);
    dataSource.addStation(stationModel);
  }}