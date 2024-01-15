
import '../../data/models/station_model.dart';

class Station {
  final String id;
  final String name;
  final int type;
  final bool isAvailable;
  final String shortAddress;
  final String address;
  final String about;
  final int likeCount;
  final int power;
  final double price;
  final String headingImage;
  final String tileImage;
  final double distance;
  final bool isLiked;

  Station({
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
}

// Station newStation1 = Station(
//     id: "EVEE-001",
//     name: "Novotel Hotel",
//     type: 2,
//     status: ChargingStatus.available,
//     address: '16 Dawson Street, New Plymouth Central, New Plymouth 4310, USA',
//     about:
//         'Welcome to PowerCharge Hub - your gateway to seamless electric mobility! Our state-of-the-art EV charging station, known as the EcoCharge Oasis, is designed to revolutionize your charging experience. Equipped with cutting-edge technology, the station features fast-charging capabilities to get you back on the road in no time. With a sleek and eco-friendly design, EcoCharge Oasis harmonizes with the environment, providing a sustainable charging solution',
//     likeCount: 30,
//     power: 100,
//     price: 4.5,
//     headingImage:
//         'https://images.unsplash.com/photo-1615829386703-e2bb66a7cb7d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//     tileImage:
//         'https://images.unsplash.com/photo-1615829386703-e2bb66a7cb7d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//     distance: 1.4,
//     shortAddress: 'New Plymouth 4310',
//     likeStatus: LikeStatus.dislike);
//
// Station newStation2 = Station(
//     id: "EVEE-002",
//     name: "Westown Parking",
//     type: 2,
//     status: ChargingStatus.charging,
//     address: '16 Dawson Street, New Plymouth Central, New Plymouth 4310, USA',
//     about:
//         'Welcome to PowerCharge Hub - your gateway to seamless electric mobility! Our state-of-the-art EV charging station, known as the EcoCharge Oasis, is designed to revolutionize your charging experience. Equipped with cutting-edge technology, the station features fast-charging capabilities to get you back on the road in no time. With a sleek and eco-friendly design, EcoCharge Oasis harmonizes with the environment, providing a sustainable charging solution',
//     likeCount: 30,
//     power: 100,
//     price: 4.5,
//     headingImage:
//         'https://images.unsplash.com/photo-1567409378873-888d6fa7debc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//     tileImage:
//         'https://images.unsplash.com/photo-1567409378873-888d6fa7debc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//     distance: 1.4,
//     shortAddress: 'New Plymouth 4310',
//     likeStatus: LikeStatus.dislike);
//
// Station newStation3 = Station(
//     id: "EVEE-003",
//     name: "BrookLand Hill",
//     type: 2,
//     status: ChargingStatus.available,
//     address: '16 Dawson Street, New Plymouth Central, New Plymouth 4310, USA',
//     about:
//         'Welcome to PowerCharge Hub - your gateway to seamless electric mobility! Our state-of-the-art EV charging station, known as the EcoCharge Oasis, is designed to revolutionize your charging experience. Equipped with cutting-edge technology, the station features fast-charging capabilities to get you back on the road in no time. With a sleek and eco-friendly design, EcoCharge Oasis harmonizes with the environment, providing a sustainable charging solution',
//     likeCount: 30,
//     power: 100,
//     price: 4.5,
//     headingImage:
//         'https://images.unsplash.com/photo-1617886322009-e02db73a70ee?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//     tileImage:
//         'https://images.unsplash.com/photo-1617886322009-e02db73a70ee?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//     distance: 1.4,
//     shortAddress: 'New Plymouth 4310',
//     likeStatus: LikeStatus.dislike);
//
// final List<Station> stationList = [
//   newStation1,
//   newStation2,
//   newStation3,
//   newStation1,
//   newStation2,
//   newStation3
// ];
