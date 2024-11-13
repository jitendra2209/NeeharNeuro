import 'package:flutter/material.dart';
import 'package:testing/verifyotp.dart';

bool hasTextPass = false;
bool hasTextUser = false;

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});
  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Forgot',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2B8A83),
                      ),
                    ),
                    const Text(
                      'Password?',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Recover your password to regain access to your patients, write prescriptions, appointments, and much more.',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          color: Color(0xFF9B9D9C)),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      onChanged: (value) => setState(() {
                        //isFocused = true;
                        hasTextUser = value.isNotEmpty;
                      }),
                      decoration: InputDecoration(
                          hintText:
                              hasTextUser ? '' : 'Enter email or username',
                          //labelText: hasText ? '' : 'Enter email or username',
                          hintStyle: const TextStyle(
                              color: Color(0xFF9B9D9C), fontFamily: 'Poppins'),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            size: 20.0,
                            color: Color(0xff373c3a80),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEBEFF4),
                                width: 1.0,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 13, 136, 132),
                                width: 1.0,
                              ))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: (() {}),
                          child: const Text('Forgot password')),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const ForgotPass2();
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B8A83),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Request OTP',
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
                    )
                  ]),
            ),
          ),
        ));
  }
}
