import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/utils/utils.dart';
import 'package:reddit_clone/features/auth/auth_repository.dart';
import 'package:reddit_clone/models/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthControllar, bool>(
  (ref) => AuthControllar(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  ),
);
final authStateChangeProvider = StreamProvider((ref) {
  final authCOntroller = ref.watch(authControllerProvider.notifier);
  return authCOntroller.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthControllar extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthControllar({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false); //loddibng

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  void signInWithGoogle(
    BuildContext context,
  ) async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    state = false;
    user.fold(
      (l) => showSnackBar(context, l.message),
      (usermodel) =>
          _ref.read(userProvider.notifier).update((state) => usermodel),
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }
}
