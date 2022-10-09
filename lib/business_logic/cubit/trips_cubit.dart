// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:train_task/data/models/trip.dart';
import 'package:train_task/data/repos/trips_repo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  final TripsRepo tripsrepo;
  List<Trip> mytrips = [];

  TripsCubit(this.tripsrepo) : super(TripsInitial());

  List<Trip> getTrips(page, date, id) {
    tripsrepo.getTrips(page, date, id).then((trips) {
      if (trips.isEmpty && page == 1) {
        emit(tripsEmpty(trips));
      } else {
        if (page > 1) {
          emit(MoreTripsLoaded(
            trips,
          ));
        } else {
          emit(tripsLoaded(
            trips,
          ));
        }
      }

      this.mytrips = trips;
    });
    return mytrips;
  }

  List getheaderData(DateTime date) {
    var day_name = DateFormat('EEEE').format(date);
    DateFormat formatter =
        DateFormat('MMM'); // create a formatter to get months 3 character
    String monthAbbr = formatter.format(date);

    emit(dateChanged([date.day, day_name, monthAbbr, date.year]));
    return [date.day, day_name, monthAbbr, date.year];
  }
}
