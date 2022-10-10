// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:train_task/business_logic/cubit/trips_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:train_task/constants/strings.dart';
import 'package:train_task/data/models/trip.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

Widget leftDivider(height, n, red_container, alltrips, index) {
  var date = DateTime.parse(alltrips[index].date);
  var local_date = date.toLocal();
  var day_name = DateFormat('EEEE').format(date);
  DateFormat formatter =
      DateFormat('MMM'); // create a formatter to get months 3 character
  String monthAbbr = formatter.format(date);
  // now pass your required date and get month
  final dt = DateTime(date.year, date.month, date.day, date.hour, date.minute);
  final format = DateFormat.jm(); //"6:00 AM"
  return SizedBox(
    height: height * 0.34 * n,
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 8, 0),
          child: VerticalDivider(
            thickness: 1,
            width: 20,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
        ),
        red_container
            ? Padding(
                padding: const EdgeInsets.only(top: 20, left: 5),
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Column(
                      children: [
                        Text(
                          "${date.day}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppin_bold'),
                        ),
                        Text(
                          "${day_name.substring(0, 3)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'poppin',
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  height: 80,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      color: Colors.red,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                ),
              )
            : Container(),
      ],
    ),
  );
}

Widget cardWidget(height, width, index, alltrips) {
  var date = DateTime.parse(alltrips[index].date);
  var local_date = date.toLocal();
  var day_name = DateFormat('EEEE').format(date);
  DateFormat formatter =
      DateFormat('MMM'); // create a formatter to get months 3 character
  String monthAbbr = formatter.format(date);
  // now pass your required date and get month
  final dt = DateTime(date.year, date.month, date.day, date.hour, date.minute);
  final format = DateFormat.jm(); //"6:00 AM"

  return Padding(
    padding: const EdgeInsets.only(left: 9.0, top: 0),
    child: Card(
      child: Container(
        height: height * 0.33,
        width: width * 0.82,
        // ignore: unnecessary_new
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),

          color: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              // spreadRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        // ignore: sort_child_properties_last
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "$baseImageUrl/${alltrips[index].featuredImage}"),
                              fit: BoxFit.cover),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                      height: height * 0.17,
                      width: width * 0.8,
                    ),
                    Positioned(
                        top: 8,
                        left: 8,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7))),
                              height: height * 0.045,
                              width: width * 0.3,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "$baseImageUrl/${alltrips[index].tag.icon}"),
                                            fit: BoxFit.cover),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(7))),
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                Text(
                                  "${alltrips[index].tag.title}",
                                  style: TextStyle(
                                      fontFamily: 'poppin',
                                      fontWeight: FontWeight.bold),
                                )
                                // Icon(Icons.sports)
                              ],
                            )
                          ],
                        )),
                    Positioned(
                      left: 8,
                      bottom: 8,
                      child: Container(
                        // ignore: sort_child_properties_last
                        child: Center(
                            child: Text(
                          alltrips[index].spots != 0
                              ? "${alltrips[index].spots} Spots Left"
                              : "Infinite Spots",
                          style: TextStyle(
                              fontFamily: 'poppin',
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7))),
                        height: height * 0.045,
                        width: width * 0.3,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "${day_name}, ${date.day} ${monthAbbr} · ${format.format(dt)}",
                style: TextStyle(
                    fontFamily: 'poppin', fontSize: 10, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "${alltrips[index].title}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'poppin_bold'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "${alltrips[index].placeName}",
                style: TextStyle(
                    fontFamily: 'poppin', fontSize: 9, color: Colors.grey),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "${date.difference(DateTime.now()).inDays} Days Left",
                style: TextStyle(
                    fontFamily: 'poppin', fontSize: 10, color: Colors.orange),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  alltrips[index].users.length != 0
                      ? Container(
                          width: 25.0,
                          height: 25.0,
                          // ignore: unnecessary_new
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              // ignore: unnecessary_new
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "$baseImageUrl/${alltrips[index].users[0].profilePicture}"),
                              )))
                      : Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      alltrips[index].paymentMethod == "CASH"
                          ? Icon(
                              Icons.money,
                              color: Colors.orange,
                            )
                          : alltrips[index].paymentMethod == "ONLINE"
                              ? Icon(
                                  Icons.credit_card,
                                  color: Colors.orange,
                                )
                              : alltrips[index].paymentMethod == "CASH_ONLINE"
                                  ? Row(
                                      children: const [
                                        Icon(
                                          Icons.money,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.credit_card,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    )
                                  : Icon(Icons.error),
                      alltrips[index].price != 0
                          ? Text(
                              "AED ${alltrips[index].price}",
                              style: TextStyle(fontSize: 10),
                            )
                          : Text(
                              "Free",
                              style: TextStyle(fontSize: 10),
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
  );
}

Widget tripsWidget(context, alltrips, changing_date) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  bool red_container = true;

  return ListView.builder(
    shrinkWrap: true,
    itemCount: alltrips.length,
    itemBuilder: ((context, index) {
      String prev_date_month;
      String prev_date_day;
      if (index != 0) {
        var prev_date = DateTime.parse(alltrips[index - 1].date);
        prev_date_month = prev_date.month.toString();
        prev_date_day = prev_date.day.toString();
      } else {
// var prev_date = DateTime.parse(alltrips[index - 1].date);
        prev_date_month = "";
        prev_date_day = "";
      }
      var date = DateTime.parse(alltrips[index].date);
      if (prev_date_day == date.day.toString() &&
          prev_date_month == date.month.toString()) {
        red_container = false;
      } else {
        prev_date_day = date.day.toString();
        prev_date_month = date.month.toString();
        red_container = true;
      }

      return VisibilityDetector(
        key: Key(index.toString()),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction == 1) {
            BlocProvider.of<TripsCubit>(context).getheaderData(date);
          }
        },
        child: Row(
          children: [
            leftDivider(height, 1, red_container, alltrips, index),
            cardWidget(height, width, index, alltrips)
          ],
        ),
      );
    }),
  );
}

