// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserHash() => r'84fd09bb72c563cef2ab03b852b11404076a6e61';

/// See also [fetchUser].
@ProviderFor(fetchUser)
final fetchUserProvider = AutoDisposeFutureProvider<String?>.internal(
  fetchUser,
  name: r'fetchUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchUserRef = AutoDisposeFutureProviderRef<String?>;
String _$authenticationControllerHash() =>
    r'f1861c6112c75dc006a2a2190d0b6336e9dd8429';

/// See also [AuthenticationController].
@ProviderFor(AuthenticationController)
final authenticationControllerProvider = AutoDisposeAsyncNotifierProvider<
    AuthenticationController, AuthSession?>.internal(
  AuthenticationController.new,
  name: r'authenticationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthenticationController = AutoDisposeAsyncNotifier<AuthSession?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
