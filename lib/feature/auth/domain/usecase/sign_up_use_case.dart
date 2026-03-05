import 'package:ts_training_demo_ca/feature/auth/domain/repository/sign_up_repository.dart';
import '../entity/user_entity.dart';

class SignUpUseCase {
  final SignUpRepository signUpRepository;
  SignUpUseCase(this.signUpRepository);

  Future<UserEntity> signUpCall(String email,String name,String password){
    return signUpRepository.signUp(email, name, password);
  }
}