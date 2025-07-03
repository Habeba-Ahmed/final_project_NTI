// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 30),

//               // AppBar-like top section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text(
//                     "J. Bravo",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   Text("Login", style: TextStyle(fontSize: 16)),
//                 ],
//               ),

//               const SizedBox(height: 60),

//               // Headline
//               const Text(
//                 "Welcome Back",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   height: 1.2,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "Sign in to continue",
//                 style: TextStyle(fontSize: 16, color: Colors.black54),
//               ),

//               const SizedBox(height: 40),

//               // Email TextField
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   border: const OutlineInputBorder(),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Password TextField
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   border: const OutlineInputBorder(),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Login Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Colors.black),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Optional image at bottom
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Image.network(
//                     'https://www.bing.com/ck/a?!&&p=f45ce8f20ac705e6f1541bb2c287c612b3916dcf225c800e0d81cb2e2a87fb23JmltdHM9MTc1MTQxNDQwMA&ptn=3&ver=2&hsh=4&fclid=3b5088d4-afd6-6ed1-3770-9cf1aebd6fac&u=a1L2ltYWdlcy9zZWFyY2g_cT1wbmcraW1hZ2VzJmlkPTkwRUI3MEQ0RTMwODg0RkUzNDlFOTMyM0YwNjNEMDAxQTJBMkVFRDAmRk9STT1JQUNGSVI&ntb=1', // Replace with your image
//                     height : 200,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
