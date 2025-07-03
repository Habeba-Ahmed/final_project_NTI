
import 'package:finalproject_nti/feature/auth/view/screens/signin.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/style.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/widget/customelevatedbutton.dart';
import '../widget/customheadertext.dart';
import '../widget/customtextformfield.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(headrtText: AppText.headerTextforgetPassword),

            const SizedBox(height : 30),

            CustomTextFormField(
              controller: emailController, 
              hintText: 'Enter your email address',
              prefixicon: Icons.email,
              ),
            const SizedBox(height : 20),

          RichText(
              text: TextSpan(
                style: AppTextStyle.agreementText,
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(color: AppColor.secoundColor)
                  ),
                  TextSpan(text: ' We will send you a message to set or reset \nyour new password'),
                ],
              ),
            ),

            const SizedBox(height : 30),

            CustomElevatedButton(
            buttonText: 'Submit', onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
            }),

          ],
        ),
      ),
    );
  }
}
