import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class filterPopUpScreen extends StatefulWidget {
  const filterPopUpScreen({super.key});

  @override
  State<filterPopUpScreen> createState() => _filterPopUpScreenState();
}

class _filterPopUpScreenState extends State<filterPopUpScreen> {
  int? selectedGenderIndex;
  String? selectedBloodGroup;
  int? selectedVisited;
  Widget _genderSelection() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedGenderIndex = 0; // Male
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: selectedGenderIndex == 0
                  ? Color(0xFF2B8A83).withOpacity(0.05)
                  : Colors.grey.withOpacity(0.05),
              border: Border.all(
                color: selectedGenderIndex == 0
                    ? Color(0xFF2B8A83)
                    : Colors.grey.withOpacity(0.3),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.male,
                    color: selectedGenderIndex == 0
                        ? Color(0xFF2B8A83)
                        : Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Male',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedGenderIndex == 0
                              ? Color(0xFF2B8A83)
                              : Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedGenderIndex = 1; // Female
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: selectedGenderIndex == 1
                  ? Color(0xFF2B8A83).withOpacity(0.05)
                  : Colors.grey.withOpacity(0.05),
              border: Border.all(
                color: selectedGenderIndex == 1
                    ? Color(0xFF2B8A83)
                    : Colors.grey.withOpacity(0.3),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.female,
                    color: selectedGenderIndex == 1
                        ? Color(0xFF2B8A83)
                        : Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Female',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedGenderIndex == 1
                              ? Color(0xFF2B8A83)
                              : Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: .2,
          ),
          Text('Gender',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          _genderSelection(),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(height: 16),

          // Blood Group Dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/icons/blood-drop.svg',
                ),
              ),
              labelText: 'Blood group',
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                    const BorderSide(color: Color(0xFF2B8A83), width: 1.0),
              ),
            ),
            items: ['A', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              selectedBloodGroup = newValue;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          DropdownButtonFormField<int>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: 'No of visits',
              labelStyle: const TextStyle(color: Colors.grey),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "assets/icons/countdown 1.svg",
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                    const BorderSide(color: Color(0xFF2B8A83), width: 1.0),
              ),
            ),
            items: List.generate(10, (index) => index + 1).map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value'),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedVisited = newValue;
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2B8A83),
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'SAVE',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
