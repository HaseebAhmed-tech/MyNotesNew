import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mynotes/constants/editing_controller.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/constants/strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:mynotes/database/data.dart';

class EditNgoProfile extends StatefulWidget {
  const EditNgoProfile({Key? key}) : super(key: key);

  @override
  State<EditNgoProfile> createState() => _EditNgoProfileState();
}

class _EditNgoProfileState extends State<EditNgoProfile> {
  File? pickedImage;
  File? pickedImageCover;
  Widget _buildCoverImage(Size screeSize) {
    return SizedBox(
      height: screeSize.height / 3,
      width: double.maxFinite,
      child: pickedImageCover != null
          ? Image.file(
              pickedImageCover!,
              fit: BoxFit.cover,
            )
          : cover_image_path != null
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

  Widget _buildEditCover(Size screenSize) {
    return Container(
        width: double.maxFinite,
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            imagePickerCover(screenSize);
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ));
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
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
          child: pickedImage != null
              ? Image.file(
                  pickedImage!,
                  fit: BoxFit.cover,
                )
              : profile_image_path != null
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
    );
  }

  bool isVisible = false;
  Widget _buildEditProfile(Size screenSize) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = true;
          });
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              border: Border.all(
                color: Colors.white,
                width: 6.0,
              ),
            ),
            alignment: Alignment.bottomRight,
            child: Visibility(
              visible: isVisible,
              child: IconButton(
                onPressed: () {
                  imagePickerProfile(screenSize);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildEditUserName(String s, Icon I, Size screeSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: screeSize.width / 1.12,
        height: screeSize.height / 15,
        child: TextFormField(
          controller: editUserNameController,
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
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 1,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  Widget _buildEditNgoName(String s, Icon I, Size screenSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: screenSize.width / 1.12,
        height: screenSize.height / 15,
        child: TextFormField(
          controller: ngoNameController,
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
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 1,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  Widget _buildEditPocName(String s, Icon I, Size screenSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: screenSize.width / 1.12,
        height: screenSize.height / 15,
        child: TextFormField(
          controller: editPocNameController,
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
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 1,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }

  Widget _buildEditPocContact(String s, Icon I, Size screenSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: screenSize.width / 1.12,
        height: screenSize.height / 15,
        child: TextFormField(
          controller: editPocContactController,
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
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 1,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          keyboardType: TextInputType.number,
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
            if (editUserNameController.text.isNotEmpty &&
                ngoNameController.text.isNotEmpty &&
                editPocContactController.text.isNotEmpty &&
                editPocNameController.text.isNotEmpty) {
              fullName = editUserNameController.text;
              myStatus = ngoNameController.text;
              poc_contact = editPocContactController.text;
              poc_name = editPocNameController.text;
              Data(uid: user?.uid)
                  .editDataNgo(fullName, myStatus, poc_name, poc_contact);
              if (pickedImage != null && pickedImageCover != null) {
                profile_image_path = pickedImage;
                cover_image_path = pickedImageCover;
              } else if (pickedImage != null) {
                profile_image_path = pickedImage;
              } else if (pickedImageCover != null) {
                cover_image_path = pickedImageCover;
              }
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(ngoProfileRoute, (route) => false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  "Please Fill in All the fields",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ));
            }
          },
        );
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

  pickImageProfile(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void imagePickerProfile(Size screenSize) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: screenSize.height / 3.6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImageProfile(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImageProfile(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImageCover(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImageCover = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void imagePickerCover(Size screenSize) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: screenSize.height / 3.6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImageCover(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImageCover(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          setState(() {
            isVisible = false;
          });
        },
        child: SizedBox(
          width: double.maxFinite,
          height: screenSize.height,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                _buildCoverImage(screenSize),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildEditCover(screenSize),
                      SizedBox(
                        height: screenSize.height / 7.8,
                      ),
                      Stack(
                        children: [
                          _buildProfileImage(),
                          _buildEditProfile(screenSize),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height / 50,
                      ),
                      _buildEditUserName(
                          "Edit User Name",
                          const Icon(
                            Icons.contacts,
                            color: Colors.blueAccent,
                          ),
                          screenSize),
                      SizedBox(
                        height: screenSize.height / 50,
                      ),
                      _buildEditNgoName(
                          "Edit NGO Title",
                          const Icon(
                            Icons.verified_user,
                            color: Colors.blueAccent,
                          ),
                          screenSize),
                      SizedBox(
                        height: screenSize.height / 50,
                      ),
                      _buildEditPocName(
                        "Edit POC Name",
                        const Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.blueAccent,
                        ),
                        screenSize,
                      ),
                      SizedBox(
                        height: screenSize.height / 50,
                      ),
                      _buildEditPocContact(
                          "Edit POC Contact",
                          const Icon(
                            Icons.phone_android_outlined,
                            color: Colors.blueAccent,
                          ),
                          screenSize),
                      _buildOtherButtons("Save Changes", Colors.black,
                          Colors.white, screenSize),
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
