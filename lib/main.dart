import 'package:flutter/material.dart';
import 'Presentation/screens/home_page.dart';
import 'business_logic/cubit/trips_cubit.dart';
import 'constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/apis/trips_apis.dart';
import 'data/repos/trips_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homePageScreen,
      routes: {
        homePageScreen: (context) => BlocProvider(
              create: (context) => TripsCubit(TripsRepo(TripsApis())),
              child: const HomePage(),
            )
      },
    );
  }
}
