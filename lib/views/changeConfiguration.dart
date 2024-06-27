import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wifi/main.dart'; // Ensure this import is correct for your project
import 'package:wifi/views/homeScreen.dart';
import 'package:wifi/widgets/FlutterToast.dart'; // Ensure this import is correct for your project
import 'package:shared_preferences/shared_preferences.dart';

class ChangeConfiguration extends StatefulWidget {
  const ChangeConfiguration({super.key});

  @override
  State<ChangeConfiguration> createState() => _ChangeConfigurationState();
}

class _ChangeConfigurationState extends State<ChangeConfiguration> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _linkController = TextEditingController();

  void handleSubmit() async {
    if (_nameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _linkController.text.isEmpty) {
      showError(context, "Error! Fill All Details");
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('link', _linkController.text.toString());
      await prefs.setString('userName', _nameController.text.toString());
      await prefs.setString('password', _passwordController.text.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff888888)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff2e2e2e),
          title: Text(
            "Wifi",
            style: TextStyle(
              letterSpacing: 1.6,
              fontSize: 24.sp,
              color: Color(0xff888888),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff2e2e2e),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff2e2e2e),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                ),
              ],
            ),
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
            margin: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "SETUP",
                    style: const TextStyle(
                        color: Color(0xff888888),
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 23.0),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: _linkController, // Event Name Controller
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      labelText: 'Link',
                      labelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                    ),
                    style: const TextStyle(
                        color: Color(0xff888888),
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: _nameController, // Event Name Controller
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      labelText: 'Username',
                      labelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                    ),
                    style: const TextStyle(
                        color: Color(0xff888888),
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: _passwordController, // Event Name Controller
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                    ),
                    style: const TextStyle(
                        color: Color(0xff888888),
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0),
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      handleSubmit();
                    },
                    child: Center(
                      child: Container(
                        width: width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff888888),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Let\'s Go',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.normal,
                                fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
