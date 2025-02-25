import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/resuable-comp/app_bar.dart';
import 'package:online_exam/core/resuable-comp/custom_text_field.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/core/utils/routes_manager.dart';
import 'package:online_exam/core/utils/string_manager.dart';
import 'package:online_exam/presentation/auth/signUp/view_Model/signup_view_model_cubit.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:online_exam/presentation/home/tabs/profile_tab/change_password/view/new_password.dart';
import 'package:online_exam/presentation/home/tabs/profile_tab/profile_screen/view/profile_tab_screen.dart';

class EditProfileTabScreen extends StatefulWidget {
  @override
  State<EditProfileTabScreen> createState() => _EditProfileTabScreenState();
}

class _EditProfileTabScreenState extends State<EditProfileTabScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextInputType textInputType = TextInputType.text;
  TextInputType emailInputType = TextInputType.emailAddress;
  TextInputType phoneInputType = TextInputType.phone;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choose an option",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.camera, size: 30),
              title: const Text("Take a photo", style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.photo_library, size: 30),
              title: const Text("Choose from gallery",
                  style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    usernameController.text = "اسم المستخدم الافتراضي";
    firstNameController.text = "الاسم الأول";
    lastNameController.text = "الاسم الأخير";
    passwordController.text = "111111";
    emailController.text = "example@email.com";
    phoneController.text = "0123456789";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<SignupViewModelCubit>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBarWidget(
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileTabScreen()),
                      );
                    },
                    title: 'Edit profile',
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: _selectedImage != null
                            ? FileImage(_selectedImage!)
                            : null,
                        child: _selectedImage == null
                            ? const Icon(Icons.person,
                                size: 50, color: ColorManager.labelLarge)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _showImagePicker,
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorManager.primaryColor,
                            child: Icon(Icons.camera_alt,
                                size: 22,
                                color: ColorManager.backgroundBottomNavBar),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomTextField(
                    labelText: "User name",
                    hintText: "Enter your user name",
                    controller: usernameController,
                    keyboard: textInputType,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'This user name is not valid';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "First name",
                          hintText: "Enter first name",
                          controller: firstNameController,
                          keyboard: textInputType,
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'This first name is not valid';
                            }
                            return null;
                          },
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Last name",
                          hintText: "Enter last name",
                          controller: lastNameController,
                          keyboard: textInputType,
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'This last name is not valid';
                            }
                            return null;
                          },
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: "Email",
                    hintText: "Enter your email",
                    controller: emailController,
                    keyboard: emailInputType,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'This email is not valid';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CustomTextField(
                        labelText: "Password",
                        hintText: "Enter password",
                        controller: passwordController,
                        keyboard: TextInputType.text,
                        validator: (data) =>
                            data!.isEmpty ? 'This password is not valid' : null,
                        obscureText: true,
                        obscuringCharacter: "*",
                      ),
                      Positioned(
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen(
                                    passwordController.text),
                              ),
                            );
                          },
                          child: const Text(
                            "Change",
                            style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeight.bold,
                                decorationThickness: 2.0),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: "Phone number",
                    hintText: "Enter phone number",
                    controller: phoneController,
                    keyboard: phoneInputType,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'This phone number is not valid';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  BlocConsumer<SignupViewModelCubit, SignupViewModelState>(
                    listener: (context, state) {
                      if (state is SignupSuccess) {
                        Fluttertoast.showToast(
                          msg: "Signup is Success",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteManager.homeScreen, (route) => false);
                      }
                      if (state is SignupErorr) {
                        Fluttertoast.showToast(
                          msg: state.ErrorMessage,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is Signuploading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomTextButton(
                        text: StringManager.update,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileTabScreen()));
                        },
                      );
                    },
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
