import 'package:ev_charging_point_app/features/domain/entities/station.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/icon_box.dart';

class StationDetailScreen extends ConsumerWidget {
  final int stationIndex;
  final Station station;

  const StationDetailScreen(
      {super.key, required this.stationIndex, required this.station});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final status1 = ref.watch(chargingStatusProvider1);
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconBox(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icons.arrow_back,
                            boxColor: Colors.black,
                            iconColor: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            station.id,
                            style: kSubTextStyle,
                          ),
                        ],
                      ),
                      RoundedSubButton(onPressed: () {}, text: 'Help'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(station.headingImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.ev_station),
                          Text(
                            ' ${station.id}',
                            style: kSubTextStyle.copyWith(color: Colors.grey),
                            // softWrap: false,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            station.name,
                            style: kSubTextStyle1.copyWith(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on),
                          Expanded(
                            child: Text(
                              ' ${station.address}',
                              softWrap: true,
                              maxLines: 2,
                              style: kSubTextStyle.copyWith(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.watch_later),
                          Row(
                            children: [
                              Text(
                                ' Open ',
                                style: kSubTextStyle.copyWith(
                                    color: Colors.green.shade700),
                              ),
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.green.shade700,
                              ),
                              Text(
                                ' 24 Hrs',
                                style: kSubTextStyle.copyWith(
                                    color: Colors.green.shade700),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.dataset_rounded),
                          Row(
                            children: [
                              Text(
                                ' Type ${station.type} ',
                                style:
                                    kSubTextStyle.copyWith(color: Colors.grey),
                              ),
                              const Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey,
                              ),
                              Text(
                                ' ${station.power}kW   ',
                                style:
                                    kSubTextStyle.copyWith(color: Colors.grey),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  color: station.isAvailable
                                      ? Colors.green.shade400
                                      : Colors.yellowAccent.shade700,
                                ),
                                child: Text(
                                  station.isAvailable
                                      ? 'Available'
                                      : 'Charging',
                                  style: kSubTextStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '\$${station.price}/kW',
                        style: kSubTextStyle1.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(Icons.navigation_outlined),
                                  Text(
                                    'Navigate',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(Icons.share),
                                  Text('Share', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "About",
                        style: kSubTextStyle1.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        station.about,
                        softWrap: true,
                        style: kSubTextStyle.copyWith(
                            fontSize: 12, color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RoundedButton(
                  text: "Charge Here",
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
