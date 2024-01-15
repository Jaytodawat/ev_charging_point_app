
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_charging_point_app/core.exceptions/failure.dart';

import '../models/station_model.dart';

class StationDataSource {
  final FirebaseFirestore _firebaseFirestore;

  StationDataSource(this._firebaseFirestore);

  Future<List<StationModel>> getStations() async{

    try {

      // Access the collection named 'stations'
      CollectionReference stationsCollection = _firebaseFirestore.collection('stations');

      // Get documents from the 'stations' collection
      QuerySnapshot querySnapshot = await stationsCollection.orderBy('sid').get();

      // Convert each document to a StationModel object
      List<StationModel> stations = querySnapshot.docs
          .map((doc) => StationModel.fromFirestore(doc))
          .toList();

      return stations;
    } catch (error) {
      return [];
    }
  }

}
