// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "User Profile",
      debugShowCheckedModeBanner: false,
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  final String _fullName = "Haseeb Ahmed";
  final String _status = "NGO Manager";
  final String _bio =
      "\"Patricia's friend who was here hardly had any issues at all, but she wasn't telling the truth. Yesterday, before she left to go home,\"";
  final String _hours = "1000";
  final String _projects = "200";
  final String _rating = "5.0";

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
      height: 60.0,
      margin: const EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItems("Hours", _hours),
          _buildStatItems("Projects", _projects),
          _buildStatItems("Rating", _rating),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle _bioText = const TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Text(
        _bio,
        style: _bioText,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: const EdgeInsets.only(top: 4.0),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text(
              "Search Opprtunity",
              style: TextStyle(
                fontFamily: 'Spectral',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Color(0xFF799497),
                fontSize: 20.0,
              ),
            ),
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
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
                    "Exit",
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
              onTap: () => print("LogOut"),
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

  const UserProfilePage({Key? key}) : super(key: key);

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
                _buildBio(context),
                _buildSeparator(screenSize),
                const SizedBox(height: 40.0),
                _buildSearchButton(screenSize),
                const SizedBox(height: 40.0),
                _buildButtons(),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
