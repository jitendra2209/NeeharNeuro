import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

bool isAllEnabled = false;
bool isAppointmentReminderEnabled = false;
bool isNewPatientNotificationEnabled = false;

class _SettingspageState extends State<Settingspage> {
  // Method to handle "Enable All" toggle
  void _toggleEnableAll() {
    setState(() {
      isAllEnabled = !isAllEnabled;
      isAppointmentReminderEnabled = isAllEnabled;
      isNewPatientNotificationEnabled = isAllEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEFF4),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Settings",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Enable all',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xFF373C3A),
                            ),
                          ),
                          Text(
                            'Activate all notifications',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF373C3A).withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: _toggleEnableAll,
                          child: SvgPicture.asset(isAllEnabled
                              ? 'assets/icons/Switch.svg'
                              : 'assets/icons/Switch1.svg')),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 230.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notification Settings',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Toggle or settings for notification about upcoming appointments.',
                      style: TextStyle(
                        color: const Color(0xFF373C3A).withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Appointment Reminders',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isAppointmentReminderEnabled =
                                    !isAppointmentReminderEnabled;
                                // Update "Enable All" based on other toggles
                                isAllEnabled = isAppointmentReminderEnabled &&
                                    isNewPatientNotificationEnabled;
                              });
                            },
                            child: SvgPicture.asset(isAppointmentReminderEnabled
                                ? 'assets/icons/Switch.svg'
                                : 'assets/icons/Switch1.svg'))
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Patient Notifications',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isNewPatientNotificationEnabled =
                                    !isNewPatientNotificationEnabled;
                              });
                            },
                            child: SvgPicture.asset(
                                isNewPatientNotificationEnabled
                                    ? 'assets/icons/Switch.svg'
                                    : 'assets/icons/Switch1.svg'))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
