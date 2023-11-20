import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:libmanagement/controllers/location_controller.dart';
// import 'package:libmanagement/controllers/shared_pref.dart';
import 'package:libmanagement/pages/profile_screen.dart';
// import 'package:libmanagement/pages/select_location_screen.dart';
import '../controllers/auth_controller.dart';
import '../utils/custom_slider.dart';
import '../utils/dummy_data.dart';
import '../utils/event_items.dart';
import '../utils/menu_item.dart';
import '../utils/movies_item.dart';
import '../utils/mytheme.dart';

import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar));
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ProfileScreen());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: picUrl,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AuthController.instance.user!.displayName ?? "Name"),
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => const SelectionLocationScreen());
                    },
                    child: Row(
                      children: [
                        // Obx(
                        //   () => Text(
                        //     LocationController.instance.city.value,
                        //     style: TextStyle(color: Colors.white.withOpacity(0.7), inherit: true, fontSize: 14),
                        //   ),
                        // ),
                        // Icon(Icons.keyboard_arrow_down, color: Colors.white.withOpacity(0.7)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/search.svg"),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/notification.svg",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width,
                  color: Colors.red,
                  child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (_, i) {
                      return CustomSlider(
                        index: i,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    "BOOKS",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
                  ),
                ),
                const MyMenuItem(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    "Book Seat",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
                  ),
                ),
                const MoviesItems(),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Nearby theatres".toUpperCase(),
                //         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
                //       ),
                //       TextButton(
                //         onPressed: () {},
                //         child: const Text(
                //           "View All",
                //           style: TextStyle(color: MyTheme.splash),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   height: size.height * 0.2,
                //   padding: const EdgeInsets.only(left: 20, right: 20),
                //   // child: GoogleMap(
                //   //   mapType: MapType.normal,
                //   //   initialCameraPosition: _kGooglePlex,
                //   //   gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                //   //     Factory<OneSequenceGestureRecognizer>(
                //   //       () => EagerGestureRecognizer(),
                //   //     )
                //   //   },
                //   //   onMapCreated: (GoogleMapController controller) {
                //   //     //_controller.complete(controller);
                //   //   },
                //   //   zoomControlsEnabled: false,
                //   // ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/spotlights.svg",
                        color: Colors.black.withOpacity(0.8),
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Events".toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(color: MyTheme.splash),
                        ),
                      ),
                    ],
                  ),
                ),
                EventItems(
                  events: events,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
