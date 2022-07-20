// ignore_for_file: sized_box_for_whitespace
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import '../utility/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
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
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFF61A4F9),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black54,
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.black45,
                              fontFamily: "Spectral",
                              fontSize: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
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
                        const SizedBox(height: 30),
                        TextField(
                          controller: _password,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFF61A4F9),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Colors.black54,
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.black45,
                              fontFamily: "Spectral",
                              fontSize: 20,
                            ),
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
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
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.only(right: 10),
                            child: const Text("Forgot Password?"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 2,
                                        blurStyle: BlurStyle.outer),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    try {
                                      final email = _email.text;
                                      final password = _password.text;

                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                        email: email,
                                        password: password,
                                      );
                                      final user =
                                          FirebaseAuth.instance.currentUser;
                                      if (user?.emailVerified ?? false) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                          userProfile,
                                          (route) => false,
                                        );
                                      } else {
                                        user?.sendEmailVerification();
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pushNamed(verifyEmailRoute);
                                      }
                                      // ignore: use_build_context_synchronously

                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == "invalid-email") {
                                        await showErrorDialog(
                                          context,
                                          "Invalid Email",
                                        );
                                      } else if (e.code == "wrong-password") {
                                        await showErrorDialog(
                                          context,
                                          "Typed Wrong Password Dickhead",
                                        );
                                      } else if (e.code == "user-not-found") {
                                        await showErrorDialog(
                                          context,
                                          "User Not Found",
                                        );
                                      } else {
                                        await showErrorDialog(
                                          context,
                                          "Error: ${e.code}",
                                        );
                                      }
                                    } catch (e) {
                                      await showErrorDialog(
                                        context,
                                        e.toString(),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        // backgroundColor: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 45),
                              const Text(
                                "-- -- --   OR  -- -- --",
                                style: TextStyle(
                                  fontFamily: "Spectral",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "New User?  Register as",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    registerRoute,
                                    (route) => false,
                                  );
                                },
                                child: const Text("Create Account"),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 132,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            blurStyle: BlurStyle.outer),
                                      ],
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Volunteer",
                                        style: TextStyle(
                                            // backgroundColor: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Container(
                                    width: 132,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            blurStyle: BlurStyle.outer),
                                      ],
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "NGO",
                                        style: TextStyle(
                                            // backgroundColor: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 75),
                              const Text(
                                "Powered by",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                              const Text(
                                "TRU ID",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
