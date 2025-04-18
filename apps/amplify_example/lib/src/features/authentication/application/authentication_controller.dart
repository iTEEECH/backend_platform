import 'package:amplify_example/src/core/services/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

part 'authentication_controller.g.dart';


@riverpod
Future<String?> fetchUser(Ref ref) async {
  return ref.watch(authenticationControllerProvider.notifier).user;
}

@riverpod
class AuthenticationController extends _$AuthenticationController {
  @override
  Future<AuthSession?> build() async {
    return await ref.watch(amplifyAuthProvider).Auth.fetchAuthSession();
  }

  Future<String?> get user async {
    final List<AuthUserAttribute> attributes = await ref.watch(amplifyAuthProvider).Auth.fetchUserAttributes();
    return  attributes.firstWhere(
          (attribute) => attribute.userAttributeKey == AuthUserAttributeKey.email,
    ).value;
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<AuthSession?>(() async {
       final SignInResult response = await ref.read(amplifyAuthProvider).Auth.signIn(
          username: email,
          password: password,
        );
       if(response.isSignedIn) {
         final AuthSession session = await ref.read(amplifyAuthProvider).Auth.fetchAuthSession();
         return session;
       }
       return null;
      });
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<AuthSession?>(
      () async {
        await ref.read(amplifyAuthProvider).Auth.signOut(options: SignOutOptions(globalSignOut: true));
        return null;
      },
    );
  }
}
