import 'package:finalproject_nti/core/myvalidator.dart';
import 'package:finalproject_nti/feature/auth/cubit/cubit/auth_cubit.dart';
import 'package:finalproject_nti/feature/auth/cubit/cubit/auth_state.dart';
import 'package:finalproject_nti/feature/auth/view/screens/login.dart';
import 'package:finalproject_nti/feature/auth/view/widget/customdroupdownmenu.dart';
import 'package:finalproject_nti/feature/auth/view/widget/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width : 100,
                  height : 100,
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom : 10,
                  right : 10,
                  child: const Icon(Icons.camera_alt_outlined,color: Colors.white,)),
              ],
            ),
            const SizedBox(height : 20),
            CustomTextField(
              controller: nameController,
              hintText: 'Name',
              validator: (val) => MyValidators.displayNamevalidator(val),
            ),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (val) => MyValidators.emailValidator(val),
            ),
            CustomTextField(
              controller: phoneController,
              hintText: 'Phone',
              keyboardType: TextInputType.phone,
              validator: (val) => MyValidators.phoneValidator(val),
            ),
            CustomTextField(
              controller: nationalIdController,
              hintText: 'National ID',
              keyboardType: TextInputType.number,
              validator: (val) => MyValidators.nationalIdValidator(val),
            ),
            CustomDroupDownMenu(
              genderController: genderController,
              validator: (val) => MyValidators.genderValidator(value: val),
            ),
            const SizedBox(height : 12),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              validator: (val) => MyValidators.passwordValidator(val),
            ),
            const SizedBox(height : 20),
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
                          builder: (context) => const LogIn()),
                      (route) => false,
                    );
                  }
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().registerCubit(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        nationalId: nationalIdController.text,
                        gender: genderController.text,
                        password: passwordController.text,
                      );
                },
                child: const Text('Register'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
