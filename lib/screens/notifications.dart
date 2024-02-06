import 'package:flutter/material.dart';
import 'package:tanvi/widgets/bottomNavigation.dart';
import 'package:provider/provider.dart';
import '../model/notificationList/notificationList.dart';
import 'package:intl/intl.dart';

class Notifications extends StatefulWidget {
  // final Map<String, dynamic> notificationList;
  NotificationsState createState() => NotificationsState();

  // Notifications(this.notificationList);
}

class NotificationsState extends State<Notifications> {
  final List<String> _notifications = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ];
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final notificationProvider =
        Provider.of<NotificationList>(context).notificationList;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        // leading: Padding(
        //   padding: EdgeInsets.only(left: width * 0.01),
        //   child: Container(
        //     width: width * 0.1,
        //     height: height * 0.05,
        //     padding: EdgeInsets.only(left: width * 0.02),
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         // border: Border.all(color: Colors.green, width: 2),
        //         borderRadius: BorderRadius.circular(10),
        //         boxShadow: const [
        //           BoxShadow(
        //               color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
        //         ]),
        //     child: Icon(Icons.arrow_back_ios, color: Colors.green),
        //   ),
        // ),
        title: Text(
          'Notifications',
          textScaleFactor: textScaleFactor,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: height * 0.02),
            child: Row(
              children: [
                Image.asset('assets/images/Icon simple-clockify.png'),
                SizedBox(width: width * 0.02),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 0.011),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notificationProvider['data'][index]
                              ['notificationText'],
                          // widget.notificationList['data'][index],
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: height * 0.005),
                        Text(
                          '${dateFormat.format(DateTime.parse(notificationProvider['data'][index]['created_at']).toLocal())}',
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // itemCount: widget.notificationList['data'].length,
          itemCount: notificationProvider['data'].length,
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomBottomNavigation(),
    );
  }
}