Widget headerWidget(changing_date) {
  return Row(
    children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 15, 15),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 25, 15, 15),
            child: Icon(
              Icons.calendar_today_outlined,
              color: Colors.orange,
            ),
          ),
        ],
      ),
      Text(
        changing_date[0].toString(),
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'poppin',
            fontSize: 50,
            fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              changing_date[1].toString(),
              style: TextStyle(color: Colors.grey, fontFamily: 'poppin'),
            ),
            Text(
              "${changing_date[2].toString()} ${changing_date[3].toString()}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppin_bold'),
            )
          ],
        ),
      )
    ],
  );
}

Widget blocWidget(context, currentpage) {
  final DateTime now = DateTime.now().toUtc();
  late List<Trip> alltrips;
  bool loading = true;
  List changing_date = [];
  BlocProvider.of<TripsCubit>(context).getTrips(currentpage, now, main_id);

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    currentpage = 1;
    BlocProvider.of<TripsCubit>(context).getTrips(currentpage, now, main_id);

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    currentpage = currentpage + 1;
    BlocProvider.of<TripsCubit>(context).getTrips(currentpage, now, main_id);

    _refreshController.loadComplete();
  }

  return BlocConsumer<TripsCubit, TripsState>(
    listener: (context, state) {
      if (state is tripsLoaded) {
        alltrips = state.mytrips;
        var date = DateTime.parse(alltrips[0].date.toString());
        BlocProvider.of<TripsCubit>(context).getheaderData(date);

        loading = false;
      } else if (state is MoreTripsLoaded) {
        alltrips.addAll(state.mytrips);
      } else if (state is tripsEmpty) {
        loading = false;
      } else if (state is dateChanged) {
        changing_date = state.changing_date;
      }
    },
    builder: (context, state) {
      if (loading) {
        return Center(
          child: CircularProgressIndicator(color: Colors.orange),
        );
      } else {
        if (state is tripsEmpty) {
          return Center(
            child: Text("No Trips"),
          );
        } else {
          return Column(
            children: [
              headerWidget(changing_date),
              Expanded(
                child: SmartRefresher(
                  scrollDirection: Axis.vertical,
                  enablePullDown: true,
                  enablePullUp: true,
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: tripsWidget(context, alltrips, changing_date),
                ),
              ),
            ],
          );
        }
      }
    },
  );
}

class _HomePageState extends State<HomePage> {
  int test = 0;
  int currentpage = 1;
  late DateTime changing_date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
              size: 40,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Schedule",
            style: TextStyle(color: Colors.black, fontFamily: 'poppin'),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: blocWidget(
          context,
          currentpage,
        ));
  }
}
