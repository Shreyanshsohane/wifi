import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi/views/changeConfiguration.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String? link = "";
  late String? password = "";
  late String? username = "";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('userName');
      link = prefs.getString('link');
      password = prefs.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Icon(
                    Icons.person,
                    color: Color(0xff888888),
                    size: 12.w,
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        color: Color(0xff888888),
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Link : ${link}',
                  style: TextStyle(
                      color: Color(0xff888888),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.sp),
                ),
                Text(
                  'Username : ${username}',
                  style: TextStyle(
                      color: Color(0xff888888),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.sp),
                ),
                Text(
                  'Password : ${password}',
                  style: TextStyle(
                      color: Color(0xff888888),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.sp),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeConfiguration(),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      width: 30.w,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff888888),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.sp),
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
    );
  }
}
