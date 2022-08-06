// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mynotes/constants/ints.dart';
import 'package:mynotes/constants/editing_controller.dart';
import 'package:mynotes/constants/lists.dart';
import 'package:mynotes/constants/strings.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditOpportunity extends StatefulWidget {
  const EditOpportunity({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditOpportunityState createState() => _EditOpportunityState();
}

class _EditOpportunityState extends State<EditOpportunity> {
  Widget _buildprofile(Size screenSize) {
    return Center(
      child: Container(
        width: screenSize.width / 3.25,
        height: screenSize.width / 3.25,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/profilepic.jpeg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: const Color.fromARGB(255, 19, 94, 131),
            width: 5.0,
          ),
        ),
      ),
    );
  }

  // Widget _buildProfileName() {
  //   const TextStyle nameTextStyle = TextStyle(
  //     fontFamily: 'Roboto',
  //     color: Colors.black,
  //     fontSize: 26.0,
  //     fontWeight: FontWeight.w700,
  //   );
  //   return Text(
  //     profileName,
  //     style: nameTextStyle,
  //   );
  // }

  Widget _buildTextForm(String s, Icon I, Size screeSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: screeSize.width / 1.18,
        height: screeSize.height / 15,
        child: TextFormField(
          controller: edittaskNameController,
          decoration: InputDecoration(
            fillColor: const Color(0xFFEFF4F7),
            filled: true,
            prefixIcon: I,
            labelText: s,
            labelStyle: const TextStyle(
              color: Colors.black45,
              fontFamily: "Spectral",
              fontSize: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 2,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  Widget _buildContact(String s, Icon I, Size screenSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: screenSize.width / 1.18,
        height: screenSize.height / 15,
        child: TextFormField(
          controller: editcontactController,
          decoration: InputDecoration(
            fillColor: const Color(0xFFEFF4F7),
            filled: true,
            prefixIcon: I,
            labelText: s,
            labelStyle: const TextStyle(
              color: Colors.black45,
              fontFamily: "Spectral",
              fontSize: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 2,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  Widget _buildLocation(String s, Icon I, Size screenSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: screenSize.width / 1.18,
        height: screenSize.height / 15,
        child: TextFormField(
          controller: editlocationController,
          decoration: InputDecoration(
            fillColor: const Color(0xFFEFF4F7),
            filled: true,
            prefixIcon: I,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit_location),
            ),
            labelText: s,
            labelStyle: const TextStyle(
              color: Colors.black45,
              fontFamily: "Spectral",
              fontSize: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 2,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(Size screenSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: screenSize.width / 1.18,
        height: screenSize.height / 9,
        child: TextFormField(
          controller: editdiscriptionController,
          autofocus: false,
          maxLines: 5,
          minLines: 3,
          decoration: InputDecoration(
            fillColor: const Color(0xFFEFF4F7),
            filled: true,
            prefixIcon: const Icon(
              Icons.app_registration_rounded,
              color: Color.fromARGB(255, 39, 90, 118),
            ),
            labelText: 'Task Description',
            labelStyle: const TextStyle(
              color: Colors.black45,
              fontFamily: "Spectral",
              fontSize: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 2,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  Widget showStartTime(Size screenSize) {
    DateTime selectedDate = DateTime.now();
    return SizedBox(
      width: screenSize.width / 2.8,
      height: screenSize.height / 14,
      child: TextFormField(
        onTap: () {
          editStratTimeContoller.text =
              "${"${selectedDate.toLocal()}".split(' ')[1].split(":")[0]}:${"${selectedDate.toLocal()}".split(' ')[1].split(":")[1]}";
        },
        controller: editStratTimeContoller,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
          fillColor: const Color(0xFFEFF4F7),
          filled: true,
          prefixIcon: const Icon(
            Icons.access_time_outlined,
            color: Color.fromARGB(255, 39, 90, 118),
          ),
          labelText: "Start",
          labelStyle: const TextStyle(
            color: Colors.black45,
            fontFamily: "Spectral",
            fontSize: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }

  Widget showEndTime(Size screenSize) {
    return SizedBox(
      width: screenSize.width / 2.8,
      height: screenSize.height / 14,
      child: TextFormField(
        controller: editEndTimeController,
        keyboardType: TextInputType.datetime,
        autofocus: false,
        decoration: InputDecoration(
          fillColor: const Color(0xFFEFF4F7),
          filled: true,
          prefixIcon: const Icon(
            Icons.access_time_outlined,
            color: Color.fromARGB(255, 39, 90, 118),
          ),
          labelText: "Finish",
          labelStyle: const TextStyle(
            color: Colors.black45,
            fontFamily: "Spectral",
            fontSize: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }

  double calculateHoursOffered() {
    var startingTime = editStratTimeContoller.text;
    var startMins = int.parse(startingTime.split(":")[1]);
    var startHours = int.parse(startingTime.split(":")[0]);
    var endingTime = editEndTimeController.text;
    var endMins = int.parse(endingTime.split(":")[1]);
    var endHours = int.parse(endingTime.split(":")[0]);
    var startingDate = editstartcontroller.text;
    var startMonth = int.parse(startingDate.split("-")[1]);
    var startYear = int.parse(startDate.split("-")[0]);
    var startDay = int.parse(startingDate.split("-")[2]);
    var endingDate = editendcontroller.text;
    var endMonth = int.parse(endingDate.split("-")[1]);
    var endYear = int.parse(endingDate.split("-")[0]);

    var endDay = int.parse(endingDate.split("-")[2]);
    double toPrecision(double x) => double.parse(x.toStringAsFixed(2));

    if (startYear == endYear &&
        startMonth == endMonth &&
        startDay == endDay &&
        startHours == endHours) {
      return toPrecision((endMins - startMins) / 60);
    } else if (startYear == endYear &&
        startMonth == endMonth &&
        startDay == endDay) {
      return toPrecision(((endMins - startMins) / 60) + (endHours - startHours))
          .abs();
    } else if (startYear == endYear && startMonth == endMonth) {
      return toPrecision(
              ((((endMins - startMins) / 60) + (endHours - startHours))) +
                  ((endDay - startDay) * 24))
          .abs();
    } else if (startYear == endYear) {
      return toPrecision(
              ((((((endMins - startMins) / 60) + (endHours - startHours))) +
                      ((endDay - startDay) * 24))) +
                  ((endMonth - startMonth) * 730))
          .abs();
    } else {
      return toPrecision(
              ((((((((endMins - startMins) / 60) + (endHours - startHours))) +
                          ((endDay - startDay) * 24))) +
                      ((endMonth - startMonth) * 730))) +
                  (endYear - startYear) * 8760)
          .abs();
    }
  }

  Widget _buildStartnEnd(String func, BuildContext context, Size screenSize) {
    DateTime selectedDate = DateTime.now();

    void updateStartTextField() {
      editstartcontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
    }

    Future<void> _selectDate(BuildContext context) async {
      DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          startDate = "${selectedDate.toLocal()}".split(' ')[0];
          updateStartTextField();
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        // onTap: () => _controller.text= "${selectedDate.toLocal()}".split(' ')[0],
        child: SizedBox(
          width: screenSize.width / 2.35,
          height: screenSize.height / 13.5,
          child: TextFormField(
            controller: editstartcontroller,
            onTap: () async {
              _selectDate(context);
              // await Future.delayed(const Duration(seconds: 5));
              // _controller.text = "${selectedDate.toLocal()}".split(' ')[0];
            },
            readOnly: true,
            // enabled: false,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: const Color(0xFFEFF4F7),
              filled: true,
              prefixIcon: const Icon(
                Icons.calendar_month_outlined,
                color: Color.fromARGB(255, 39, 90, 118),
              ),
              // prefixText: "${selectedDate.toLocal()}".split(' ')[0],
              labelText: func,
              labelStyle: const TextStyle(
                color: Colors.black45,
                fontFamily: "Spectral",
                fontSize: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            // initialValue: "${selectedDate.toLocal()}".split(' ')[0],
          ),
        ),
      ),
    );
  }

  Widget _buildEnd(String func, BuildContext context, Size sccreenSize) {
    DateTime selectedDate = DateTime.now();
    void updateEndTextField() {
      editendcontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
    }

    Future<void> _selectDate(BuildContext context) async {
      DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          updateEndTextField();
          endDate = "${selectedDate.toLocal()}".split(' ')[0];
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        // onTap: () => _selectDate(context),
        child: SizedBox(
          width: sccreenSize.width / 2.35,
          height: sccreenSize.height / 13.5,
          child: TextFormField(
            controller: editendcontroller,
            onTap: () async {
              _selectDate(context);
            },
            readOnly: true,
            // enabled: false,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: const Color(0xFFEFF4F7),
              filled: true,
              prefixIcon: const Icon(
                Icons.calendar_month_outlined,
                color: Color.fromARGB(255, 39, 90, 118),
              ),
              // prefixText: "${selectedDate.toLocal()}".split(' ')[0],
              labelText: func,
              labelStyle: const TextStyle(
                color: Colors.black45,
                fontFamily: "Spectral",
                fontSize: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            // initialValue: "${selectedDate.toLocal()}".split(' ')[0],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonGrey(BuildContext context) {
    return Expanded(
      child: InkWell(
        // ignore: avoid_print
        onTap: () {
          setState(
            () async {
              final shouldDelete = await showDeleteDialog(context);
              if (shouldDelete) {
                itemsData.removeAt(statusWidgetId);
                Navigator.of(context).pushNamedAndRemoveUntil(
                  ngoProfileRoute,
                  (route) => false,
                );
              }
            },
          );
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border.all(),
            color: const Color.fromARGB(150, 93, 169, 209),
          ),
          child: const Center(
            child: Text(
              "DELETE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonWhite() {
    return Expanded(
      child: InkWell(
        // ignore: avoid_print
        onTap: () {
          if (editstartcontroller.text.isNotEmpty &&
              editEndTimeController.text.isNotEmpty &&
              editendcontroller.text.isNotEmpty &&
              editStratTimeContoller.text.isNotEmpty) {
            if (editEndTimeController.text[2] != ":") {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  "Enter time in 00:00 format",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ));
            } else {
              var startingTime = editStratTimeContoller.text;
              var endingTime = editEndTimeController.text;
              var startingDate = editstartcontroller.text;
              var endingDate = editendcontroller.text;

              bool check1 = true;
              bool check2 = true;
              if (edittaskNameController.text.isEmpty ||
                  editlocationController.text.isEmpty ||
                  editdiscriptionController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(
                    "Please Fill in All the Fields",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ));
                check1 = false;
              }

              if (int.parse(startingDate.split("-")[2]) >
                  int.parse(endingDate.split("-")[2])) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(
                    "Incorrect Date Entered",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ));
                check2 = false;
              } else if (int.parse(startingDate.split("-")[1]) >
                  int.parse(endingDate.split("-")[1])) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(
                    "Incorrect Date Entered",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ));
                check2 = false;
              } else if (int.parse(startDate.split("-")[0]) >
                  int.parse(endingDate.split("-")[0])) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(
                    "Incorrect Date Entered",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ));
                check2 = false;
              } else if (editendcontroller.text == editstartcontroller.text) {
                if ((int.parse(startingTime.split(":")[0]) ==
                            int.parse(endingTime.split(":")[0]) &&
                        int.parse(endingTime.split(":")[1]) <
                            int.parse(startingTime.split(":")[1])) ||
                    (int.parse(startingTime.split(":")[0]) >
                        int.parse(endingTime.split(":")[0]))) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      "Incorrect Time Entered",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ));
                  check2 = false;
                }
              }
              if (check1 && check2) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.greenAccent,
                  content: Text(
                    "Opportunity Updated",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ));
                itemsData[statusWidgetId]["task-name"] =
                    edittaskNameController.text;
                itemsData[statusWidgetId]["date"] = editendcontroller.text;
                // itemsData[statusWidgetId]["volunteers"] = "";
                // itemsData[statusWidgetId]["status"] = "";
                itemsData[statusWidgetId]["start-date"] =
                    editstartcontroller.text;
                itemsData[statusWidgetId]["contact"] =
                    editcontactController.text;
                itemsData[statusWidgetId]["location"] =
                    editlocationController.text;
                itemsData[statusWidgetId]["description"] =
                    editdiscriptionController.text;
                itemsData[statusWidgetId]["start-time"] =
                    editStratTimeContoller.text;
                itemsData[statusWidgetId]["end-time"] =
                    editEndTimeController.text;
                itemsData[statusWidgetId]["hours-offered"] =
                    "${calculateHoursOffered()}";
              }
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Please Fill in All the Fields",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ));
          }
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "UPDATE!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showDeleteDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Are You Sure You Want to Delete?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Delete"))
            ],
          );
        }).then((value) => value ?? false);
  }

  Widget _buildOtherButtons(String s, Color forText, Color forBackground,
      Size screenSize, BuildContext context) {
    return InkWell(
      // ignore: avoid_print
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          width: screenSize.width / 1.15,
          height: 50,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(103, 31, 81, 108),
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            border: Border.all(),
            color: forBackground,
          ),
          child: Center(
            child: Text(
              s,
              style: TextStyle(
                color: forText,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Row(
        children: <Widget>[
          _buildButtonGrey(context),
          const SizedBox(
            width: 10.0,
          ),
          _buildButtonWhite(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5)
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    _buildprofile(screenSize),
                    const SizedBox(height: 35),
                    _buildTextForm(
                      "Task Name",
                      const Icon(
                        Icons.border_color_outlined,
                        color: Color.fromARGB(255, 39, 90, 118),
                      ),
                      screenSize,
                    ),
                    SizedBox(
                      height: screenSize.height / 80,
                    ),
                    _buildDescription(screenSize),
                    SizedBox(
                      height: screenSize.height / 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildStartnEnd("Start", context, screenSize),
                        _buildEnd("End", context, screenSize),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height / 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        showStartTime(screenSize),
                        showEndTime(screenSize),
                      ],
                    ),

                    SizedBox(
                      height: screenSize.height / 40,
                    ),
                    _buildLocation(
                        "Location",
                        const Icon(
                          Icons.my_location_outlined,
                          color: Color.fromARGB(255, 39, 90, 118),
                        ),
                        screenSize),
                    SizedBox(
                      height: screenSize.height / 80,
                    ),
                    _buildContact(
                        "Contant",
                        const Icon(
                          Icons.phone_rounded,
                          color: Color.fromARGB(255, 39, 90, 118),
                        ),
                        screenSize),
                    _buildButtons(context),
                    // _buildOtherButtons(
                    //     "CREATE", Colors.black, Colors.white, screenSize),
                    // _buildOtherButtons(
                    //     "DELETE",
                    //     Colors.white,
                    //     const Color.fromARGB(201, 93, 168, 209),
                    //     screenSize,
                    //     context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
