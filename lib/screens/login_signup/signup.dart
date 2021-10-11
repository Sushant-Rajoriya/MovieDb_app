import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:movie_db_app/model/user_table.dart';
import 'package:movie_db_app/screens/login_signup/my_text_field.dart';

import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    String userName = "";
    String password = "";
    String age = "";
    String email = "";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 30,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Welcome !",
                style: GoogleFonts.lato(
                  color: Colors.black,
                  textStyle: TextStyle(letterSpacing: .5, fontSize: 35),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Sign up",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                textStyle:
                                    TextStyle(letterSpacing: .5, fontSize: 25),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            MyTextField(
                              labelText: 'User Name',
                              keyboardType: TextInputType.text,
                              isPassword: false,
                              onChanged: (value) {
                                userName = value;
                              },
                            ),
                            MyTextField(
                              labelText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                            MyTextField(
                              labelText: 'Age',
                              keyboardType: TextInputType.number,
                              isPassword: false,
                              onChanged: (value) {
                                age = value;
                              },
                            ),
                            MyTextField(
                              labelText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              isPassword: false,
                              onChanged: (value) {
                                email = value;
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                addData(userName, password, age, email);

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.lato(
                    color: Colors.blueAccent,
                    textStyle: TextStyle(letterSpacing: .5, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addData(
      String userName, String password, String age, String email) async {
    var box = await Hive.openBox<UserTable>('userTable');
    box.add(UserTable(
      userName,
      password,
      int.parse(age),
      email,
    ));
  }
}
