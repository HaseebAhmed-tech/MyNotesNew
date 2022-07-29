//--Imports--
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mynotes/constants/bools.dart';
import 'package:mynotes/constants/editing_controller.dart';
import 'package:mynotes/constants/ints.dart';
import 'package:mynotes/constants/lists.dart';
import 'package:mynotes/constants/strings.dart';
import '../../constants/routes.dart';

//Stateful Widget
class ViewStatus extends StatefulWidget {
  const ViewStatus({Key? key}) : super(key: key);

  @override
  State<ViewStatus> createState() => _ViewStatusState();
}

class _ViewStatusState extends State<ViewStatus> {
  @override
  void initState() {
    edittaskNameController = TextEditingController();
    editcontactController = TextEditingController();
    editlocationController = TextEditingController();
    editstartcontroller = TextEditingController();
    editendcontroller = TextEditingController();
    editdiscriptionController = TextEditingController();
    super.initState();
  }

//Profile Picture
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

//Profile Name
  Widget _buildProfileName() {
    const TextStyle nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
    );
    return Text(
      fullName,
      style: nameTextStyle,
    );
  }

//Drop Down Menu
  Widget dropDownSelect(Size screenSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: DropdownButton(
            hint: Text(
              dropDownValue,
              style: const TextStyle(
                fontFamily: "Roboto",
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            iconEnabledColor: Colors.blueAccent,
            elevation: 20,
            underline: DropdownButtonHideUnderline(child: Container()),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map(
              (String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              },
            ).toList(),
            onChanged: (String? newValue) {
              setState(
                () {
                  dropDownValue = newValue!;
                  getpostData(screenSize);
                },
              );
            },
          ),
        ),
      ],
    );
  }

// ignore: prefer_final_fields
  Text editCheckTextName = Text("");
  Text editCheckTextDate = Text("");
  Text editCheckTextVolunteers = Text("");
  Text editCheckTextStatus = Text("");
  late String editCheckTextStart;
  late String editCheckTextContact;
  late String editCheckTextLocation;
  late String editCheckTextDescription;

  Widget _statusBuilding(var task, Size screenSize, var responseList) {
    Text textDate = Text(
      "Date: ${responseList[task]["date"]}",
      style: const TextStyle(fontSize: 17, color: Colors.black),
    );

    Text textName = Text(
      "${responseList[task]["task-name"]}",
      style: const TextStyle(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
    );

    Text textVolunteers = Text(
      "Volunteers: ${responseList[task]["volunteers"]}",
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    );

    Text textStatus = Text(responseList[task]["status"],
        style: const TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right);
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = true;
          editCheckTextName = textName;
          editCheckTextDate = textDate;
          editCheckTextStatus = textStatus;
          editCheckTextVolunteers = textVolunteers;
        });
      },
      child: Container(
        height: screenSize.height / 5.3,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: const Color.fromARGB(150, 93, 169, 209),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: textName,
                  ),
                  const SizedBox(height: 12),
                  textDate,
                  textVolunteers,
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 178.0),
                    child: textStatus,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//Status Cards
  List<dynamic> finalList = [];
  void getpostData(Size screenSize) {
    List<dynamic> responseList = itemsData;

    bool showAllElements = dropDownValue == "Show All";

    List<dynamic> listItems = [];
    // ignore: avoid_function_literals_in_foreach_calls

    var task = 1;
    while (task < responseList.length) {
      if (responseList[task]["status"] != dropDownValue && !showAllElements) {
        task++;
        continue;
      }
      listItems.add(_statusBuilding(task, screenSize, responseList));
      task++;
    }
    setState(() {
      finalList = listItems;
    });
  }

//Buttons Build

//Profile(Returns To Profile Page)
  Widget _buildButtonBlue(BuildContext context) {
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

//Add (Returns To Create Opportunity)
  Widget _buildButtonWhite(BuildContext context) {
    return Expanded(
      child: InkWell(
        // ignore: avoid_print
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            ngoCreateOpportunity,
            (route) => false,
          );
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
                "Add",
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

//Combines the Two Buttons
  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Row(
        children: <Widget>[
          _buildButtonBlue(context),
          const SizedBox(
            width: 10.0,
          ),
          _buildButtonWhite(context),
        ],
      ),
    );
  }

  bool isVisible = false;
//Edit (Returns To Edit Opportunity Page)
  Widget _buildOtherButtons(
    String s,
    Color forText,
    Color forBackground,
    Size screenSize,
  ) {
    return Visibility(
      visible: isVisible,
      child: InkWell(
        // ignore: avoid_print
        onTap: () {
          int i = 0;
          for (i; i < itemsData.length; i++) {
            if (itemsData[i]["task-name"] ==
                editCheckTextName.data.toString()) {
              editCheckTextContact = itemsData[i]["contact"];
              editCheckTextLocation = itemsData[i]["location"];
              editCheckTextDescription = itemsData[i]["description"];
              editCheckTextStart = itemsData[i]["start-date"];
              break;
            }
          }
          statusWidgetId = i;
          edittaskNameController.text = editCheckTextName.data.toString();
          editendcontroller.text =
              editCheckTextDate.data.toString().split(": ")[1];
          editcontactController.text = editCheckTextContact;
          editlocationController.text = editCheckTextLocation;
          editdiscriptionController.text = editCheckTextDescription;
          editstartcontroller.text = editCheckTextStart;

          Navigator.of(context).pushNamedAndRemoveUntil(
            editOpportunity,
            (route) => false,
          );

          // taskNameController.text = textName.data.toString();
          // taskNameController.text = itemsData[itemsData[]];
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
      ),
    );
  }

//Widget Build Function
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; //Calculates creen Size
    getpostData(screenSize);
    return Scaffold(
      //Scaffold To Hold The Widget
      body: GestureDetector(
        // To Unselect Drop Drown Menue and hide Edit Button
        onTap: () {
          // FocusManager.instance.primaryFocus?.unfocus();
          setState(() {
            isVisible = false;
          });
        },
        child: SafeArea(
          //To Avoid Any Changes in Phone Shape

          child: Container(
            //To Add Background Color
            color: const Color.fromARGB(150, 93, 169, 209),
            child: Padding(
              //Give Equal Padding All Around
              padding: const EdgeInsets.all(10),
              child: Column(
                //Adjust All Elemts in A column
                children: <Widget>[
                  const SizedBox(height: 25), //Provide Gap on Top
                  Container(
                    //Show Profile
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
                  const SizedBox(
                    //Padding
                    height: 35,
                  ),
                  Container(
                    //Contains Drop Down Menu AND Status Cards
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
                    width: screenSize.width / 1.05,
                    height: screenSize.height / 2,
                    child: SingleChildScrollView(
                      //Allow Scrolling
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        //Contains Drop Down Menu AND Status Cards
                        children: [
                          Container(
                            //To Align Drop Down Menu
                            alignment: Alignment.topRight,
                            child: dropDownSelect(screenSize),
                          ),
                          SizedBox(
                            //Contains Status Cards
                            height: double.maxFinite,
                            child: ListView.builder(
                              itemCount: finalList.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, int index) {
                                return finalList[index];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    //Padding
                    height: 25,
                  ),
                  _buildButtons(context), //Buttons
                  _buildOtherButtons(
                      "EDIT", Colors.black, Colors.white, screenSize),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
