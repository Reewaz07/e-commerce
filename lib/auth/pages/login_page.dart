import 'package:ecommerce_app/auth/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Hamro Pasal"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Welcome Back ",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "Sign in to access your  Collection",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
                SizedBox(height: 70),

                Text("Email Addresss", style: TextStyle(fontSize: 18)),

                SizedBox(height: 10),
                InputTextField(
                  hintText: 'Enter your email address',
                  icon: Icons.email,
                ),
                SizedBox(height: 10),
                Text("Password", style: TextStyle(fontSize: 18)),

                InputTextField(
                  hintText: 'Enter your password here',
                  icon: Icons.password,
                  obscureText: true,
                  suffixIcon: Icons.remove_red_eye,
                ),
                SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(170, 50),
                    ),
                    child: Text("Sign In", style: TextStyle(fontSize: 22)),
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.facebook),
                    ),
                    // Text("Continue with Facebook"),
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.google),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(child: Text("Don't have an Account?")),
                SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Create One",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
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
