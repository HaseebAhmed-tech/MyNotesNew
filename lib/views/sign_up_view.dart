import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotes/views/login_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var username = "";
  var password = "";
  var confirmPassword = "";

  final _userEmail = TextEditingController();
  final _userName = TextEditingController();
  final _userPassword = TextEditingController();
  final _userConfirmPassword = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _userEmail.dispose();
    _userName.dispose();
    _userPassword.dispose();
    _userConfirmPassword.dispose();
    super.dispose();
  }

  late String valueDropDown = "NGO";
  final dropDownItems = ['NGO', "Volunteer"];

  Widget dropDownSelect(Size screenSize) {
    return SizedBox(
      height: 55,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                errorStyle:
                    const TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: 'Please select expense',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            isEmpty: valueDropDown == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: valueDropDown,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    valueDropDown = newValue!;
                    state.didChange(newValue);
                  });
                },
                items: dropDownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  registeration() async {
    if (password == confirmPassword) {
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.trim(), password: password.trim());
        // print(user);
        // user.user.displayName = username;
        FirebaseFirestore.instance.collection('users').doc(user.user?.uid).set(
          {
            'username': username.trim(),
            'email': email.trim(),
            'password': password,
          },
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(
              "Registered Successfully. Please Log in!!",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        );

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // print("Password Provided is too weak");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.yellowAccent,
            content: Text(
              "Password Provided is too weak",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          // print("Account already exists");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Account already exists",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ));
        }
      }
    } else {
      // print('Password and Confirm Password dont match');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Password and Confirm Password dont match",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height - 80,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create an account, It's free ",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign Up As',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        dropDownSelect(screenSize),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _userName,
                          key: const ValueKey('username'),
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty || value.length < 4) {
                                return 'Please enter at least 4 characters';
                              }
                            }
                            return null;
                          },
                          // onSaved: (value) {
                          //   _userName = value;
                          // },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.text_fields_sharp,
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(189, 189, 189, 1)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(189, 189, 189, 1)))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _userEmail,
                          key: const ValueKey('email'),
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty || value.length < 4) {
                                return 'Please enter a valid email';
                              }

                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'Email Format is not valid';
                              }
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(189, 189, 189, 1)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(189, 189, 189, 1)))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _userPassword,
                          key: const ValueKey('password'),
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              if (value.length < 7) {
                                return 'Password must be atleast 7 characters long';
                              }
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(189, 189, 189, 1)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(189, 189, 189, 1)))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: true,
                          key: const ValueKey('cpassword'),
                          controller: _userConfirmPassword,
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Please type something here';
                              }
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(189, 189, 189, 1)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(189, 189, 189, 1)))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: const Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                              )),
                          child: MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                setState(() {
                                  email = _userEmail.text;
                                  username = _userName.text;
                                  password = _userPassword.text;
                                  confirmPassword = _userConfirmPassword.text;
                                });
                                registeration();
                              }
                            },
                            minWidth: double.infinity,
                            height: 60,
                            color: const Color(0xff0095FF),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text("Already have an account?"),
                        Text(
                          " Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        )
                      ],
                    )
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
