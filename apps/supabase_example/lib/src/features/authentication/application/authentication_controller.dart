import 'package:supabase_example/src/core/services/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_controller.g.dart';

@riverpod
class AuthenticationController extends _$AuthenticationController {
  @override
  Stream<AuthState?> build() => ref.watch(supabaseAuthProvider).auth.onAuthStateChange;

  User? get user => ref.watch(supabaseAuthProvider).auth.currentUser;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<AuthState?>(
          () async {
        final AuthResponse response = await ref.read(supabaseAuthProvider).auth.signInWithPassword(
          email: email,
          password: password,
        );
        return AuthState(AuthChangeEvent.signedIn, response.session);
      },
    );
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<AuthState?>(
      () async {
        await ref.read(supabaseAuthProvider).auth.signOut(scope: SignOutScope.global);
        return null;
      },
    );
  }
}
