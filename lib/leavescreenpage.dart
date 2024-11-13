import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testing/addleavescreen.dart';
import 'package:testing/notificationpage.dart';

class leaveScreen extends StatefulWidget {
  const leaveScreen({super.key});

  @override
  State<leaveScreen> createState() => _leaveScreenState();
}

class _leaveScreenState extends State<leaveScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xFFEBEFF4),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Leaves',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return Notificationpage();
                                  }));
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/frame-1000003403.svg',
                                  width: 34,
                                  height: 34,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return Addleavescreen();
                                  }));
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/plus1.svg',
                                  width: 40,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      height: screenHeight * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2B8A83)
                              .withOpacity(.3), // Unselected background color
                          borderRadius: BorderRadius.circular(30.0),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TabBar(
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize
                              .tab, //fill color with tab width
                          indicator: BoxDecoration(
                            color: const Color(
                                0xFF2B8A83), // Selected tab background color
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          dividerColor: Colors.transparent,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                          tabs: const [
                            Tab(
                              text: 'My Leaves',
                            ),
                            Tab(text: 'Staff Leaves'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: TabBarView(controller: _tabController, children: [
                        Container(
                          height: screenHeight * 0.7,
                          child: ListView(
                            children: [
                              const Text(
                                'May 2024',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12.0),
                              ),
                              LeaveCard('Casual Leave', Color(0xFFFFB241)),
                              LeaveCard('Casual leave', Color(0xFFFFB241)),
                              LeaveCard('Sick Leave', Colors.blue),
                              LeaveCard('Casual leave', Color(0xFFFFB241)),
                              LeaveCard('Sick leave', Colors.blue),
                            ],
                          ),
                        ),
                        Text(
                          'There are no staff leaves',
                          style: TextStyle(fontSize: 14.0),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    ),
                  ],
                ))));
  }
}

Widget LeaveCard(String leaveType, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.white),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: ClipOval(
                child: Image.asset(
                    'assets/images/docimg.png'), // Placeholder for avatar
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dr. Neehar',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF373C3A),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Text(
                        'Wed, 16 May',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0x80373C3A),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          'Half day leave',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0x80373C3A),
                          ),
                          overflow: TextOverflow.visible, // Allow text wrapping
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text(
              'Cause of Leave',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Color(0xFF373C3A),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  color: color.withOpacity(.1),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: color, width: 0.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        leaveType,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: color,
                        ),
                        overflow: TextOverflow
                            .visible, // Wrap text to next line if necessary
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0x33DEDEDE),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF2B8A83)),
          ),
          child: Text(
            'My Grandmother has passed away, so I am going to hometown.',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFF373C3A),
            ),
          ),
        ),
      ],
    ),
  );
}
