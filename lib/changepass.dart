import 'package:flutter/material.dart';
import 'package:testing/doc_login.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => (runApp(const Changepass()));

bool hasTextPass = false;
bool hasTextUser = false;
bool isVisiblePass = true;
bool isVisiblePass2 = true;

class Changepass extends StatelessWidget {
  const Changepass({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangepassExt(),
    );
  }
}

class ChangepassExt extends StatefulWidget {
  const ChangepassExt({super.key});

  @override
  State<ChangepassExt> createState() => _DocdefaultExtState();
}

class _DocdefaultExtState extends State<ChangepassExt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'Change',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2B8A83),
              ),
            ),
            const Text(
              'Password!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Change your password to ensure the security of your patients, write prescriptions, appointments, and much more.',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  color: Color(0xFF9B9D9C)),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              obscureText: isVisiblePass,
              onChanged: (value) => setState(() {
                //isFocused = true;
                hasTextUser = value.isNotEmpty;
                isVisiblePass = !isVisiblePass;
              }),
              decoration: InputDecoration(
                  hintText: hasTextUser ? '' : 'Enter new Password',
                  //labelText: hasText ? '' : 'Enter email or username',
                  hintStyle: const TextStyle(color: Color(0xFF9B9D9C)),
                  prefixIcon: hasTextUser
                      ? const Icon(Icons.lock, size: 20.0, color: Colors.black)
                      : const Icon(Icons.lock,
                          size: 20.0, color: Color(0xff373c3a80)),
                  suffixIcon: IconButton(
                    icon: Icon(isVisiblePass
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isVisiblePass = !isVisiblePass;
                      });
                    },
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
                      borderSide: hasTextUser
                          ? const BorderSide(
                              color: Color(0xFF2B8A83), width: 1.0)
                          : const BorderSide(
                              color: Color.fromARGB(255, 237, 31, 31),
                              width: 1.0))),
            ),
            Text(
              hasTextUser ? '' : 'Minimum 8 Characters',
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 237, 31, 31)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: isVisiblePass2,
              onChanged: (value) => setState(() {
                hasTextPass = value.isNotEmpty;
              }),
              decoration: InputDecoration(
                  hintText: hasTextPass ? '' : 'Re-enter new Password',
                  hintStyle: const TextStyle(color: Color(0xFF9B9D9C)),
                  prefixIcon: hasTextPass
                      ? const Icon(Icons.lock_outline,
                          size: 20.0, color: Colors.black)
                      : const Icon(
                          Icons.lock_outline,
                          size: 20.0,
                          color: Color(0xff373c3a80),
                        ),
                  suffixIcon: IconButton(
                    icon: Icon(isVisiblePass2
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isVisiblePass2 = !isVisiblePass2;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          width: 1.0, color: Color(0xFFEBEFF4))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: hasTextPass
                          ? const BorderSide(
                              color: Color.fromARGB(255, 13, 136, 132),
                              width: 1.0,
                            )
                          : const BorderSide(
                              color: Color.fromARGB(255, 205, 48, 48),
                              width: 1.0,
                            ))),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: (() {}), child: const Text('Forgot password'))),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(child: Container()),
            SizedBox(
              height: 54.0,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 13, 136, 132),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const DocLogin();
                      },
                    ));
                  },
                  child: const Text(
                    'Change Password',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  )),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ]),
        ),
      ),
    );
  }
}
