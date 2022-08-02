import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/utility/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the

    _userNameController.dispose();
    contactController.dispose();
    locationController.dispose();
    _buildDescriptionController.dispose();

    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _userNameController = TextEditingController();
    contactController = TextEditingController();
    locationController = TextEditingController();
    _buildDescriptionController = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  Widget _buildRegister() {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      child: const Text(
        "Register",
        style: TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildEnterEmail(String s, Icon I) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
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
      ),
    );
  }

  late TextEditingController _userNameController;
  Widget _buildEnterUserName(String s, Icon I) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _userNameController,
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
      ),
    );
  }

  late TextEditingController contactController;
  Widget _buildPassword(String s, Icon I) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        controller: _password,
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

  Widget _buildRepeatPassword(String s, Icon I) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        controller: _password,
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

  late TextEditingController _buildDescriptionController;
  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _buildDescriptionController,
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
          labelText: 'Enter your Bio',
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

  Widget _buildButtonGrey(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: InkWell(
        // ignore: avoid_print
        onTap: () async {
          try {
            final email = _email.text;
            final password = _password.text;
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email, password: password);
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamed(verifyEmailRoute);
          } on FirebaseAuthException catch (e) {
            if (e.code == "weak-password") {
              showErrorDialog(
                context,
                "Your Password is as weak as your weiner",
              );
            } else if (e.code == "email-already-in-use") {
              showErrorDialog(
                context,
                "This Email is already Registered",
              );
            } else if (e.code == "invalid-email") {
              showErrorDialog(
                context,
                "Pen Yakka Email te shi likh le",
              );
            } else {
              showErrorDialog(context, "Error: ${e.code}");
            }
          } catch (e) {
            await showErrorDialog(
              context,
              e.toString(),
            );
          }
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border.all(),
            color: const Color.fromARGB(150, 93, 169, 209),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              "REGISTER",
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

  Widget _buildOtherButtons(
      String s, Color forText, Color forBackground, Size screenSize) {
    return InkWell(
      // ignore: avoid_print
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil(
          loginRoute,
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
                fontSize: 18,
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
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                _buildRegister(),
                const SizedBox(
                  height: 50,
                ),
                _buildEnterUserName(
                    "Full Name", const Icon(Icons.contacts_outlined)),
                const SizedBox(
                  height: 15,
                ),
                _buildEnterEmail("Email", const Icon(Icons.email_outlined)),
                const SizedBox(
                  height: 15,
                ),
                _buildPassword("Password", const Icon(Icons.password_outlined)),
                const SizedBox(
                  height: 15,
                ),
                _buildRepeatPassword(
                    "Repeat Password", const Icon(Icons.password_outlined)),
                const SizedBox(
                  height: 15,
                ),
                _buildDescription(),
                _buildButtonGrey(context),
                const SizedBox(
                  height: 15,
                ),
                _buildOtherButtons("Already Have an Account? Sign In",
                    Colors.black, Colors.white, screenSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
