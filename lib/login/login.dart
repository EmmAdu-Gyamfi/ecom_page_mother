import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page/global/theme.dart';
import 'package:page/global/typedef.dart';

import '../widget/textformfield_validator.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        ///place in container with a maxSize
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              // boxShadow:  [
              //   BoxShadow(
              //     color: Types.colourBlack,
              //     blurRadius: 20.0,
              //     offset: Offset(0, 1),
              //   ),
              // ],
              color: Types.colourApp
            ),
            constraints:const BoxConstraints(maxWidth: Types.doubleInfinity),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all( Types.paddingMedium),
                    child: Container(
                      width: double.infinity,
                      height: Types.doubleInfinity,
                      decoration: const BoxDecoration(color: Types.colourApp),

                      child: const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Icon(FontAwesomeIcons.creditCard,size: 50,),
                      ),
                    ),
                  ),


                  ///WELCOME BACK AREA
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "Welcome Back",
                          style: GoogleFonts.urbanist(
                            color: Types.colourBlack,
                            fontSize: 28,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 24),
                        child: Text('Let\'s get started by filling out the form below.', style: TextStyles.textInputStyle),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: TextFormFieldCustom(hintText: "Email", controller: textController, errorMessage: 'Invalid Email', validator: Types.nameRegExp),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: TextFormFieldCustom(hintText: "Password",activatePasswordField: true, controller: textController, errorMessage: 'Invalid password', validator: Types.passwordRegExp),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4B39EF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          onPressed: () {
                           var hi =  textController.text;
                            print("hi");
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // Generated code for this dividerOR Widget...
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 24),
                        child: Container(
                          width: 370,
                          child: Stack(
                            alignment: const AlignmentDirectional(0, 0),
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                  child: Container(
                                    width: double.infinity,
                                    height: 2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF1F4F8),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Container(
                                  width: 70,
                                  height: 32,
                                  decoration: const BoxDecoration(color: Colors.white),
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Text(
                                    'OR',
                                    style: GoogleFonts.plusJakartaSans(
                                      color: const Color(0xFF57636C),
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFF101213),
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          onPressed: () {
                            print("hi");
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.google, size: 20, color: Colors.black),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Continue with Google", style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

