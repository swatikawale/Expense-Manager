import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'expenseUI.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController mbileController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final focusMobile = FocusNode();
  final focusPassword = FocusNode();
  bool checkValue = true;

  Future<void> doLogin() async {
    validateLogin(mbileController.text, passController.text, context);
    var headers = {"Accept": "application/json"};
    await http.post(
        Uri.parse(
            "https://apitankhwapatra.tankhwapatra.co.in/auth/v1/mobilelogin"),
        headers: headers,
        body: {
          'phone': mbileController.text,
          'password': passController.text,
          "firebaseToken": "akjnibdba221",
          "uniqueID": "abc"
        }).then((res) {
      if (res.statusCode == 200 &&
          json.decode(res.body)['status'].toString() == "200") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const ExpenseList()));
      } else {
        showAlertDialog(context);
      }

      return true;
    });
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text(
        "Invalid credentials",
      ),
      content: Text(
          validateLogin(mbileController.text, passController.text, context)),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          focusMobile.unfocus();
          focusPassword.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: size.height * 0.01,
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF151624),
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF151624),
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      mobileTextField(size, context),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF151624),
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      passwordTextField(size, context),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      buildRemember(size, context),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      signInButton(size, context),

                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF6A6F7D),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      buildContinueText(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      //here social logo and sign up text
                      buildFooter(size),
                    ],
                  )),
            ),
          ),
        ));
  }

  Widget mobileTextField(Size size, context) {
    return SizedBox(
      height: size.height / 14,
      child: TextFormField(
        controller: mbileController,
        focusNode: focusMobile,
        validator: (value) {
          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

          RegExp regExp = RegExp(pattern);

          if (value.isEmpty == true) {
            return "Please enter mobile number";
          } else if (!regExp.hasMatch(value)) {
            return "Please enter valid mobile number";
          }
          return null;
        },
        style: const TextStyle(
          fontSize: 16.0,
          color: Color(0xFF151624),
        ),
        maxLength: 10,
        keyboardType: TextInputType.number,
        cursorColor: const Color(0xFF21899C),
        decoration: InputDecoration(
          counterText: "",
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1.0, color: Colors.red)),
          hintStyle: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFFABB3BB),
            height: 1.0,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 185, 188, 188))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 185, 188, 188))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 185, 188, 188))),
        ),
      ),
    );
  }

  Widget passwordTextField(Size size, context) {
    return SizedBox(
      height: size.height / 14,
      child: TextFormField(
        controller: passController,
        focusNode: focusPassword,
        obscureText: true,
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter password";
          } else if (value.length < 5) {
            return "Password should be atleast 5 characters";
          } else if (value.length > 15) {
            return "Password should not be greater than 15 characters";
          } else {
            return null;
          }
        },
        style: const TextStyle(
          fontSize: 16.0,
          color: Color(0xFF151624),
        ),
        cursorColor: const Color(0xFF21899C),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFFABB3BB),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1.0, color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 185, 188, 188))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 185, 188, 188))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 185, 188, 188))),
        ),
      ),
    );
  }

  Widget signInButton(Size size, BuildContext context) {
    return SizedBox(
        height: size.height / 14,
        width: size.width / 0.5,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)))),
            child: const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              focusMobile.unfocus();
              focusPassword.unfocus();

              if (formKey.currentState.validate()) {
                doLogin();
              }
            }));
  }

  Widget buildRemember(Size size, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 17.0,
          height: 17.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Checkbox(
              value: checkValue,
              fillColor: MaterialStateProperty.all(Colors.blue),
              onChanged: (index) {
                setState(
                  () {
                    checkValue = index;
                  },
                );
              }),
        ),
        const SizedBox(
          width: 16,
        ),
        const Text(
          'Remember me?',
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF151624),
          ),
        ),
      ],
    );
  }

  Widget buildContinueText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Expanded(
            child: Divider(
          color: Color(0xFF6A6F7D),
        )),
        Expanded(
          child: Text(
            'OR',
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF6A6F7D),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
            child: Divider(
          color: Color(0xFF6A6F7D),
        )),
      ],
    );
  }

  Widget buildNoAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Expanded(
            flex: 2,
            child: Divider(
              color: Color(0xFF969AA8),
            )),
        Expanded(
          flex: 3,
          child: Text(
            'Need an account?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF969AA8),
              fontWeight: FontWeight.w500,
              height: 1.67,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Divider(
              color: Color(0xFF969AA8),
            )),
        SizedBox(
          height: 36,
        ),
      ],
    );
  }

  Widget buildFooter(Size size) {
    return Center(
      child: Column(
        children: <Widget>[
          //social icon here
          SizedBox(
            width: size.width * 0.6,
            height: 44.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //google logo here
                Container(
                  alignment: Alignment.center,
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color.fromRGBO(246, 246, 246, 1)),
                  child: SvgPicture.asset(
                    // Group 59
                    "assets/google-svgrepo-com.svg", width: 22.92,
                    height: 22.92,
                  ),
                ),
                const SizedBox(width: 16),

                //facebook logo here
                Container(
                  alignment: Alignment.center,
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color.fromRGBO(246, 246, 246, 1)),
                  child: SvgPicture.asset(
                    "assets/facebook-svgrepo-com.svg",
                    width: 22.44,
                    height: 22.44,
                  ),
                ),
                const SizedBox(width: 16),

                //linkedin logo here
                Container(
                  alignment: const Alignment(0.02, 0.04),
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color.fromRGBO(246, 246, 246, 1)),
                  child: SvgPicture.asset(
                    "assets/linkedin-svgrepo-com.svg",
                    width: 18.62,
                    height: 22.92,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),

          //footer text here
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 70, 69, 68),
              ),
              children: [
                TextSpan(
                  text: 'Need an account? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'SIGN UP',
                  style: TextStyle(
                      color: Color.fromARGB(255, 70, 69, 68),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 36,
          )
        ],
      ),
    );
  }
}

validateLogin(String mobile, String pwd, context) {
  if (mobile == null) {
    return "Enter mobile no";
  }
  if (pwd == null) {
    return "Enter your password";
  }

  if (mobile.isEmpty == true) {
    return "Mobile number is required";
  }
  if (mobile.length < 10) {
    return "Mobile number must 10 digits";
  }

  if (pwd.isEmpty == true) {
    return "Please check your password";
  }
  if (pwd.length < 5) {
    return "Password should be atleast 5 characters";
  } else {
    return "Please check your credentials";
  }
}
