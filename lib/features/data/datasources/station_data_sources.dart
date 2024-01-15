
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

import '../models/station_model.dart';
import '../models/user_model.dart';

class StationDataSource {
  // final Box<StationModel> stationBox;

  final FirebaseFirestore _firebaseFirestore;

  StationDataSource(this._firebaseFirestore);


  


  Future<List<StationModel>> getStations() async{

    // List<StationModel> stationList = [];
    // final collection = _firebaseFirestore.collection('stations');
    // QuerySnapshot rec = await collection.get();
    // return rec.docs.map((doc) => StationModel.fromFirestore(doc)).toList();

    try {

      // Access the collection named 'stations'
      CollectionReference stationsCollection = _firebaseFirestore.collection('stations');

      // Get documents from the 'stations' collection
      QuerySnapshot querySnapshot = await stationsCollection.get();

      // Convert each document to a StationModel object
      print(querySnapshot.size);
      List<StationModel> stations = querySnapshot.docs
          .map((doc) => StationModel.fromFirestore(doc))
          .toList();

      return stations;
    } catch (error) {
      // Handle errors here
      print('Error fetching data from Firestore: $error');
      return [];
    }
  }

  // bool changeLikeStatus(int index) {
  //   StationModel? station = stationBox.getAt(index);
  //   if (station?.isLiked == true) {
  //     station?.likeCount--;
  //     station?.isLiked = false;
  //   } else {
  //     station?.likeCount++;
  //     station?.isLiked = true;
  //   }
  //
  //   stationBox.putAt(index, station!);
  //   return station.isLiked;
  // }
  //
  // bool changeChargingStatus(int index) {
  //   StationModel? station = stationBox.getAt(index);
  //   if (station?.isAvailable == true) {
  //     station?.isAvailable = false;
  //   } else {
  //     station?.isAvailable = true;
  //   }
  //
  //   stationBox.putAt(index, station!);
  //   return station.isAvailable;
  // }

  addStation(StationModel stationModel) async{
    // stationBox.add(stationModel);
    try {

      // Convert StationModel object to a map
      Map<String, dynamic> data = stationModel.toMap();

      // Add data to Firestore
      await _firebaseFirestore.collection('stations').add(data);
    } catch (error) {
      // Handle errors here
      print('Error adding data to Firestore: $error');
    }
  }
}
