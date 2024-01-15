import 'package:ev_charging_point_app/features/presentation/providers/station_provider.dart';
import 'package:ev_charging_point_app/features/presentation/screens/station_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/station_model.dart';
import '../../domain/entities/station.dart';
import '../../../constants.dart';

class StationCard extends ConsumerWidget {
  final int index;
  final Station station;

  const StationCard(this.index, {super.key, required this.station});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final chargingStatus = ref.watch(chargingStatusProvider1);

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Material(
          color: Colors.white,
          elevation: 3,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      child: Image(
                        image: NetworkImage(station.tileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        station.id,
                        style: kSubTextStyle.copyWith(
                            color: Colors.grey, fontSize: 10),
                      ),
                      Text(
                        station.name,
                        style: kSubTextStyle1.copyWith(fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            '${station.shortAddress} ',
                            style: kSubTextStyle.copyWith(
                                color: Colors.grey.shade700, fontSize: 10),
                          ),
                          Icon(
                            Icons.circle,
                            size: 5,
                            color: Colors.grey.shade700,
                          ),
                          Text(
                            ' ${station.distance} mil',
                            style: kSubTextStyle.copyWith(
                                color: Colors.grey.shade700, fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Type ${station.type} ',
                                style: kSubTextStyle.copyWith(
                                    color: Colors.grey.shade700, fontSize: 10),
                              ),
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey.shade700,
                              ),
                              Text(
                                ' ${station.power}kw',
                                style: kSubTextStyle.copyWith(
                                    color: Colors.grey.shade700, fontSize: 10),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: station.isAvailable
                                  ? Colors.green.shade400
                                  : Colors.yellowAccent.shade700,
                            ),
                            child: Text(
                              station.isAvailable
                                  ? 'Available'
                                  : 'Charging',
                              style: kSubTextStyle.copyWith(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => StationDetailScreen(station: station, stationIndex: index, )));
      },
    );
  }
}
