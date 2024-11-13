import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/bottomnav.dart';

import 'package:testing/forgotpassword.dart';

bool hasTextPass = false;
bool hasTextUser = false;

class DocLogin extends StatelessWidget {
  const DocLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DocdefaultExt(),
    );
  }
}

class DocdefaultExt extends StatefulWidget {
  const DocdefaultExt({super.key});

  @override
  State<DocdefaultExt> createState() => _DocdefaultExtState();
}

class _DocdefaultExtState extends State<DocdefaultExt> {
  bool isVisible = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2B8A83),
              ),
            ),
            const Text(
              'back!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
                'Sign in to monitor your patients, write prescriptions, appointments, and much more.',
                style: TextStyle(
                    fontFamily: 'Poppins-Light',
                    fontSize: 16.0,
                    color: Color(0xFF9B9D9C))),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              cursorColor: const Color.fromARGB(255, 13, 136, 132),
              onChanged: (value) => setState(() {
                //isFocused = true;
                hasTextUser = value.isNotEmpty;
              }),
              decoration: InputDecoration(
                  hintText: hasTextUser ? '' : 'Enter email or username',
                  //labelText: hasText ? '' : 'Enter email or username',
                  hintStyle: const TextStyle(color: Color(0xFF9B9D9C)),
                  prefixIcon: const Icon(
                    Icons.mail_outline,
                    size: 20.0,
                    color: Color.fromARGB(255, 182, 182, 182),
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
                        color: Color(0xFF2B8A83),
                        width: 1.0,
                      ))),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (value) => setState(() {
                hasTextPass = value.isNotEmpty;
              }),
              cursorColor: const Color.fromARGB(255, 13, 136, 132),
              obscureText: isVisible,
              decoration: InputDecoration(
                  hintText: hasTextPass ? '' : 'Enter Password',
                  hintStyle: const TextStyle(color: Color(0xFF9B9D9C)),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    size: 20.0,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Color(0xFFEBEFF4),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 13, 136, 132),
                        width: 1.0,
                      ))),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                  activeColor: const Color(0xFFEBEFF4),
                  checkColor: const Color(0xFF2B8A83),
                  side: const BorderSide(color: Color(0xff373c3a80)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const Text(
                  ' Remember me',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      color: Color(0xff000000)),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ForgotPass();
                        },
                      ));
                    },
                    child: const Text(
                      'Forgot password',
                      style: TextStyle(
                          fontFamily: 'Poppins', color: Color(0xFF2B8A83)),
                    ))
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 54.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B8A83),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const BottomNavBar();
                      },
                    ));
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
