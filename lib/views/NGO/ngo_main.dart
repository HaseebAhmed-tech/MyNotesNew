// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import '../notes_view.dart';

class NgoUserProfile extends StatelessWidget {
  final String _fullName = "Haseeb Ahmed";
  final String _status = "NGO Manager";
  final String _bio =
      "\"Patricia's friend who was here hardly had any issues at all, but she wasn't telling the truth. Yesterday, before she left to go home,\"";
  final String _hours_offered = "1000";
  final String _projects_offered = "200";
  final String _volunteer_engaged = "4.1k";
  final String _rating = "5.0";
  final String _poc_name = "Haseeb Ahmed";
  final String _poc_contact = "03044630011";

  Widget _buildCoverImage(Size screeSize) {
    return Container(
      height: screeSize.height / 3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/profilepic.jpeg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 6.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    const TextStyle nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );
    return Text(
      _fullName,
      style: nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(42, 119, 143, 155),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: const TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItems(String label, String count) {
    const TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w200,
    );
    const TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black45,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 70.0,
      margin: const EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItems("Hours", _hours_offered),
          _buildStatItems("Projects", _projects_offered),
          _buildStatItems("Engagement", _volunteer_engaged),
          _buildStatItems("Rating", _rating),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context, String value, String s, Icon I) {
    // TextStyle _bioText = const TextStyle(
    //   fontFamily: 'Spectral',
    //   fontWeight: FontWeight.w500,
    //   fontStyle: FontStyle.italic,
    //   color: Color(0xFF799497),
    //   fontSize: 16.0,
    // );
    return Container(
      height: 60.0,
      width: 165,
      margin: const EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                I,
                Text(
                  s,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );

    // return Container(
    //   color: Theme.of(context).scaffoldBackgroundColor,
    //   padding: const EdgeInsets.only(
    //     top: 30.0,
    //     bottom: 10.0,
    //     left: 10.0,
    //     right: 10.0,
    //   ),
    //   child: Text(
    //     _bio,
    //     style: _bioText,
    //     textAlign: TextAlign.center,
    //   ),
    // );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: const EdgeInsets.only(top: 12.0),
    );
  }

  Widget _buildSearchButton(Size screenSize) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: screenSize.width / 1.4,
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xFFEFF4F7),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(Icons.add),
            Text(
              "Create Opprtunity",
              style: TextStyle(
                fontFamily: 'Spectral',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Color(0xFF799497),
                fontSize: 20.0,
              ),
            ),
          ],
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
          Expanded(
            child: InkWell(
              // ignore: avoid_print
              onTap: () => print('exit'),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: const Color(0xFF404A5C),
                ),
                child: const Center(
                  child: Text(
                    "EDIT PROFILE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: InkWell(
              // ignore: avoid_print
              onTap: () async {
                final shouldLogout = await showLogoutDialog(context);
                if (shouldLogout) {
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (_) => false,
                  );
                }
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "LOG OUT!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShowStatus() {
    return Expanded(
      child: InkWell(
        // ignore: avoid_print
        onTap: () => print('exit'),
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(),
            color: const Color(0xFF404A5C),
          ),
          child: const Center(
            child: Text(
              "EDIT PROFILE",
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

  const NgoUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: screenSize.height / 5.4,
                ),
                _buildProfileImage(),
                _buildFullName(),
                _buildStatus(context),
                _buildStatContainer(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBio(
                      context,
                      _poc_name,
                      "POC",
                      const Icon(Icons.supervised_user_circle_outlined),
                    ),
                    _buildBio(
                      context,
                      _poc_contact,
                      "Contact",
                      const Icon(Icons.phone_android_outlined),
                    ),
                  ],
                ),
                _buildSeparator(screenSize),
                const SizedBox(height: 40.0),
                _buildSearchButton(screenSize),
                const SizedBox(height: 40.0),
                _buildButtons(context),
                const SizedBox(height: 15.0),
                _buildShowStatus(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
