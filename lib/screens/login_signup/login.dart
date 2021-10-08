import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db_app/screens/home_screen/home_screen.dart';

import 'my_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                "Welcome Back !",
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
                              "Log in",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                textStyle:
                                    TextStyle(letterSpacing: .5, fontSize: 25),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            MyTextField(labelText: 'User Name'),
                            MyTextField(labelText: 'Password'),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
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
            ],
          ),
        ),
      ),
    );
  }
}
