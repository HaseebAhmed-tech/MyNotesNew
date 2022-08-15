//--Imports--
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mynotes/constants/editing_controller.dart';
import 'package:mynotes/constants/ints.dart';
import 'package:mynotes/constants/lists.dart';
import 'package:mynotes/constants/strings.dart';
import 'package:mynotes/database/data.dart';
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
    editStratTimeContoller = TextEditingController();
    editEndTimeController = TextEditingController();
    super.initState();
  }

//Profile Picture
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
            color: const Color.fromRGBO(96, 125, 139, 1),
            width: 5.0,
          ),
        ),
      ),
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
  late String editCheckStartTime;
  late String editCheckEndTime;

  Widget _statusBuilding(var task, Size screenSize, var responseList) {
    var assignId = 1;
    responseList[task]["id"] = assignId;
    assignId++;
    Text textDate = Text(
      "Date: ${responseList[task]["date"]}",
      style: const TextStyle(fontSize: 17, color: Colors.black),
    );

    Text textName = Text(
      "${responseList[task]["task-name"]}",
      style: const TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    );
    Text textVolunteers = Text(
      "${responseList[task]["volunteers"]}",
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    );

    Row textshowVolunteers = Row(
      children: [
        Text(
          "Volunteers: ",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        textVolunteers,
      ],
    );

    Text textStatus = Text(responseList[task]["status"],
        style: const TextStyle(
            fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right);
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        height: screenSize.height / 7,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(103, 31, 81, 108),
              offset: Offset(
                0.1,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Color(0xff0095FF),
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(child: textStatus),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  textName,
                  const SizedBox(
                    height: 5,
                  ),
                  textDate,
                  const SizedBox(
                    height: 5,
                  ),
                  textshowVolunteers,
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Visibility(
                child: IconButton(
                  onPressed: () {
                    editCheckTextName = textName;
                    editCheckTextDate = textDate;
                    editCheckTextStatus = textStatus;
                    editCheckTextVolunteers = textVolunteers;
                    int i = 0;
                    for (i; i < itemsData.length; i++) {
                      if (itemsData[i]["task-name"] ==
                          editCheckTextName.data.toString()) {
                        editCheckTextContact = itemsData[i]["contact"];
                        editCheckTextLocation = itemsData[i]["location"];
                        editCheckTextDescription = itemsData[i]["description"];
                        editCheckTextStart = itemsData[i]["start-date"];
                        editCheckStartTime = itemsData[i]["start-time"];
                        editCheckEndTime = itemsData[i]["end-time"];
                        break;
                      }
                    }
                    statusWidgetId = i;
                    edittaskNameController.text =
                        editCheckTextName.data.toString();
                    editendcontroller.text =
                        editCheckTextDate.data.toString().split(": ")[1];
                    editcontactController.text = editCheckTextContact;
                    editlocationController.text = editCheckTextLocation;
                    editdiscriptionController.text = editCheckTextDescription;
                    editstartcontroller.text = editCheckTextStart;
                    editStratTimeContoller.text = editCheckStartTime;
                    editEndTimeController.text = editCheckEndTime;

                    Navigator.of(context).pushNamed(
                      editOpportunity,
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
              )
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
    return InkWell(
      // ignore: avoid_print
      onTap: () {
        Navigator.of(context).popAndPushNamed(
          ngoCreateOpportunity,
        );
      },
      child: Container(
        height: 60.0,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0095FF)),
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xff0095FF),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

//Add (Returns To Create Opportunity)
  // Widget _buildButtonWhite(BuildContext context) {
  //   return Expanded(
  //     child: InkWell(
  //       // ignore: avoid_print
  //       onTap: () {
  //         Navigator.of(context).pushNamed(
  //           ngoCreateOpportunity,
  //         );
  //       },
  //       child: Container(
  //         height: 40.0,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           border: Border.all(),
  //         ),
  //         child: const Center(
  //           child: Padding(
  //             padding: EdgeInsets.all(10.0),
  //             child: Text(
  //               "Add",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

//Combines the Two Buttons
  // Widget _buildButtons(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(
  //       vertical: 8.0,
  //       horizontal: 16.0,
  //     ),
  //     child: Row(
  //       children: <Widget>[
  //         _buildButtonBlue(context),
  //         const SizedBox(
  //           width: 10.0,
  //         ),
  //         // _buildButtonWhite(context),
  //       ],
  //     ),
  //   );
  // }

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
        onTap: () async {
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
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: GestureDetector(
          // To Unselect Drop Drown Menue and hide Edit Button
          onTap: () {
            // FocusManager.instance.primaryFocus?.unfocus();
            setState(() {
              isVisible = false;
            });
          },
          child: SafeArea(
            //To Avoid Any Changes in Phone Shape

            child: Padding(
              //Give Equal Padding All Around
              padding: const EdgeInsets.all(10),
              child: Column(
                //Adjust All Elemts in A column
                children: <Widget>[
                  SizedBox(height: screenSize.height / 80), //Provide Gap on Top
                  _buildprofile(screenSize),

                  SizedBox(
                    //Padding
                    height: screenSize.height / 20,
                  ),
                  Container(
                    //To Align Drop Down Menu
                    alignment: Alignment.topRight,
                    color: Color.fromARGB(49, 76, 166, 239),
                    child: dropDownSelect(screenSize),
                  ),
                  Container(
                    //Contains Drop Down Menu AND Status Cards
                    padding: EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(103, 31, 81, 108),
                          offset: Offset(
                            0.0,
                            2.0,
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
                          SizedBox(
                            //Contains Status Cards
                            height: screenSize.height / 1,
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
                  SizedBox(
                    //Padding
                    height: screenSize.height / 25,
                  ),
                  _buildButtonBlue(context), //Buttons
                  SizedBox(
                    //Padding
                    height: screenSize.height / 155,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
