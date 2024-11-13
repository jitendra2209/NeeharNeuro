import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testing/docprofile.dart';
import 'package:testing/notificationpage.dart';

class appointmentScreen extends StatefulWidget {
  const appointmentScreen({super.key});

  @override
  State<appointmentScreen> createState() => _appointmentScreenState();
}

class _appointmentScreenState extends State<appointmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        tabSelectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Generate dates dynamically based on selected month and year
  List<Map<String, String>> getDatesForMonth(int year, int month) {
    int daysInMonth =
        DateTime(year, month + 1, 0).day; // Get the last day of the month
    List<Map<String, String>> daysList = [];
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(year, month, day);
      daysList.add({
        'day': date.day.toString(),
        'weekday': _getWeekdayName(date.weekday),
      });
    }
    return daysList;
  }

  void _updateDates() {
    setState(() {
      selectedIndex = 0; // Reset to the first day by default
    });
  }

  String _getWeekdayName(int weekday) {
    const weekdayNames = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return weekdayNames[weekday - 1];
  }

  final List<Map<String, String>> tabs = [
    {'title': 'All', 'count': '25'},
    {'title': 'In-Patient', 'count': '15'},
    {'title': 'Video Call', 'count': '10'},
  ];

  // Track the selected index
  int selectedIndex = 3;
  int tabSelectedIndex = 0;
  // onTabTap(int tabIndex) {
  //   setState(() {
  //     tabSelectedIndex = tabIndex;
  //   });
  // }

  //year and month calendar
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
                                  _updateDates();
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

  bool _isSearchExpanded = false;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final dates = getDatesForMonth(selectedDate.year, selectedDate.month);
    return Scaffold(
        backgroundColor: const Color(0xFFEBEFF4),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const Docprofile()),
                            );
                          },
                          child: CircleAvatar(
                            radius: screenWidth * 0.06,
                            backgroundImage:
                                const AssetImage('assets/images/docimg.png'),
                          ),
                        ),
                        if (!_isSearchExpanded)
                          GestureDetector(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: _isSearchExpanded ? screenWidth * 0.75 : 0,
                              height: 47.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      8.0)), // Adjust width as needed
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: TextField(
                                        cursorColor: Colors.teal,
                                        controller: _searchController,
                                        //autofocus: false,
                                        decoration: InputDecoration(
                                          hintText: 'Search Patient',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Divider between the TextField and the Search Icon
                                  if (_isSearchExpanded)
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey[300],
                                    ),
                                  IconButton(
                                    icon: Icon(Icons.search,
                                        color: Colors.grey[600]),
                                    onPressed: () {
                                      setState(() {
                                        _isSearchExpanded = !_isSearchExpanded;
                                        if (!_isSearchExpanded) {
                                          _searchController
                                              .clear(); // Clear search when closed
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            if (!_isSearchExpanded)
                              IconButton(
                                icon: Icon(Icons.search, color: Colors.black87),
                                onPressed: () {
                                  setState(() {
                                    _isSearchExpanded = true;
                                  });
                                },
                              ),
                            if (!_isSearchExpanded)
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const Notificationpage()),
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/frame-1000003403.svg',
                                  width: screenWidth * 0.06,
                                  height: 30.0,
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: screenHeight * 0.1,

                      // Height of the date picker
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        itemBuilder: (context, index) {
                          bool isSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: 52,
                              height: 79,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(39),
                                  color: isSelected ? Colors.white : null),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Day in Circle
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.teal
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        dates[index]['day']!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: isSelected
                                              ? Colors
                                                  .white // White text for selected day
                                              : Colors
                                                  .black, // Black text for unselected
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Weekday
                                  Text(
                                    dates[index]['weekday']!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelected
                                          ? Colors.teal
                                          : Colors.black,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                            color: const Color(0xFF2B8A83)
                                .withOpacity(.1), // Unselected background color
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
                            // labelColor: Colors.white,
                            // unselectedLabelColor: Colors.grey,
                            labelStyle: const TextStyle(
                              fontSize: 12.0,
                            ),
                            tabs: [
                              buildTab(
                                  'All', '0', 0, screenWidth, screenHeight),
                              buildTab('In-Patient', '0', 1, screenWidth,
                                  screenHeight),
                              buildTab('Video Call', '0', 2, screenWidth,
                                  screenHeight)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child:
                            TabBarView(controller: _tabController, children: [
                          Text(
                            'No appointments for selected date',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'No offline appointments ',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'No online appointments',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                    )
                  ])),
        ));
  }

  String _getMonthName(int month) {
    return monthNames[month - 1];
  }

  JoinNowButton() {
    return const Row(
      children: [
        Icon(
          Icons.video_call,
          color: Color(0xFF2B8A83),
        ),
        SizedBox(width: 5),
        Text(
          'Join now',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Color(0xFF2B8A83),
          ),
        ),
      ],
    );
  }

  Widget buildTab(
      String title, String info, int tabIndex, double Width, double Height) {
    return Tab(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            //width: Width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      color: tabSelectedIndex == tabIndex
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : Colors.black,
                    )),
                SizedBox(
                  width: Width * 0.02,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: tabSelectedIndex == tabIndex
                        ? Colors.white
                        : Colors.teal.withOpacity(.2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    info,
                    style: TextStyle(
                      color: tabSelectedIndex == tabIndex
                          ? Colors.teal
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
