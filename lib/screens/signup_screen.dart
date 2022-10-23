import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _bioEditingController = TextEditingController();
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
              Flexible(child: Container(), flex: 2),
              SvgPicture.asset("assets/instaname.svg",
                  color: primaryColor, height: 64),
              SizedBox(height: 34),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1666356237044-ed1497da256f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60"),
                    radius: 64,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _usernameEditingController,
                hintText: "Enter your username",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _emailEditingController,
                hintText: "Enter your email",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _passwordEditingController,
                hintText: "Enter your Password",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _bioEditingController,
                hintText: "Enter your bio",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Text("Sign up"),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: blueColor),
                  width: double.infinity,
                ),
              ),
              Flexible(child: Container(), flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
