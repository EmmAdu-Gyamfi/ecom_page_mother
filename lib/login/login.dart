import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page/global/theme.dart';
import 'package:page/global/typedef.dart';
import '../widget/text_form_field.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth =Types.maxWidth;

    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        ///place in container with a maxSize
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              // boxShadow:  [
              //   BoxShadow(
              //     color: Types.colourBlack,
              //     blurRadius: 20.0,
              //     offset: Offset(0, 1),
              //   ),
              // ],
              color: Types.colourWhite
            ),
            constraints:BoxConstraints(maxWidth: Types.maxWidth),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all( Types.paddingMedium),
                    child: Container(
                      width: double.infinity,
                      height: Types.height100,
                      decoration: BoxDecoration(


                        color: Types.colourWhite
                      ),

                      child: Padding(
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
                        child: Text(
                            'Let\'s get started by filling out the form below.',
                            style: TextStyles.textH6
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: textFormField(hintText: "Email",textInputType: TextInputType.emailAddress, ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: textFormField(hintText: "Password",activatePasswordField: true, ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4B39EF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          onPressed: () {
                            print("hi");
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // Generated code for this dividerOR Widget...
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 24),
                        child: Container(
                          width: 370,
                          child: Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                  child: Container(
                                    width: double.infinity,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F4F8),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: 70,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    'OR',
                                    style: GoogleFonts.plusJakartaSans(
                                      color: Color(0xFF57636C),
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
                              color: Color(0xFF101213),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.google,
                                size: 20,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Continue with Google",
                                  style: TextStyle(color: Colors.black),
                                ),
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

