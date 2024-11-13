import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class patientDetails extends StatefulWidget {
  const patientDetails({super.key});

  @override
  State<patientDetails> createState() => _patientDetailsState();
}

class _patientDetailsState extends State<patientDetails> {
  final List<String> detailsScrollView = [
    'Information',
    '  Vitals  ',
    'Latest Diagnosis',
    'Prescription',
    'Appointment History',
    'Treatment History',
  ];
  int onSelected = 0;
  void _isSelected(int index) {
    setState(() {
      onSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFEBEFF4),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios_new_outlined,
                      color: Color(0xFF2B8A83), size: 20),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Patient Detail",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          patientDetailsBox(context),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: detailScroll(),
            ),
          ),
          if (onSelected == 0)
            Expanded(
              child: Container(
                width: width,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EMAIL",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 12),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "neeharneuro@gmail.com",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "ADDRESS",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 12),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      width: width * 0.7,
                      child: Text(
                        "hafeezpet road, kphb",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (onSelected == 1)
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(20),
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildVitalsSection("assets/images/Group.svg",
                        "BloodPressure", "88", "mmHg"),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    buildVitalsSection("assets/images/Group (1).svg",
                        "Temperature", "99", " \u00b0 F"),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    buildVitalsSection(
                        "assets/images/Vector.svg", "Pulse", "80", "BPM"),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    buildVitalsSection(
                        "assets/images/heart.svg", "Heart Rate", "72", "BPM"),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    buildVitalsSection(
                        "assets/images/weight.svg", "Weight", "60", "Kg"),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),
            )),
          if (onSelected == 2)
            Expanded(
              child: Text(
                'No Data Avaialable',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
            ),
          if (onSelected == 3)
            Expanded(
              child: Text(
                'No Data Avaialable',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
            ),
          if (onSelected == 4)
            Expanded(
              child: Text(
                'No Data Avaialable',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
            ),
          if (onSelected == 5)
            Expanded(
              child: Text(
                'No Data Avaialable',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
            )
        ],
      )),
    );
  }

  Widget detailScroll() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(detailsScrollView.length, (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                _isSelected(index);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        onSelected == index ? Color(0xFF2B8A83) : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(33),
                  color: onSelected == index
                      ? Color(0xFF2B8A83).withOpacity(0.05)
                      : Colors.grey.withOpacity(0.05),
                ),
                child: Text(
                  detailsScrollView[index],
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: onSelected == index
                            ? Color(0xFF2B8A83)
                            : Colors.grey,
                      ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget patientDetailsBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xFF2B8A83).withOpacity(.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/ellipse-4.svg',
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Prathik Gadde',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          '32Y',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255),
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
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Text(
                    "#NN01",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B8A83)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF2B8A83),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoTile(context, 'Blood group', 'O +ve',
                        'assets/blood-drop-1.svg'),
                    _infoTile(
                        context, 'No of visits', '8', 'assets/countdown-1.svg'),
                    _infoTile(context, 'Phone number', '9483747538',
                        'assets/phone.svg'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _infoTile(BuildContext context, String title, String info, String asset) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color.fromARGB(128, 255, 255, 255),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            SvgPicture.asset(
              asset, // Update image path
              width: 16,
              height: 16,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(width: 10),
            Text(
              info,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildVitalsSection(
      String svgPath, String parameter, String value, String unit) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath),
          SizedBox(
            width: width * 0.01,
          ),
          Text(
            parameter,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const Spacer(),
          Text(
            "$value ",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Text(
            unit,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
