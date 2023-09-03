enum AuthType { login, register, visitor }

sealed class AuthState {
  const AuthState();

  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'AuthFailure{message: $error}';
  }
}

class LogOuted extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthLoading extends AuthState {}
