// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mynotes/constants/ints.dart';
import 'package:mynotes/constants/lists.dart';
import 'package:mynotes/constants/strings.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateOpprtunity extends StatefulWidget {
  const CreateOpprtunity({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateOpprtunityState createState() => _CreateOpprtunityState();
}

class _CreateOpprtunityState extends State<CreateOpprtunity> {
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _startcontroller.dispose();
    taskNameController.dispose();
    contactController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    _endcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    taskNameController = TextEditingController();
    contactController = TextEditingController();
    locationController = TextEditingController();
    descriptionController = TextEditingController();
    _startcontroller = TextEditingController();
    _endcontroller = TextEditingController();

    super.initState();
  }

  Widget _buildprofile(Size screenSize) {
    return Center(
      child: Container(
        width: 110.0,
        height: 110.0,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/profilepic.jpeg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: const Color.fromRGBO(96, 125, 139, 1),
            width: 5.0,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileName() {
    const TextStyle nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
    );
    return Text(
      profileName,
      style: nameTextStyle,
    );
  }

  late TextEditingController taskNameController;
  Widget _buildTextForm(String s, Icon I) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: taskNameController,
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
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  late TextEditingController contactController;
  Widget _buildContact(String s, Icon I) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: contactController,
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
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  late TextEditingController locationController;
  Widget _buildLocation(String s, Icon I) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: locationController,
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
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  late TextEditingController descriptionController;
  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: descriptionController,
        autofocus: false,
        maxLines: 5,
        minLines: 3,
        decoration: InputDecoration(
          fillColor: const Color(0xFFEFF4F7),
          filled: true,
          prefixIcon: const Icon(
            Icons.app_registration_rounded,
            color: Color.fromARGB(200, 105, 190, 235),
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
              color: Colors.black,
              width: 2,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  late TextEditingController _startcontroller;
  Widget _buildStartnEnd(String func, BuildContext context) {
    DateTime selectedDate = DateTime.now();

    void updateStartTextField() {
      _startcontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
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
          width: 155,
          child: TextFormField(
            controller: _startcontroller,
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
                color: Colors.black54,
              ),
              // prefixText: "${selectedDate.toLocal()}".split(' ')[0],
              labelText: func,
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
                  color: Colors.black,
                  width: 2,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
            // initialValue: "${selectedDate.toLocal()}".split(' ')[0],
          ),
        ),
      ),
    );
  }

  late TextEditingController _endcontroller;

  Widget _buildEnd(String func, BuildContext context) {
    DateTime selectedDate = DateTime.now();
    void updateEndTextField() {
      _endcontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
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
          width: 155,
          child: TextFormField(
            controller: _endcontroller,
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
                color: Colors.black54,
              ),
              // prefixText: "${selectedDate.toLocal()}".split(' ')[0],
              labelText: func,
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
                  color: Colors.black,
                  width: 2,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
          Navigator.of(context).pushNamedAndRemoveUntil(
            ngoProfileRoute,
            (route) => false,
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
              "PROFILE",
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
        onTap: () {},
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

  Widget _buildOtherButtons(
      String s, Color forText, Color forBackground, Size screenSize) {
    return InkWell(
      // ignore: avoid_print
      onTap: () {
        setState(
          () {
            var item = [];
            task_name = taskNameController.text;
            endDate = _endcontroller.text;
            startDate = _startcontroller.text;
            contact = contactController.text;
            location = locationController.text;
            contact = contactController.text;
            taskDescription = descriptionController.text;
            //Initially volunteers = 0
            //Initial Status ="Not Started"

            if (task_name.isEmpty ||
                endDate.isEmpty ||
                startDate.isEmpty ||
                location.isEmpty) {
              Fluttertoast.showToast(
                  msg: "Please fill in all the Fields",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: "Opportunity Created",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0);
              item = [
                {
                  "task-name": task_name,
                  "date": endDate,
                  "volunteers": volunteers,
                  "status": status,
                  "start-date": startDate,
                  "contact": contact,
                  "location": location,
                  "description": taskDescription,
                },
              ];
              itemsData.add(item[0]);
              // print(itemsData);
            }
          },
        );
      },
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
          decoration:
              const BoxDecoration(color: Color.fromARGB(150, 93, 169, 209)),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Container(
                      height: screenSize.height / 6.5,
                      decoration: const BoxDecoration(
                        boxShadow: [
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
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildprofile(screenSize),
                          _buildProfileName(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    _buildTextForm(
                      "Task Name",
                      const Icon(
                        Icons.border_color_outlined,
                        color: Color.fromARGB(200, 105, 190, 235),
                      ),
                    ),
                    _buildDescription(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildStartnEnd("Start", context),
                        _buildEnd("End", context),
                      ],
                    ),
                    _buildContact(
                      "Location",
                      const Icon(
                        Icons.map_outlined,
                        color: Color.fromARGB(200, 105, 190, 235),
                      ),
                    ),
                    _buildLocation(
                      "Contant",
                      const Icon(
                        Icons.phone_rounded,
                        color: Color.fromARGB(200, 105, 190, 235),
                      ),
                    ),
                    _buildButtons(context),
                    _buildOtherButtons(
                        "CREATE", Colors.black, Colors.white, screenSize),
                    _buildOtherButtons("DELETE", Colors.white,
                        const Color.fromARGB(201, 93, 168, 209), screenSize),
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
