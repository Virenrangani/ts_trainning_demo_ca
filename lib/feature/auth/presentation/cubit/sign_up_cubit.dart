import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_training_demo_ca/feature/auth/domain/usecase/sign_up_use_case.dart';
import 'package:ts_training_demo_ca/feature/auth/presentation/cubit/auth_state.dart';

class SignUpCubit extends Cubit<AuthState>{
  final SignUpUseCase signUpUseCase;
  SignUpCubit(this.signUpUseCase):super(AuthInitial());

  Future<void> signUp(String name,String email,String password)async{
    emit(AuthLoading());
    try{
      await signUpUseCase.signUpCall(email, name, password);
      emit(AuthSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }
}
