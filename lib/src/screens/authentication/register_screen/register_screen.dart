import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_academy/src/screens/authentication/log_in_screen/log_in_screen.dart';
import 'package:saif_academy/src/widgets/colors/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [bgLinearGradient1, bgLinearGradient2],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  width: double.infinity,
                  height: screenHeight * 0.3,
                  child: Image.asset("assets/images/authentication/signup.png"),
                ),
                SizedBox(
                  height: screenHeight * 0.001,
                ),
                Column(
                  children: [
                    Text(
                      "Lets get started!",
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.06,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      "Create an account to online-learning to get all features",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: screenWidth * 0.036,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your username";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    name = value!;
                                  });
                                },
                                cursorColor: Colors.black,
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Saif Academy",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: const ImageIcon(
                                      AssetImage(
                                          "assets/icons/img_icons/user.png"),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your email";
                                  }
                                  RegExp emailRegex = RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                                  );

                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Enter a valid email address';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    email = value!;
                                  });
                                },
                                cursorColor: Colors.black,
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Saifacademy@gmail.com",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Container(
                                    margin: const EdgeInsets.only(bottom: 2),
                                    child: const ImageIcon(
                                      AssetImage(
                                          "assets/icons/img_icons/email.png"),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your password";
                                  }
                                  RegExp regex = RegExp(r'^.{6,}$');
                                  if (!regex.hasMatch(value)) {
                                    return 'Password must be at least 6 characters';
                                  }

                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    password = value!;
                                  });
                                },
                                cursorColor: Colors.black,
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: const ImageIcon(
                                      AssetImage(
                                          "assets/icons/img_icons/padlock.png"),
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: ColorFiltered(
                                      colorFilter: const ColorFilter.mode(
                                        Colors.grey,
                                        BlendMode.srcIn,
                                      ),
                                      child: SvgPicture.asset(
                                        _obscureText
                                            ? 'assets/icons/svg_icons/eye-show-svgrepo-com.svg'
                                            : 'assets/icons/svg_icons/eye-hide-svgrepo-com.svg',
                                      ),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    confirmPassword = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your confirm password";
                                  }
                                  if (value != password) {
                                    return "Passwords do not match";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    confirmPassword = value!;
                                  });
                                },
                                cursorColor: Colors.black,
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Confirm Password",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: const ImageIcon(
                                      AssetImage(
                                          "assets/icons/img_icons/padlock.png"),
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: ColorFiltered(
                                      colorFilter: const ColorFilter.mode(
                                        Colors.grey,
                                        BlendMode.srcIn,
                                      ),
                                      child: SvgPicture.asset(
                                        _obscureText
                                            ? 'assets/icons/svg_icons/eye-show-svgrepo-com.svg'
                                            : 'assets/icons/svg_icons/eye-hide-svgrepo-com.svg',
                                      ),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: screenHeight * 0.06,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState?.save();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryButton),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              "Register",
                              style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: screenWidth * 0.08, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.nunito(
                          fontSize: screenWidth * 0.038,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.nunito(
                            fontSize: screenWidth * 0.038,
                            color: Colors.blue,
                          ),
                        ),
                      ),
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
