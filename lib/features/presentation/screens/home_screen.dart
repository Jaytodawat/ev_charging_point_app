import 'package:ev_charging_point_app/constants.dart';
import 'package:ev_charging_point_app/features/presentation/widgets/search_field.dart';
import 'package:ev_charging_point_app/features/presentation/widgets/station_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/station_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(stationListNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(onSubmit: (message) {}),
            const SizedBox(
              height: 20,
            ),
            Text(
              'NearBy chargers (${list.length})',
              style: kSubTextStyle1.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final station = list[index];
                  return StationCard(index, station: station);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
