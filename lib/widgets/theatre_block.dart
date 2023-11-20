import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libmanagement/controllers/calendar_controller.dart';
// import 'package:libmanagement/controllers/location_controller.dart';
import 'package:libmanagement/controllers/seat_selection_controller.dart';
import 'package:libmanagement/model/theatre_model.dart';
import 'package:libmanagement/pages/seat_selection_screen.dart';
import 'package:libmanagement/utils/mytheme.dart';
import 'package:libmanagement/widgets/facilities_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TheatreBlock extends StatefulWidget {
  final TheatreModel model;
  final bool isBooking;
  final Function(int) onTimeTap;
  const TheatreBlock({
    Key? key,
    required this.model,
    this.isBooking = false,
    required this.onTimeTap,
  }) : super(key: key);

  @override
  State<TheatreBlock> createState() => _TheatreBlockState();
}

class _TheatreBlockState extends State<TheatreBlock> {

  // Adding Student
  String indexTimmingValue = '';
  // CollectionReference students = FirebaseFirestore.instance.collection('seatbookings');

  // Future<void> addUser() {
  //   return students
  //       .add({'indexTimmingValue': indexTimmingValue})
  //       .then((value) => print('User Added'))
  //       .catchError((error) => print('Failed to Add user: $error'));
  // }
  @override
  Widget build(BuildContext context) {
    var instance = CalendarController.instance;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.isBooking
              ? "Please Confirm your Slot" : "Best Library name",
              style: const TextStyle(fontSize: 22),
                // widget.model.name,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.63,
                    ),
                    builder: (_) => FacilitesBottomSheet(model: widget.model),
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black45.withOpacity(0.3),
                  size: 25,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          widget.isBooking
              ? Text(
                  instance.format.format(instance.selectedMovieDate.value),
                  style: const TextStyle(color: Color(0xff999999)),
                )
              : RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.location_on,
                          size: 19,
                          color: Color(0xff999999),
                        ),
                      ),
                      // TextSpan(
                      //   // text: LocationController.instance.city.value + ", ",
                      //   style: const TextStyle(color: Color(0xff999999)),
                      // ),
                      const TextSpan(
                        text: "Best place to become better version by knowledge",
                        style: TextStyle(color: Color(0xff444444)),
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Wrap(
              runSpacing: 10,
              alignment: WrapAlignment.spaceBetween,
              spacing: 20,
              children: List.generate(
                2,
                (index) {
                  //for dummy data
                  bool isSelected = index == SeatSelectionController.instance.timeSelectedIndex.value && widget.isBooking;
                  Color color = index % 2 == 0 ? MyTheme.orangeColor : MyTheme.greenColor;
                  return GestureDetector(
                    onTap: () {
                      //to seat selection
                      widget.onTimeTap(index);
                      print("======================== timming =======================");
                      print(index);
                      // String indexTimmingValue = '';
                      if(index == 0) {
                        indexTimmingValue = "10:00 AM - 9:30 PM";
                      } else {
                        indexTimmingValue = "9:30 PM - 12:30 AM";
                      }
                      print(indexTimmingValue);
                      // add data timming
                      // addUser();
                      
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isSelected ? MyTheme.greenColor : const Color(0x22E5E5E5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: isSelected ? MyTheme.greenColor : const Color(0xffE5E5E5),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        widget.model.timings[index],
                        style: TextStyle(color: isSelected ? Colors.white : color),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
