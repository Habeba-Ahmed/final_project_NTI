
import 'package:finalproject_nti/feature/auth/view/screens/forgetpassword.dart';
import 'package:finalproject_nti/feature/auth/view/screens/signup.dart';
import 'package:finalproject_nti/feature/lab_home/view/lap_home.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/widget/customelevatedbutton.dart';
import '../widget/customaddsocialsection.dart';
import '../widget/customheadertext.dart';
import '../widget/customtextformfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(headrtText: AppText.headerTextSignIn),

            const SizedBox(height : 30),

            CustomTextFormField(
              controller: usernameController, 
              hintText: 'Username or Email',
              prefixicon: Icons.person,
              ),

            const SizedBox(height : 20),

            CustomTextFormField(
              controller: passwordController, 
              hintText: 'Password',
              prefixicon: Icons.lock,
              suffixicon: Icons.remove_red_eye_outlined,
              obscureText: true,
              ),
            

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                },
                child: Text('Forgot Password?', style: TextStyle(color: AppColor.secoundColor,fontWeight: FontWeight.w400,fontSize: 12)),
              ),
            ),

            const SizedBox(height : 30),

            CustomElevatedButton(
            buttonText: 'Login', onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LabHome()));

            }),

            SizedBox(height : 60,),

            Center(
              child: 
              CustomAuthSocialSection(
                normalText: 'Create An Account', 
                actionText: 'Sign Up', 
                width : 194, 
                hight : 136,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                }, )
              
              )
          ],
        ),
      ),
    );
  }
}
