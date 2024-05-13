import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_prism/screens/student_screens/navbar.dart';
import 'package:new_prism/providers/is_loading_provider.dart';
import 'package:new_prism/services/auth_service.dart';
import 'package:new_prism/services/error_handler.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final String type;
  const LoginScreen({super.key, required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void login() async {
      final receivePort = ReceivePort();
      var rootToken = RootIsolateToken.instance!;
      await Isolate.spawn(loginUser, {
        'sendPort': receivePort.sendPort,
        'isolateToken': rootToken,
        'type': widget.type,
        'username': usernameController.text.trim(),
        'password': passwordController.text.trim()
      });

      receivePort.listen((dynamic message) {
        if (message == 200) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Navbar1()),
              (route) => false);
          // showSnackBar(context, "Welcome");
        } else if (message == 400) {
          showSnackBar(context,
              "User does not exists or password and username does not match !");
        } else {
          showSnackBar(context, message);
        }
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: 250,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 50,
                    left: MediaQuery.of(context).size.width / 2 - 100,
                    height: 200,
                    width: 200,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/MREC_logo.png'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      "${widget.type} Login",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 181, 181, 181),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromRGBO(
                                            196, 135, 198, .3)))),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field should not be empty';
                                }
                                return null;
                              },
                              controller: usernameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: _obscureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field should not be empty';
                                }
                                return null;
                              },
                              controller: passwordController,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700)),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          login();
                          Provider.of<IsLoadingProvider>(context, listen: false)
                              .changeStatus();
                        }
                      },
                      color: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: Center(
                        child: Consumer<IsLoadingProvider>(
                          builder: (context, value, child) => value.isloading
                              ? const CircularProgressIndicator.adaptive()
                              : Text(
                                  "Login",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
