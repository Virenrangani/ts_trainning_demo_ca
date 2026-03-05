import 'package:ts_training_demo_ca/feature/auth/domain/entity/user_entity.dart';

abstract class SignUpRepository{
  Future<UserEntity> signUp(String email,String name,String password);
}