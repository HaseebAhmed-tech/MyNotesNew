// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/editing_controller.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/constants/strings.dart';
import '../notes_view.dart';

class NgoUserProfile extends StatefulWidget {
  const NgoUserProfile({Key? key}) : super(key: key);

  @override
  State<NgoUserProfile> createState() => _NgoUserProfileState();
}

class _NgoUserProfileState extends State<NgoUserProfile> {
  @override
  void initState() {
    editUserNameController = TextEditingController();
    ngoNameController = TextEditingController();
    editPocNameController = TextEditingController();
    editPocContactController = TextEditingController();
    super.initState();
  }

  Widget _buildCoverImage(Size screeSize) {
    return SizedBox(
      height: screeSize.height / 3,
      width: double.maxFinite,
      child: cover_image_path != null
          ? Image.file(
              cover_image_path!,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/images/back.jpeg',
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _buildEditProfile(BuildContext context) {
    return Container(
        width: double.maxFinite,
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            setState(() {
              editUserNameController.text = fullName;
              ngoNameController.text = myStatus;
              editPocNameController.text = poc_name;
              editPocContactController.text = poc_contact;
            });
            Navigator.of(context).pushNamed(editNgoProfile);
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ));
  }

  Widget _buildProfileImage() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              border: Border.all(
                color: Colors.white,
                width: 6.0,
              ),
            ),
            child: ClipOval(
              child: profile_image_path != null
                  ? Image.file(
                      profile_image_path!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/profilepic.jpeg',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ],
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
      fullName,
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
        myStatus,
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
          _buildStatItems("Hours", hours_offered),
          _buildStatItems("Projects", projects_offered),
          _buildStatItems("Engagement", volunteer_engaged),
          _buildStatItems("Rating", NGOrating),
        ],
      ),
    );
  }

  Widget _buildBio(String value, String s, Icon I) {
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
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: const EdgeInsets.only(top: 30.0),
    );
  }

  Widget _buildSearchButton(Size screenSize, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ngoCreateOpportunity,
        );
      },
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
              onTap: () {
                Navigator.of(context).pushNamed(
                  viewNgoStatus,
                );
              },
              child: Container(
                height: 40.0,
                decoration: const BoxDecoration(
                  // border: Border.all(),
                  color: Color(0xff0095FF),
                ),
                child: const Center(
                  child: Text(
                    "STATUS",
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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            height: screenSize.height * 1.04,
            width: double.maxFinite,
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                _buildCoverImage(screenSize),
                SafeArea(
                  child: Column(
                    children: <Widget>[
                      _buildEditProfile(context),
                      SizedBox(
                        height: screenSize.height / 7.8,
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
                            poc_name,
                            "POC",
                            const Icon(Icons.supervised_user_circle_outlined),
                          ),
                          _buildBio(
                            poc_contact,
                            "Contact",
                            const Icon(Icons.phone_android_outlined),
                          ),
                        ],
                      ),
                      _buildSeparator(screenSize),
                      SizedBox(height: screenSize.height / 22),
                      _buildSearchButton(screenSize, context),
                      SizedBox(
                        height: screenSize.height / 36,
                      ),
                      _buildButtons(context),
                      SizedBox(height: screenSize.height / 38),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
