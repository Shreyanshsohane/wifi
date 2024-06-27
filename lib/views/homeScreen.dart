import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi/views/changeConfiguration.dart';
import 'package:wifi/views/profileScreen.dart';
import 'package:wifi/views/webViewScreen.dart';
import 'package:wifi/widgets/FlutterToast.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    print(username);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
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
          actions: [
            Container(
              margin: EdgeInsets.only(right: 5.w),
              child: IconButton(
                onPressed: () {
                  if (username != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeConfiguration(),
                      ),
                    );
                  }
                },
                icon: Icon(
                  Icons.person,
                  color: Color(0xff888888),
                  size: 7.w,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xff2e2e2e),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                if (username != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebviewScreen(),
                    ),
                  );
                } else {
                  showError(context, "Complete your Profile");
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 20.sh,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xff2e2e2e),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(6, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.wifi_rounded,
                        color: Color(0xff888888),
                        size: 15.w,
                      ),
                      Container(
                        height: 18.sh,
                        width: 60.sw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CONNECT TO YOUR WIFI',
                              style: TextStyle(
                                color: Color(0xff888888),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
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
          ],
        ),
      ),
    );
  }
}
