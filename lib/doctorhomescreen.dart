import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/bottomnav.dart';
import 'package:testing/docprofile.dart';
import 'package:testing/notificationpage.dart';

void main() {
  runApp(const DoctorHomeScreen());
}

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  DateTime selectedDate = DateTime.now();
  int selectedYearIndex = 10; // Index for the current year in the years list
  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<int> years =
      List.generate(20, (index) => DateTime.now().year - 10 + index);

  void _showMonthYearPicker() async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display year dynamically based on selectedYearIndex
                  Text(
                    years[selectedYearIndex].toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  Expanded(
                    child: PageView.builder(
                      controller:
                          PageController(initialPage: selectedYearIndex),
                      onPageChanged: (int pageIndex) {
                        setState(() {
                          selectedYearIndex = pageIndex;
                        });
                      },
                      itemCount: years.length,
                      itemBuilder: (BuildContext context, int yearIndex) {
                        return GridView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2.5,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int monthIndex) {
                            String month = _getMonthName(monthIndex + 1);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = DateTime(
                                      years[yearIndex], monthIndex + 1);
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  month,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: selectedDate.year ==
                                                years[yearIndex] &&
                                            selectedDate.month == monthIndex + 1
                                        ? Colors.teal
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFEBEFF4),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Docprofile()),
                        );
                      },
                      child: CircleAvatar(
                        radius: screenWidth * 0.06,
                        backgroundImage:
                            const AssetImage('assets/images/docimg.png'),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: _showMonthYearPicker,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_getMonthName(selectedDate.month)}, ${selectedDate.year}",
                              style: const TextStyle(
                                  fontSize: 16, color: Color(0xFF373C3A)),
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.teal),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const Notificationpage()),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/frame-1000003403.svg',
                        width: screenWidth * 0.06,
                        height: 30.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Good morning,',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' Dr. Neehar',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.06,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.3,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Patients in ${_getMonthName(selectedDate.month)}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/arrow-small-down-1.svg',
                                  width: screenWidth * 0.08,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/arrow-small-down-2.svg',
                                  width: screenWidth * 0.08,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          Text(
                            '165',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.07,
                              color: const Color(0xFF373C3A),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            '20.5%',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 0.03,
                              color: const Color(0x80373C3A),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Image.asset(
                            'assets/images/arrow-trend-up 1.png',
                            width: screenWidth * 0.04,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _inforCard('Online', '40', 'assets/video.png', screenWidth,
                        screenHeight),
                    _inforCard('Walk-in', '65', 'assets/footprints 1.png',
                        screenWidth, screenHeight),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _inforCard('Repeated', '60', 'assets/layer1.png',
                        screenWidth, screenHeight),
                    _inforCard('Cancelled', '0', 'assets/calendar-6 1.png',
                        screenWidth, screenHeight),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inforCard(String title, String info, String assetPath, double width,
      double height) {
    return Container(
      padding: EdgeInsets.all(width * 0.03),
      width: width * 0.42,
      height: height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.02),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.03,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                assetPath,
                width: width * 0.1,
                height: width * 0.1,
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Text(
            info,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: width * 0.08,
              color: Colors.teal.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    return monthNames[month - 1];
  }
}
