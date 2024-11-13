import 'package:flutter/material.dart';
import 'package:testing/bottomnav.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});
  _notificationBox(String title, String subT, String date, String assetPath,
      double Width, double Hieght) {
    return Container(
      width: Width,
      height: Hieght * 0.065,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, top: 15.5, bottom: 15.5, right: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              child: Image.asset('assets/images/docimg.png'),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prathik Gadde',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      'New appointment',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: Width * 0.3,
                    ),
                    Text(
                      'July 23, 12:10 - 12:40',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.0,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFEBEFF4),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color.fromARGB(255, 13, 136, 132),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Notifications',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 20.0),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.89,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Yesterday',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _notificationBox(
                        'Prathik Gadde',
                        'New appointment',
                        'July 23, 12:10 - 12:40',
                        'assets/images/docimg.png',
                        screenWidth,
                        screenHeight),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
