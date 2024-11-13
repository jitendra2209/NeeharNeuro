import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testing/bottomnav.dart';
import 'package:testing/leavescreenpage.dart';

class Addleavescreen extends StatefulWidget {
  const Addleavescreen({super.key});

  @override
  State<Addleavescreen> createState() => _AddleavescreenState();
}

class _AddleavescreenState extends State<Addleavescreen> {
  TextEditingController otherCauseController = TextEditingController();

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  int? leaveTypeSelected;
  int? causeIndex;
  List<String> causeType = [
    'Travel',
    'Stressed Out',
    'Exhausted',
    'Family Trip',
    'Personal Reason',
    'Emergency',
    'Others',
  ];
  void onSelected(int index) {
    setState(() {
      causeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFFEBEFF4),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios_new_outlined,
                            color: Color(0xFF2B8A83), size: 20),
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          "New Leaves",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.8,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type of leave",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          leaveTypes(),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Text(
                            'Cause',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          causeTypeList(),
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                          if (causeIndex == 6) ...{
                            TextField(
                              controller: otherCauseController,
                              cursorColor: Color(0xFF2B8A83),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10.0),
                                labelText: "Others",
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF2B8A83),
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFA8A8A8),
                                    width: 1.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),
                              ),
                            ),
                          },
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          TextField(
                            controller: startDateController,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Color(0xFF2B8A83),
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Color(0xFF2B8A83),
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (pickedDate != null) {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Color(0xFF2B8A83),
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Color(0xFF2B8A83),
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    selectedStartDate = DateTime(
                                      pickedDate.year,
                                      pickedDate.month,
                                      pickedDate.day,
                                      pickedTime.hour,
                                      pickedTime.minute,
                                    );
                                    startDateController.text =
                                        DateFormat('EEE, dd MMM yyyy; hh:mm a')
                                            .format(selectedStartDate!);
                                  });
                                }
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Color.fromARGB(255, 181, 182, 182),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              labelText: "Date",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF2B8A83),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF373C3A),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: Color(0xffffffff),
                            ),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          TextField(
                            controller: endDateController,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate:
                                    selectedStartDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2050),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Color(0xFF2B8A83),
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Color(0xFF2B8A83),
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (pickedDate != null) {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Color(0xFF2B8A83),
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Color(0xFF2B8A83),
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );

                                if (pickedTime != null) {
                                  DateTime fullDateTime = DateTime(
                                    pickedDate.year,
                                    pickedDate.month,
                                    pickedDate.day,
                                    pickedTime.hour,
                                    pickedTime.minute,
                                  );

                                  if (fullDateTime.isAfter(
                                      selectedStartDate ?? DateTime.now())) {
                                    setState(() {
                                      selectedEndDate = fullDateTime;
                                      endDateController.text =
                                          DateFormat('EE, dd MMM yyyy; hh:mm a')
                                              .format(selectedEndDate!);
                                    });
                                  } else {
                                    // Optional: show an error message that end date must be after start date
                                  }
                                }
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              suffixIcon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Color.fromARGB(255, 167, 170, 169),
                              ),
                              labelText: "Date",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF2B8A83),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF373C3A),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: Color(0xfffffffff),
                            ),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: screenHeight * 0.15),
                          SizedBox(
                            width: screenWidth,
                            height: 50.0,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF2B8A83),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavBar(
                                                defaultIndex: 3,
                                              )));
                                },
                                child: Center(
                                  child: Text(
                                    'Apply for Leave',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xffffffff),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget leaveTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              leaveTypeSelected = 0;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: leaveTypeSelected == 0
                    ? Color(0xFF2B8A83)
                    : Color(0xFFA8A8A8).withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(4),
              color: leaveTypeSelected == 0
                  ? Color(0xFF2B8A83).withOpacity(0.05)
                  : Color(0xFFA8A8A8).withOpacity(0.05),
            ),
            child: Center(
              child: Text(
                "Casual Leaves",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: leaveTypeSelected == 0
                          ? Color(0xFF2B8A83)
                          : Color(0xFFA8A8A8),
                    ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              leaveTypeSelected = 1;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: leaveTypeSelected == 1
                    ? Color(0xFF2B8A83)
                    : Color(0xFFA8A8A8).withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(4),
              color: leaveTypeSelected == 1
                  ? Color(0xFF2B8A83).withOpacity(0.05)
                  : Color(0xFFA8A8A8).withOpacity(0.05),
            ),
            child: Center(
              child: Text(
                "Sick Leaves",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: leaveTypeSelected == 1
                          ? Color(0xFF2B8A83)
                          : Color(0xFFA8A8A8),
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget causeTypeList() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: List.generate(causeType.length, (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  causeIndex = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: causeIndex == index
                        ? Color(0xFF2B8A83)
                        : Color(0xFFA8A8A8).withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: causeIndex == index
                      ? Color(0xFF2B8A83).withOpacity(0.05)
                      : Color(0xFFA8A8A8).withOpacity(0.05),
                ),
                child: Text(
                  causeType[index],
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: causeIndex == index
                            ? Color(0xFF2B8A83)
                            : Color(0xFFA8A8A8),
                      ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
