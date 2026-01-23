import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';




class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginPressed>((event, emit) {
      emit(AuthLoading());
      emit(AuthSuccess());
    });
    on<SignUpPressed>((event, emit) {
      emit(AuthLoading());
      emit(AuthSuccess());
    });

    on<ResetPasswordPressed>((event, emit) {
      emit(AuthLoading());
      emit(AuthSuccess());
    });
  }
}


abstract class AuthEvent extends Equatable {
  List<Object> get props => [];

}


class LoginPressed extends AuthEvent {}




abstract class AuthState extends Equatable {
  List<Object> get props => [];
}


class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {}
class SignUpPressed extends AuthEvent {}
class ResetPasswordPressed extends AuthEvent {}
