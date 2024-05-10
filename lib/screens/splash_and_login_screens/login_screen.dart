import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_prism/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final String type;
  const LoginScreen({super.key, required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Theme.of(context).colorScheme.onBackground,
              Theme.of(context).colorScheme.background,
            ],
          ),
        ),
        child: SafeArea(
            child: ListView(
          children: [
            SizedBox(height: size.height * 0.03),
            Text(
              "Hello Again ${widget.type}!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Wellcome back vou've\nbeen missed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.secondary,
                  height: 1.2),
            ),
            SizedBox(height: size.height * 0.04),
            // for username and password
            // myTextField("Enter username", Color.fromARGB(255, 255, 255, 255)),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 22,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Username",
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: TextField(
                obscureText: _obscureText,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 22,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Password",
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 19,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Recovery Password               ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // for sign in button
                  GestureDetector(
                    onTap: () async {
                      final pres = await SharedPreferences.getInstance();
                      pres.setBool("onboarding", true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Navbar1()));
                    },
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.07),
                  Text.rich(
                    TextSpan(
                        text: "Not a member? ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        children: const [
                          TextSpan(
                            text: "Register now",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
