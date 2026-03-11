import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ts_training_demo_ca/core/constant/padding/custom_padding.dart';
import 'package:ts_training_demo_ca/core/widget/custom_card/custom_card.dart';
import 'package:ts_training_demo_ca/feature/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/page/sign_up_page.dart';
import '../../../../core/constant/color/custom_color.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/string/custom_string.dart';
import '../../../../core/validation/email_password_validation/email_password_validation.dart';
import '../../../../core/widget/elevated_button/custom_elevated_button.dart';
import '../../../../core/widget/inkwell_button/custom_inkwell_button.dart';
import '../../../../core/widget/snack_bar/custom_snack_bar.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';
import '../cubit/login_cubit.dart';
import '../cubit/auth_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit _loginCubit;
  String? emailError;
  String? passwordError;

  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginCubit = GetIt.instance<LoginCubit>();
  }
  @override
  void dispose(){
    _loginCubit.close();
    super.dispose();
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
        body: BlocProvider.value(
          value: _loginCubit,
          child: BlocConsumer<LoginCubit,AuthState>(
            listener: (context,state){
              if (state is AuthSuccess){
                CustomSnacksBar.showSuccess(context, CustomString.loginSuccess);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BottomNavBar()
                    ),
                        (route)=>false
                );
              }
              if (state is AuthFailure){
                CustomSnacksBar.showError(context, state.message);
              }
            },
            builder: (context, state){
              return Container(
                padding:EdgeInsets.only(top:60,left: 30,right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(CustomString.login,style: CustomTextStyles.h1,),
                    Text(CustomString.logInIntro,style: CustomTextStyles.bodySmall,),
                    SizedBox(height: 50,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formkey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Text(CustomString.email,style: CustomTextStyles.bodyLarge,),
                              SizedBox(height: 10),
                              CustomFormField(
                                  controller: emailController,
                                  labelText: CustomString.email,
                                  hintText: CustomString.emailHint,
                                  prefixIcon: Icons.mail_lock_outlined,
                                  onChanged: changedEmail,
                                  validator: (_)=>emailError
                              ),
                              SizedBox(height: 20,),
                              Text(CustomString.password,style: CustomTextStyles.bodyLarge,),
                              SizedBox(height: 10),
                              CustomFormField(
                                  controller: passwordController,
                                  labelText: CustomString.password,
                                  hintText: CustomString.passwordHint,
                                  prefixIcon: Icons.password_outlined,
                                  obscureText: true,
                                  suffixIcon: Icons.remove_red_eye_outlined,
                                  onChanged: changedPassword,
                                  validator:(_)=>passwordError
                              ),
                              SizedBox(height: 15,),
                              CustomInkwellButton(
                                text: CustomString.forgetPassword,
                                onTap: (){}, textStyle: CustomTextStyles.bodySmall,
                              ),
                              SizedBox(height: 25,),
                              state is AuthLoading ? CircularProgressIndicator():
                              CustomElevatedButton(
                                borderRadius:10,
                                width:MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.06,
                                  isLoading: state is AuthLoading,
                                  onPressed: ()async{
                                    if(_formkey.currentState!.validate()){
                                      context.read<LoginCubit>().login(
                                          emailController.text,
                                          passwordController.text
                                      );
                                    }
                                    await FirebaseAnalytics.instance.logLogin(
                                        loginMethod: CustomString.email
                                    );
                                  },
                                  text: CustomString.login,
                              ),
                              SizedBox(height: 35,),
                              Row(
                                children: [
                                  Expanded(child: Divider(thickness: 3,color: CustomColor.divider)),
                                  Padding(
                                      padding: CustomPadding.edgeAll12,
                                      child: Text("Or",style: CustomTextStyles.bodyMedium,)),
                                  Expanded(child: Divider(thickness: 3,color: CustomColor.divider))
                                ],
                              ),
                        
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height*0.1,
                                      width: MediaQuery.of(context).size.width*0.45,
                                      child: CustomCard(
                                        color1:CustomColor.textSecondary,
                                        color2: CustomColor.info,
                                        onTap:() {
                                          // context.read<LoginCubit>().signInWithGoogle();
                                        } ,
                                        icon:FontAwesomeIcons.google,
                                        title: CustomString.signInWithGoogle,
                                      )
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height*0.1,
                                      width: MediaQuery.of(context).size.width*0.40,
                                      child: CustomCard(
                                        color1:CustomColor.textSecondary,
                                        color2: CustomColor.info,
                                        onTap:() {
                                          // context.read<LoginCubit>().signInWithGoogle();
                                        } ,
                                        icon:FontAwesomeIcons.facebook,
                                        title: CustomString.signInWithFacebook,
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(height: 8,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height:50,),
                  ],
                ),
              );
            },
          ),
        ),
      bottomNavigationBar: Padding(
        padding: CustomPadding.edgeAll20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(CustomString.notAccount,style:CustomTextStyles.bodySmall,),
            CustomInkwellButton(
              text: CustomString.signUp,
              onTap:(){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>SignUpPage()));
              }, textStyle: CustomTextStyles.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
