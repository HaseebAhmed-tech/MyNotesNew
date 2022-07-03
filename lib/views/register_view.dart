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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            decoration: const InputDecoration(hintText: "Enter Your Email"),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _password,
            decoration: const InputDecoration(hintText: "Enter you Password"),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
          ),
          TextButton(
              onPressed: () async {
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
              child: const Text("Register")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: const Text("Already Have an Accout Sign in"))
        ],
      ),
    );
  }
}
