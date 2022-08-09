import 'package:flutter/material.dart';
import '../../constants/ints.dart';
import '../../constants/lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateOpprtunityNew extends StatefulWidget {
  const CreateOpprtunityNew({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateOpprtunityNewState createState() => _CreateOpprtunityNewState();
}

class _CreateOpprtunityNewState extends State<CreateOpprtunityNew> {
  final _formKey = GlobalKey<FormState>();
  var taskName = "";
  var description = "";
  var contactNumber = "";
  var location = "";
  var startDate = "";
  var endDate = "";
  var startTime = "";
  var endTime = "";
  var hoursOffered = "";

  TextEditingController taskNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController startcontroller = TextEditingController();
  TextEditingController endcontroller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    startcontroller.dispose();
    taskNameController.dispose();
    contactController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    endcontroller.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  double calculateHoursOffered() {
    var startingTime = startTimeController.text;
    var startMins = int.parse(startingTime.split(":")[1]);
    var startHours = int.parse(startingTime.split(":")[0]);
    var endingTime = endTimeController.text;
    var endMins = int.parse(endingTime.split(":")[1]);
    var endHours = int.parse(endingTime.split(":")[0]);
    var startingDate = startcontroller.text;
    var startMonth = int.parse(startingDate.split("-")[1]);
    var startYear = int.parse(startDate.split("-")[0]);
    var startDay = int.parse(startingDate.split("-")[2]);
    var endingDate = endcontroller.text;
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

  registerOpportunity(String id) async {
    if (id != null) {
      try {
        FirebaseFirestore.instance.collection('opportunities').doc(id).set({
          'TaskName': taskName,
          'Description': description,
          'Contact Number': contactNumber,
          'location': location,
          'Start Date': startDate,
          'End Date': endDate,
          'Start Time': startTime,
          'End Time': endTime,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(
              "Registered Successfully. Please Log in!!",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        );

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const OpeningScreen(),
        //   ),
        // );
      } catch (e) {
        print(e);
      }
    }
  }

  Widget _buildprofile(Size screenSize) {
    return Center(
      child: Container(
        width: screenSize.width / 3.25,
        height: screenSize.width / 3.25,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/profilepic.jpeg"),
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

  Widget _buildTextForm(String s, Icon I, Size screeSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: screeSize.width / 1.18,
        height: screeSize.height / 15,
        child: TextFormField(
          controller: taskNameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Type Something Here';
            }
            return null;
          },
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
          controller: contactController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Type Something Here';
            }
            return null;
          },
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
          controller: locationController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Type Something Here';
            }
            return null;
          },
          decoration: InputDecoration(
            fillColor: const Color(0xFFEFF4F7),
            filled: true,
            prefixIcon: I,
            suffixIcon: IconButton(
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return const SearchPlacesScreen();
                // }));
              },
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
          controller: descriptionController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Type Something Here';
            }
            return null;
          },
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
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Type Something Here';
          }
          return null;
        },
        onTap: () {
          startTimeController.text =
              "${"${selectedDate.toLocal()}".split(' ')[1].split(":")[0]}:${"${selectedDate.toLocal()}".split(' ')[1].split(":")[1]}";
        },
        controller: startTimeController,
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
        controller: endTimeController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Type Something Here';
          }
          return null;
        },
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

  Widget _buildStartnEnd(String func, BuildContext context, Size screenSize) {
    DateTime selectedDate = DateTime.now();

    void updateStartTextField() {
      startcontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
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
            controller: startcontroller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Type Something Here';
              }
              return null;
            },
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
      endcontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
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
            controller: endcontroller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Type Something Here';
              }
              return null;
            },
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

  Widget _buildOtherButtons(String s, Color forText, Color forBackground,
      Size screenSize, String userId) {
    return InkWell(
      // ignore: avoid_print
      onTap: () {
        if (_formKey.currentState!.validate()) {
          setState(
            () {
              taskName = taskNameController.text;
              endDate = endcontroller.text;
              startDate = startcontroller.text;
              contactNumber = contactController.text;
              location = locationController.text;
              description = descriptionController.text;
              startTime = startTimeController.text;
              endTime = endTimeController.text;

              if (startDate.isNotEmpty &&
                  endDate.isNotEmpty &&
                  startTime.isNotEmpty &&
                  endTime.isNotEmpty) {
                if (endTime[2] != ":") {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      "Enter time in 00:00 format",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ));
                } else {
                  hoursOffered = "${calculateHoursOffered()}";

                  var startingTime = startTimeController.text;
                  var endingTime = endTimeController.text;
                  var startingDate = startcontroller.text;
                  var endingDate = endcontroller.text;
                  bool check1 = true;
                  bool check2 = true;
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
                  }

                  //Initially volunteers = 0
                  //Initial Status ="Not Started"

                  else if (endDate == startDate) {
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
                }
              }
            },
          );
          registerOpportunity(userId);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: screenSize.width / 1.5,
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

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final myId = routeArg['userId'];
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildprofile(screenSize),

                    SizedBox(height: screenSize.height / 19),
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
                          Icons.map_outlined,
                          color: Color.fromARGB(255, 39, 90, 118),
                        ),
                        screenSize),
                    SizedBox(
                      height: screenSize.height / 80,
                    ),
                    _buildContact(
                        "Contact",
                        const Icon(
                          Icons.phone_rounded,
                          color: Color.fromARGB(255, 39, 90, 118),
                        ),
                        screenSize),
                    SizedBox(
                      height: screenSize.height / 90,
                    ),
                    // _buildButtons(context),
                    _buildOtherButtons(
                      "CREATE",
                      Colors.black,
                      Colors.white,
                      screenSize,
                      "myId",
                    ),
                    // _buildOtherButtons("DELETE", Colors.white,
                    //     const Color.fromARGB(201, 93, 168, 209), screenSize),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
