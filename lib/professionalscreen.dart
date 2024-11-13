import 'package:flutter/material.dart';

import 'package:testing/docprofile.dart';

class ProfessionalInfoScreen extends StatefulWidget {
  const ProfessionalInfoScreen({super.key});

  @override
  State<ProfessionalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<ProfessionalInfoScreen> {
  final experienceController = TextEditingController(text: "12 Years");
  final qualificationController = TextEditingController(text: "BD, M.B.B.S");
  final affiliationController = TextEditingController(text: "Apollo Hospital");

  // Backup original values in case of cancel
  late String originalExperince;
  late String originalQualification;
  late String originalAffilliation;

  @override
  void initState() {
    super.initState();
    // Save initial values
    originalExperince = experienceController.text;
    originalQualification = qualificationController.text;
    originalAffilliation = affiliationController.text;
  }

  void _updateInfo() {
    setState(() {
      // Save current changes and turn off editing
      isEditing = false;
    });
  }

  bool isEditing = false;
  void _toggleEditing() {
    setState(() {
      if (isEditing) {
        // If cancel is pressed, revert to original values
        experienceController.text = originalExperince;
        qualificationController.text = originalQualification;
        affiliationController.text = originalAffilliation;
      } else {
        // Save current values as backup before starting editing
        originalExperince = experienceController.text;
        originalQualification = qualificationController.text;
        originalAffilliation = affiliationController.text;
      }
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Docprofile();
                        }));
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.teal,
                      ),
                    ),
                    const Text(
                      'Professional Information',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isEditing ? null : Icons.edit,
                        color: Colors.teal,
                      ),
                      onPressed: _toggleEditing,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                _buildLabel("Experience"),
                _buildTextField(experienceController, isEditing),
                const SizedBox(height: 20),
                _buildLabel("Qualification"),
                _buildTextField(qualificationController, isEditing),
                const SizedBox(height: 20),
                _buildLabel("Affilliation"),
                _buildTextField(affiliationController, isEditing, maxLines: 1),
                if (isEditing) ...[
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 41.0,
                          width: screenWidth * 0.5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.teal, width: 1.0),
                                borderRadius: BorderRadius.circular(4.0),
                              )),
                              onPressed: _toggleEditing,
                              child: const Text(
                                'CANCEL',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.teal),
                              )),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 41.0,
                          width: screenWidth * 0.5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2B8A83),
                                  side: const BorderSide(color: Colors.teal),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  )),
                              onPressed: _updateInfo,
                              child: const Text(
                                'UPDATE',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build labels
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(TextEditingController controller, bool isEditable,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      cursorColor: const Color(0xFF2B8A83),
      enabled: isEditable,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: isEditable
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF2B8A83)))
            : InputBorder.none,
        enabledBorder: isEditable
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF2B8A83)),
              )
            : InputBorder.none,
        focusedBorder: isEditable
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF2B8A83), width: 1.0),
              )
            : InputBorder.none,
        //contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF373C3A),
      ),
    );
  }
}
