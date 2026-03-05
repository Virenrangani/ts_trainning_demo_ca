import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import 'package:ts_training_demo_ca/core/validation/email_password_validation/email_password_validation.dart';
import 'package:ts_training_demo_ca/core/widget/inkwell_button/custom_inkwell_button.dart';
import 'package:ts_training_demo_ca/core/widget/snack_bar/custom_snack_bar.dart';
import 'package:ts_training_demo_ca/feature/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ts_training_demo_ca/feature/dashboard/presentation/pages/dashboard.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/page/login_page.dart';
import '../../../../core/widget/elevated_button/custom_elevated_button.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';
import '../cubit/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  String? emailError;
  String? passwordError;

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   late final SignUpCubit _signUpCubit;
  @override
  void initState(){
    super.initState();
    _signUpCubit = GetIt.instance<SignUpCubit>();

  }
  void changedEmail(String value){
    setState(() {
      emailError=validateEmail(value);
    });
  }

  void changedPassword(String value){
    setState(() {
      passwordError=validatePassword(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (_)=>_signUpCubit,
          child: BlocConsumer<SignUpCubit,AuthState>(
              listener: (context,state)async{
                if (state is AuthFailure) {
                  CustomSnacksBar.showError(context, state.message);
                }
                if(state is AuthSuccess){
                  CustomSnacksBar.showSuccess(context, CustomString.signSuccess);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context)=>BottomNavBar()),
                      (route)=>false
                  );
                }
              },

              builder: (context,state){
                return SafeArea(
                  child: Container(
                      padding:EdgeInsets.only(top:60,left: 30,right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(CustomString.signUp,style: CustomTextStyles.h1,),
                          Text(CustomString.signUpEntro,style: CustomTextStyles.bodyMedium),
                          SizedBox(height: 50,),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Form(
                                  key: _formkey,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(CustomString.name,style: CustomTextStyles.bodyLarge,),
                                        SizedBox(height: 7,),
                                        CustomFormField(
                                          controller: nameController,
                                          labelText: CustomString.name,
                                          hintText: CustomString.nameHint,
                                          prefixIcon: Icons.person_2_outlined,
                                        ),
                                        SizedBox(height: 15,),
                                        Text(CustomString.email,style: CustomTextStyles.bodyLarge,),
                                        SizedBox(height: 7,),
                                        CustomFormField(
                                          controller: emailController,
                                          labelText:CustomString.email ,
                                          hintText:CustomString.emailHint,
                                          prefixIcon: Icons.mail_outline,
                                          validator:(_)=>emailError,
                                          onChanged: changedEmail,
                                        ),
                                        SizedBox(height: 15,),
                                        Text(CustomString.password,style: CustomTextStyles.bodyLarge,),
                                        SizedBox(height: 7,),
                                        CustomFormField(
                                            controller: passwordController,
                                            labelText: CustomString.password,
                                            hintText: CustomString.passwordHint,
                                            obscureText: true,
                                            suffixIcon: Icons.remove_red_eye_outlined,
                                            prefixIcon: Icons.password_outlined,
                                            validator: (_)=>passwordError,
                                            onChanged: changedPassword,
                                        ),
                                        SizedBox(height: 35,),
                                                
                                        state is AuthLoading ? CircularProgressIndicator() :
                                        CustomElevatedButton(
                                            borderRadius:10,
                                            width:MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height*0.06,
                                            isLoading: state is AuthLoading,
                                            onPressed: ()async{
                                              if(_formkey.currentState!.validate()){
                                                context.read<SignUpCubit>().signUp(
                                                   nameController.text,
                                                   emailController.text,
                                                   passwordController.text,
                                                );
                                                await FirebaseAnalytics.instance.logSignUp(
                                                    signUpMethod:CustomString.signupCrash
                                                );
                                              }
                                            }, text: CustomString.signUp
                                        ),
                              
                                      ]
                                  )
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(CustomString.alreadyHaveAccount,style:CustomTextStyles.bodySmall,),
                              CustomInkwellButton(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=>LoginPage())
                                  );
                                }, text: CustomString.login,
                                textStyle: CustomTextStyles.bodyMedium,
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                );
              }
          ),
        )
    );
  }
}
