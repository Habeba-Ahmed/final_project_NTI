import 'package:finalproject_nti/core/widget/customelevatedbutton.dart';
import 'package:finalproject_nti/feature/auth/view/screens/signin.dart';
import 'package:finalproject_nti/feature/auth/view/widget/customdroupdownmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/style.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/myvalidator.dart';
import '../../cubit/cubit/auth_cubit.dart';
import '../../cubit/cubit/auth_state.dart';
import '../widget/customaddsocialsection.dart';
import '../widget/customheadertext.dart';
import '../widget/customtextformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nationalIdController;
  late TextEditingController genderController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    nationalIdController = TextEditingController();
    genderController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nationalIdController.dispose();
    genderController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: ListView(
            
            children: [
              CustomHeaderText(headrtText: AppText.headerTextSignUp),
        
              const SizedBox(height : 30),
        
              Column(
                spacing: 10,
                children: [
                  CustomTextFormField(
                    prefixicon: Icons.person,
                    controller: nameController,
                    hintText: 'Name',
                    validator: (val) => MyValidators.displayNamevalidator(val),
              ),
              CustomTextFormField(
                prefixicon: Icons.email_outlined,
                controller: emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (val) => MyValidators.emailValidator(val),
              ),
              CustomTextFormField(
                prefixicon: Icons.phone_android,
                controller: phoneController,
                hintText: 'Phone',
                keyboardType: TextInputType.phone,
                validator: (val) => MyValidators.phoneValidator(val),
              ),
              CustomTextFormField(
                prefixicon: Icons.picture_in_picture_alt_outlined,
                controller: nationalIdController,
                hintText: 'National ID',
                keyboardType: TextInputType.number,
                validator: (val) => MyValidators.nationalIdValidator(val),
              ),
              CustomDroupDownMenu(
                genderController: genderController,
                validator: (val) => MyValidators.genderValidator(value: val),
              ),
              CustomTextFormField(
                prefixicon: Icons.password,
                suffixicon: Icons.lock,
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                validator: (val) => MyValidators.passwordValidator(val),
              ),
                ],
              ),
              SizedBox(height : 15,),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.agreementText,
                  children: [
                    TextSpan(text: 'By clicking the '),
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(color: AppColor.secoundColor)
                    ),
                    TextSpan(text: ' button, you agree\nto the public offer'),
                  ],
                ),
              ),
        
              const SizedBox(height : 30),
        
              BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthAddSuccess) {
                  if (state.model.status == 'error') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.model.message!),
                      ),
                    );
                  }
                  if (state.model.status == 'success') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(state.model.message!),
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignIn()),
                      (route) => false,
                    );
                  }
                }
              },
              child: CustomElevatedButton(
              buttonText: 'Create Account', onPressed: (){
                context.read<AuthCubit>().registerCubit(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        nationalId: nationalIdController.text,
                        gender: genderController.text,
                        password: passwordController.text,
                      );
              }),
            ),

              
        
              SizedBox(height : 60,),
        
              Center(
                child: 
                CustomAuthSocialSection(
                  width : 250, 
                  hight : 140,
                  normalText: 'I Already Have an Account', 
                  actionText: 'Login', 
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  },)
                
                )
            ],
          ),
        ),
      ),
    );
  }
}
