import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //svg image
              SvgPicture.asset(
                'assets/instaname.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              //Text field input for email
              TextFieldInput(
                textEditingController: _emailEditingController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _passwordEditingController,
                hintText: "Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Text("Log in"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: blueColor),
                ),
              ),
              SizedBox(height: 30),
              Flexible(child: Container(), flex: 2),
              Divider(color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "Sign up.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  ),
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
