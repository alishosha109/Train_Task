import '../apis/trips_apis.dart';
import '../models/trip.dart';

class TripsRepo {
  final TripsApis tripsapis;
  TripsRepo(this.tripsapis);

  Future<List<Trip>> getTrips(page, date, id) async {
    final trips = await tripsapis.getTrips(page, date, id);
    return trips.map((trip) => Trip.fromJson(trip)).toList();
  }
}
