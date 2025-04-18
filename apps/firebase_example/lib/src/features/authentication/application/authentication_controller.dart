import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/src/core/services/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_controller.g.dart';

@riverpod
class AuthenticationController extends _$AuthenticationController {
  @override
  Stream<User?> build() => ref.watch(firebaseAuthProvider).authStateChanges();

  User? get user => ref.watch(firebaseAuthProvider).currentUser;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<User?>(
      () async {
        final UserCredential credential = await ref.read(firebaseAuthProvider).signInWithEmailAndPassword(
              email: email,
              password: password,
            );
        return credential.user;
      },
    );
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<User?>(
      () async {
        await ref.read(firebaseAuthProvider).signOut();
        return null;
      },
    );
  }
}
