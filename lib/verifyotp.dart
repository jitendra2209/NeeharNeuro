import 'package:flutter/material.dart';
import 'package:testing/changepass.dart';

class ForgotPass2 extends StatefulWidget {
  const ForgotPass2({super.key});

  @override
  State<ForgotPass2> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass2> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  int _currentFocusIndex = 0; // Track the currently focused index

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          setState(() {
            _currentFocusIndex = i;
          });
        }
      });
    }
  }

  Widget OTPBox(int index) {
    return SizedBox(
      width: 50,
      height: 54,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        cursorColor: const Color(0xFF2B8A83),
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(
            fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: _controllers[index].text.isNotEmpty
                    ? const Color(0xFF2B8A83)
                    : const Color(0xff373c3a80),
                width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF2B8A83), width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            _focusNodes[index + 1].requestFocus();
          }
          if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Text(
                      'Verify',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2B8A83),
                      ),
                    ),
                    const Text(
                      'Identity',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Enter the OTP sent to your email to verify and change your password.',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9B9D9C)),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (index) {
                        return OTPBox(index);
                      }),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: (() {}),
                          child: const Text(
                            'Resend OTP',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: Color(0xFF2B8A83)),
                          )),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const Changepass();
                          },
                        ));
                      },
                      child: Container(
                        height: 54.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B8A83),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Verify OTP',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ]),
            ),
          ),
        ));
  }
}
