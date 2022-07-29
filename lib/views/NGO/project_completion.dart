//Imports
import 'package:flutter/material.dart';
import 'package:mynotes/constants/ints.dart';
import 'package:mynotes/constants/strings.dart';

//StateFul Widget
class ProjectCompletion extends StatefulWidget {
  const ProjectCompletion({Key? key}) : super(key: key);

  @override
  State<ProjectCompletion> createState() => _ProjectCompletionState();
}

class _ProjectCompletionState extends State<ProjectCompletion> {
  DateTime selectedDate = DateTime.now();
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
      profileName,
      style: nameTextStyle,
    );
  }

//Outputs Task Name
  Widget taskName() {
    const TextStyle nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
    );
    return Text(
      task_name,
      style: nameTextStyle,
    );
  }

//Outputs Selected Date
  Widget taskDate() {
    const TextStyle nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
    );
    return Text(
      "Date: ${"${selectedDate.toLocal()}".split(' ')[0]}",
      style: nameTextStyle,
    );
  }

//Outputs Selected Time (Not Implemented Yet)
  Widget taskTime() {
    const TextStyle nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
    );
    return Text(
      "Date: ${"${selectedDate.toLocal()}".split(' ')[1].split(':')[0]}:${"${selectedDate.toLocal()}".split(' ')[1].split(':')[1]}",
      style: nameTextStyle,
    );
  }

//Outputs Volunteers Count
  Widget volunteersCount() {
    const TextStyle nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
    );
    return Text(
      "Volunteers: $volunteers",
      style: nameTextStyle,
    );
  }

//Build Buttons

//Yes (Ends Opportunity)
  Widget _buildButtonBlue(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border.all(),
            color: const Color.fromARGB(150, 93, 169, 209),
          ),
          child: const Center(
            child: Text(
              "YES",
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

//No (Returns to Edit Opportunity Page)
  Widget _buildButtonWhite() {
    return Expanded(
      child: InkWell(
        // ignore: avoid_print
        onTap: () {},
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "NO",
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonBlue(context),
          const SizedBox(
            width: 10.0,
          ),
          _buildButtonWhite(),
        ],
      ),
    );
  }

//Profile (Return to Profile Page)
  Widget _buildOtherButtons(
      String s, Color forText, Color forBackground, Size screenSize) {
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

//Widget Build Function
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //Scaffold To Hold The Widget

      body: SafeArea(
        //To Avoid Any Changes in Phone Shape

        child: Padding(
          //Give Equal Padding All Around

          padding: const EdgeInsets.all(10),
          child: Column(
            //Adjust All Elemts in A column

            children: [
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

                height: 55,
              ),
              Container(
                //Contains Completion Info

                padding: const EdgeInsets.only(top: 25, bottom: 25),
                alignment: Alignment.topCenter,
                height: screenSize.height / 2.5,
                width: screenSize.width / 1.05,
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
                child: Column(
                  //Adjust Elemts in a Column
                  children: [
                    taskName(),
                    const SizedBox(
                      //Padding
                      height: 15,
                    ),
                    taskDate(),
                    const SizedBox(
                      //Padding
                      height: 15,
                    ),
                    taskTime(),
                    const SizedBox(
                      //Padding
                      height: 15,
                    ),
                    volunteersCount()
                  ],
                ),
              ),
              const SizedBox(
                //Padding
                height: 40,
              ),
              _buildButtons(
                //Build Buttons
                context,
              ),
              _buildOtherButtons(
                  "Update",
                  const Color.fromARGB(150, 93, 169, 209),
                  Colors.white,
                  screenSize)
            ],
          ),
        ),
      ),
    );
  }
}
