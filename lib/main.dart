import 'package:ev_charging_point_app/features/presentation/providers/auth_checker.dart';
import 'package:ev_charging_point_app/features/presentation/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'features/data/models/station_model.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  // await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  // Hive.registerAdapter(StationModelAdapter());
  // await Hive.openBox<StationModel>('stations');

  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EV Charging Point',
      home: AuthChecker(),
    );
  }
}

