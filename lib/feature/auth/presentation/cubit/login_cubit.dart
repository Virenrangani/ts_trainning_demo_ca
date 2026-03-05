import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/login_use_case.dart';
import 'auth_state.dart';

class LoginCubit extends Cubit<AuthState>{
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase):super(AuthInitial());

  Future<void> login(String email,String password)async{
    emit(AuthLoading());
    try{
      await loginUseCase.loginCall(email, password);
      emit(AuthSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signInWithGoogle()async{
    emit(AuthLoading());
    try{
      await loginUseCase.googleCall();
      emit(AuthSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signInWithGithub()async{
    emit(AuthLoading());
    try{
      await loginUseCase.githubCall();
      emit(AuthSuccess());
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }
}