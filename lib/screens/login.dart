import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import '../models/api_response.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import 'nav.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Nav()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          // padding: EdgeInsets.all(32),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),

          children: [
            Image.asset(
              'images/logo.png',
              height: 100,
            ), // Update with your logo path

            SizedBox(height: 16),
            // Your brand name or app name
            Align(
              alignment: Alignment.center,
              child: Text(
                'Thin U',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: txtEmail,
                validator: (val) =>
                val!.isEmpty ? 'Invalid email address' : null,
                decoration: kInputDecoration('Email')),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: txtPassword,
                obscureText: true,
                validator: (val) =>
                val!.length < 6 ? 'Required at least 6 chars' : null,
                decoration: kInputDecoration('Password')),
            SizedBox(
              height: 10,
            ),
            loading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : kTextButton('Login', () {
              if (formkey.currentState!.validate()) {
                setState(() {
                  loading = true;
                  _loginUser();
                });
              }
            }),
            SizedBox(
              height: 10,
            ),
            kLoginRegisterHint('Dont have an account? ', 'Register', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Register()),
                      (route) => false);
            })
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'nav.dart';
//
//
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blue, Colors.purple], // Adjust gradient colors
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//
//                 Image.asset(
//                   'images/logo.png', // Update with your logo path
//                   height: 100,
//                 ),
//                 SizedBox(height: 16),
//                 // Your brand name or app name
//                 const Text(
//                   'Thin U',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // TextFields for username and password
//                 TextField(
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     labelText: 'Username',
//                     labelStyle: TextStyle(color: Colors.white),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextField(
//                   style: TextStyle(color: Colors.white),
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: TextStyle(color: Colors.white),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // Login button
//                 ElevatedButton(
//                   onPressed: () {
//                     // TODO: Implement login logic
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => Nav()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // Sign up option
//                 TextButton(
//                   onPressed: () {
//                     // TODO: Implement sign-up navigation
//                   },
//                   child: Text(
//                     'Don\'t have an account? Sign Up',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
