
import 'package:ev_charging_point_app/features/domain/entities/station.dart';
import 'package:ev_charging_point_app/features/presentation/providers/station_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/station_model.dart';


class AddStation extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController(text: 'EVEE-001');
  final _nameController = TextEditingController(text: "Novotel Hotel");
  final _addressController = TextEditingController(text: '16 Dawson Street, New Plymouth Central, New Plymouth 4310, USA');
  final _imageController = TextEditingController(text: 'https://images.unsplash.com/photo-1615829386703-e2bb66a7cb7d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

  AddStation({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _idController,
            decoration: const InputDecoration(labelText: 'Id'),
          ),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(labelText: 'Location'),
          ),
          TextFormField(
            controller: _imageController,
            decoration: const InputDecoration(labelText: 'Photo'),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newStation = Station(
                      id: "EVEE-001",
                      name: "Novotel Hotel",
                      type: 2,
                      isAvailable:false,
                      address: '16 Dawson Street, New Plymouth Central, New Plymouth 4310, USA',
                      about:
                      'Welcome to PowerCharge Hub - your gateway to seamless electric mobility! Our state-of-the-art EV charging station, known as the EcoCharge Oasis, is designed to revolutionize your charging experience. Equipped with cutting-edge technology, the station features fast-charging capabilities to get you back on the road in no time. With a sleek and eco-friendly design, EcoCharge Oasis harmonizes with the environment, providing a sustainable charging solution',
                      likeCount: 30,
                      power: 100,
                      price: 4.5,
                      headingImage:
                      'https://images.unsplash.com/photo-1615829386703-e2bb66a7cb7d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      tileImage:
                      'https://images.unsplash.com/photo-1615829386703-e2bb66a7cb7d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      distance: 1.4,
                      shortAddress: 'New Plymouth 4310',
                      isLiked: false);
                  ref.read(stationListNotifierProvider.notifier).addNewStation(newStation);
                  ref.read(stationListNotifierProvider.notifier).loadStations();
                  // ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
                  // ref.read(tripListNotifierProvider.notifier).loadTrips();
                }
              },
              child: const Text("Add  Trip")),
        ],
      ),
    );
  }
}
