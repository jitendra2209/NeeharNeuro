import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/filterpopup_screen.dart';
import 'package:testing/patientdetails.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  bool _isSearchExpanded = false;

  final _searchController = TextEditingController();
  void _openFilterBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        builder: (context) => filterPopUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFEBEFF4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!_isSearchExpanded)
                    Text(
                      'Patient List',
                      style: GoogleFonts.poppins(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  //
                  Expanded(child: Container()),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: _isSearchExpanded ? screenWidth * 0.8 : 0,
                        height: 45.0,
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
                                    hintStyle: TextStyle(color: Colors.grey),
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
                              icon: Icon(Icons.search, color: Colors.grey[600]),
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
                          icon: Icon(Icons.search, color: Colors.grey[600]),
                          onPressed: () {
                            setState(() {
                              _isSearchExpanded = true;
                            });
                          },
                        ),
                    ],
                  ),

                  // const SizedBox(
                  //   width: .0,
                  // ),
                  IconButton(
                      onPressed: _openFilterBottomSheet,
                      icon: SvgPicture.asset('assets/icons/filter 1.svg')),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                height: screenHeight * 0.8,
                width: screenWidth,
                child: const ScrollablePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollablePage extends StatelessWidget {
  const ScrollablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 20, // Number of scrollable items
      itemBuilder: (context, index) {
        String patientId = '#NN${index + 1}';
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const patientDetails();
            }));
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/ellipse-4.svg', height: 32),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Prathik Gadde',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFF373C3A),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              '32Y',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff373c3a80),
                              ),
                            ),
                            const SizedBox(width: 5),
                            SvgPicture.asset('assets/ellipse-5.svg', height: 3),
                            const SizedBox(width: 5),
                            const Text(
                              'male',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff373c3a80),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      patientId,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF2B8A83),
                      ),
                    ),
                  ],
                ),
                const Divider(
                    height: 20, thickness: 0.5, color: Color(0xFFEBEBEB)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoTile(context, 'Blood group', 'O +ve',
                          'assets/blood-drop-1.svg'),
                      _infoTile(context, 'No of visits', '8',
                          'assets/countdown-1.svg'),
                      _infoTile(context, 'Phone number', '9483747538',
                          'assets/phone.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

_infoTile(BuildContext context, String title, String info, String asset) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Color(0x80373C3A),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        children: [
          SvgPicture.asset(
            asset, // Update image path
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 10),
          Text(
            info,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xFF373C3A),
            ),
          ),
        ],
      ),
    ],
  );
}
