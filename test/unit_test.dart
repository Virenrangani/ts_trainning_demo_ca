import 'package:flutter_test/flutter_test.dart';
import 'package:ts_training_demo_ca/core/validation/email_password_validation/email_password_validation.dart';

void main(){
  group("Email validation check", (){
    test("valid email check", (){
      final result=validateEmail("example@gmail.com");
      expect(result, isNull);
    });

    test("Invalid email check", (){
      final result=validateEmail("examplegmail.com");
      expect(result, isNotNull);
    });

    test("Email not contains the space", (){
      final result=validateEmail("example @gmail.com");
      expect(result, isNotNull);
    });
  });

  group("Password Validation check", (){
    test("valid password check", (){
      final result=validatePassword("Viren3110@");
      expect(result, isNull);
    });
    test("Password has Minimum 8 character required", (){
      final result=validatePassword("Rm12@");
      expect(result, isNotNull);
    });
    test("Password has at least one uppercase letter", (){
      final result=validatePassword("viren3110@");
      expect(result, isNotNull);
    });
    test("Password has at least one lowercase letter", (){
      final result=validatePassword("VIREN3110@");
      expect(result, isNotNull);
    });
    test("Password has at least one number", (){
      final result=validatePassword("VirenRangani@");
      expect(result, isNotNull);
    });
    test("Password has at least one special character", (){
      final result=validatePassword("Viren311020");
      expect(result, isNotNull);
    });
  });
}