import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/resuable-comp/app_bar.dart';
import 'package:online_exam/core/resuable-comp/custom_text_field.dart';
import 'package:online_exam/core/resuable-comp/text_button.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:online_exam/data/model/profile_tab/image_provider_model.dart';
import 'package:online_exam/data/model/profile_tab/user_profile.dart';
import 'package:online_exam/domain/entity/profile_tab/profile_entry/profile_response_entity.dart';
import 'package:online_exam/presentation/home/tabs/profile_tab/change_password/view/new_password.dart';
import 'package:online_exam/presentation/home/tabs/profile_tab/edit_profile_screen/view_model/edit_profile_view_model_cubit.dart';
import 'package:online_exam/presentation/home/tabs/profile_tab/profile_screen/view_model/profile_screen_view_model_cubit.dart';
import 'package:provider/provider.dart';

class EditProfileTabScreen extends StatefulWidget {
  final String userId;

  const EditProfileTabScreen({required this.userId, super.key});

  @override
  State<EditProfileTabScreen> createState() => _EditProfileTabScreenState();
}

class _EditProfileTabScreenState extends State<EditProfileTabScreen> {
  late TextEditingController usernameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  TextInputType textInputType = TextInputType.text;
  TextInputType emailInputType = TextInputType.emailAddress;
  TextInputType phoneInputType = TextInputType.phone;

  late UserProfile userProfile;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    _fetchProfileData();
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _fetchProfileData() async {
    var response = await getIt<ProfileScreenViewModelCubit>()
        .getProfileInfoUsecase
        .call(id: widget.userId);

    if (response is SuccessApiResult<ProfileResponseEntity> &&
        response.data?.user != null) {
      setState(() {
        userProfile = UserProfile.fromEntity(response.data!.user!);
        usernameController.text = userProfile.username ?? "";
        firstNameController.text = userProfile.firstName ?? "";
        lastNameController.text = userProfile.lastName ?? "";
        emailController.text = userProfile.email ?? "";
        phoneController.text = userProfile.phone ?? "";
        passwordController.text = "********";
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
        msg: "Error fetching profile data",
        backgroundColor: Colors.red,
      );
    }
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Consumer<ImageProviderModel>(
        builder: (context, imageProvider, child) => Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            children: [
              const Text(
                "Choose an option",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.camera, size: 30),
                title:
                    const Text("Take a photo", style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  imageProvider.pickImage(ImageSource.camera);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.photo_library, size: 30),
                title: const Text("Choose from gallery",
                    style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  imageProvider.pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<EditProfileViewModelCubit>(),
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
                      Navigator.pop(context, true);
                    },
                    title: 'Edit profile',
                  ),
                  Consumer<ImageProviderModel>(
                    builder: (context, imageProvider, child) => Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage: imageProvider.selectedImage != null
                              ? FileImage(imageProvider.selectedImage!)
                              : null,
                          child: imageProvider.selectedImage == null
                              ? const Icon(Icons.person,
                                  size: 50, color: ColorManager.labelLarge)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _showImagePicker(context),
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
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomTextField(
                    labelText: "User name",
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
                        controller: passwordController,
                        obscuringCharacter: "*",
                        obscureText: true,
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
                  BlocConsumer<EditProfileViewModelCubit,
                      EditProfileViewModelState>(
                    listener: (context, state) {
                      if (state is EditProfileSuccess) {
                        Fluttertoast.showToast(
                            msg: "✅ Profile updated",
                            backgroundColor: Colors.green);
                        Navigator.pop(context, true);
                      } else if (state is EditProfileErorr) {
                        Fluttertoast.showToast(
                            msg: state.message, backgroundColor: Colors.red);
                      }
                    },
                    builder: (context, state) {
                      if (state is EditProfileloading) {
                        return const CircularProgressIndicator();
                      }
                      return CustomTextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            EditProfileViewModelCubit.get(context)
                                .putEditProfile(
                              id: widget.userId,
                              username: usernameController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                        text: 'Update',
                        color: ColorManager.primaryColor,
                        textColor: ColorManager.backgroundBottomNavBar,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
