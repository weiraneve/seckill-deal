enum AuthType { login, register, visitor }

sealed class AuthState {
  const AuthState();

  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthFailure extends AuthState {
  final String? error;

  const AuthFailure({this.error});
}

class LogOuted extends AuthState {}

class AuthSuccess extends AuthState {
  final String? msg;

  AuthSuccess(this.msg);
}

class AuthLoading extends AuthState {}
