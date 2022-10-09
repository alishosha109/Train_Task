part of 'trips_cubit.dart';

@immutable
abstract class TripsState {}

class TripsInitial extends TripsState {}

class tripsEmpty extends TripsState {
  final List<Trip> mytrips;

  tripsEmpty(
    this.mytrips,
  );
}

class MoreTripsLoaded extends TripsState {
  final List<Trip> mytrips;

  MoreTripsLoaded(
    this.mytrips,
  );
}

class tripsLoaded extends TripsState {
  final List<Trip> mytrips;

  tripsLoaded(
    this.mytrips,
  );
}

class dateChanged extends TripsState {
  final List changing_date;

  dateChanged(
    this.changing_date,
  );
}
