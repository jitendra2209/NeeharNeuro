import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testing/appointmentpage.dart';
import 'package:testing/doctorhomescreen.dart';
import 'package:testing/leavescreenpage.dart';
import 'package:testing/patientlist.dart';
import 'package:testing/settingspage.dart';

void main() {
  return runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: BottomNavBar()));
}

class BottomNavBar extends StatefulWidget {
  final int defaultIndex;

  const BottomNavBar({super.key, this.defaultIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.defaultIndex;
  }

  final List<Widget> _contentShown = [
    const DoctorHomeScreen(),
    const appointmentScreen(),
    const PatientList(),
    const leaveScreen(),
    const Settingspage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEFF4),
      body: _contentShown.elementAt(selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        child: BottomAppBar(
          elevation: 0,
          height: 64,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavigationBarItem(0, 'assets/icons/home-2 1.svg'),
              _buildBottomNavigationBarItem(1, 'assets/icons/calendar-3 1.svg'),
              _buildBottomNavigationBarItem(2, 'assets/icons/list-5 1.svg'),
              _buildBottomNavigationBarItem(
                  3, 'assets/icons/fingerprint 1.svg'),
              _buildBottomNavigationBarItem(4, 'assets/icons/setting-2 1.svg'),
            ],
          ),
        ),
      ),
    );
  }

  _buildBottomNavigationBarItem(int index, String asset) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SvgPicture.asset(
          asset,
          height: 24,
          width: 24,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            selectedIndex == index
                ? const Color(0xFF2B8A83)
                : const Color.fromARGB(255, 57, 55, 55),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
