import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) => AuthControllar(
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class AuthControllar {
  final AuthRepository _authRepository;
  AuthControllar({required AuthRepository authRepository})
      : _authRepository = authRepository;
  void signInWithGoogle() {
    _authRepository.signInWithGoogle();
  }
}
