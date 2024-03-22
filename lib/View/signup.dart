import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Widget/textfeild.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  var passwordVisible;
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  // final Controller getxcontroller = Get.put<Controller>(Controller());

  @override
  void dispose() {
    super.dispose();

    _email.dispose();
    _password.dispose();
    _fullname.dispose();
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text(
          'Register',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _fullname,
                        prefixIcon: Icons.alternate_email,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Email!";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        controller: _email,
                        prefixIcon: Icons.alternate_email,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Email!";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        validator: (String? password) {
                          if (password == null || password.isEmpty) {
                            return 'Please enter your password';
                          }

                          if (password.length < 6) {
                            return 'Your password is too short';
                          } else if (password.length < 8) {
                            return 'Your password is acceptable but not strong';
                          }
                          if (!letterReg.hasMatch(password) ||
                              !numReg.hasMatch(password)) {
                            return 'Add special Character and Captial and small Alphabet ';
                          } else {
                            return null;
                          }
                        },
                        controller: _password,
                        obscureText: passwordVisible,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              'fullname', _fullname.text);
                          sharedPreferences.setString('email', _email.text);

                          Get.offAll(() => const MyHomePage());
                        }
                      },
                      height: 50,
                      minWidth: 300,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.black,
                      // child: Obx(() {
                      //   return getxcontroller.isprofileloading.value
                      //       ? const CircularProgressIndicator(
                      //           strokeWidth: 3,
                      //           color: Colors.white,
                      //         )
                      //       : const Text(
                      //           "Sign-up",
                      //           style: TextStyle(
                      //             color: Colors.white,
                      //           ),
                      //         );
                      // }),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
