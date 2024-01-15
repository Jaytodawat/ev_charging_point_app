import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/station.dart';

// part 'station_model.g.dart';
//
// @HiveType(typeId: 0)
class StationModel {
  // @HiveField(0)
  // final String id;
  // @HiveField(1)
  // final String name;
  // @HiveField(2)
  // final int type;
  // @HiveField(3)
  // bool isAvailable;
  // @HiveField(4)
  // final String shortAddress;
  // @HiveField(5)
  // final String address;
  // @HiveField(6)
  // final String about;
  // @HiveField(7)
  // int likeCount;
  // @HiveField(8)
  // final int power;
  // @HiveField(9)
  // final double price;
  // @HiveField(10)
  // final String headingImage;
  // @HiveField(11)
  // final String tileImage;
  // @HiveField(12)
  // final double distance;
  // @HiveField(13)
  // bool isLiked;

  late String id;
  late String name;
  late int type;
  late bool isAvailable;
  late String shortAddress;
  late String address;
  late String about;
  late int likeCount;
  late int power;
  late double price;
  late String headingImage;
  late String tileImage;
  late double distance;
  late bool isLiked;

  StationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.isAvailable,
    required this.shortAddress,
    required this.address,
    required this.about,
    required this.likeCount,
    required this.power,
    required this.price,
    required this.headingImage,
    required this.tileImage,
    required this.distance,
    required this.isLiked,
  });

  StationModel.fromMap(DocumentSnapshot data) {
    id = data["id"];
    name = data["name"];
    type = data["type"];
    isAvailable = data['isAvailable'];
    shortAddress = data['shortAddress'];
  }

  factory StationModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return StationModel(
      id: data['sid'],
      name: data['name'],
      type: data['type'],
      isAvailable: data['isAvailable'],
      shortAddress: data['shortAddress'],
      address: data['address'],
      about: data['about'],
      likeCount: data['likeCount'],
      power: data['power'],
      price: data['price'],
      headingImage: data['headingImage'],
      tileImage: data['tileImage'],
      distance: data['distance'],
      isLiked: data['isLiked'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sid':id,
      'name': name,
      'type': type,
      'isAvailable': isAvailable,
      'shortAddress': shortAddress,
      'address': address,
      'about': about,
      'likeCount': likeCount,
      'power': power,
      'price': price,
      'headingImage': headingImage,
      'tileImage': tileImage,
      'distance': distance,
      'isLiked': isLiked,
    };
  }


  factory StationModel.fromEntity(Station station) => StationModel(
        id: station.id,
        name: station.name,
        type: station.type,
        isAvailable: station.isAvailable,
        shortAddress: station.shortAddress,
        address: station.address,
        about: station.about,
        likeCount: station.likeCount,
        power: station.power,
        price: station.price,
        headingImage: station.headingImage,
        tileImage: station.tileImage,
        distance: station.distance,
        isLiked: station.isLiked,
      );

  Station toEntity() => Station(
        id: id,
        name: name,
        type: type,
        isAvailable: isAvailable,
        shortAddress: shortAddress,
        address: address,
        about: about,
        likeCount: likeCount,
        power: power,
        price: price,
        headingImage: headingImage,
        tileImage: tileImage,
        distance: distance,
        isLiked: isLiked,
      );
}

// @HiveType(typeId: 2)
// enum ChargingStatus{
//   @HiveField(0)
//   charging,
//   @HiveField(1)
//   available
// }
//
// @HiveType(typeId: 3)
// enum LikeStatus{
//   @HiveField(0)
//   liked,
//   @HiveField(1)
//   dislike
// }
