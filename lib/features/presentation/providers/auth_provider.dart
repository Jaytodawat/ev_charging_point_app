import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_charging_point_app/features/data/datasources/auth_datasource.dart';
import 'package:ev_charging_point_app/features/data/datasources/station_data_sources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthDataSource>((ref){
  return AuthDataSource(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref){
  return ref.read(authRepositoryProvider).authStateChanges;
});



