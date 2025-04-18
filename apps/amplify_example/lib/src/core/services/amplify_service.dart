import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'amplify_service.g.dart';

@Riverpod(keepAlive: true)
AmplifyClass amplifyAuth(Ref ref) => Amplify;
