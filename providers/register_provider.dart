import 'package:flutter/cupertino.dart';
import 'package:testing_connection/models/root.dart';
import '../repositories/register_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerRepositoryProvider = Provider<IRegisterRepository>((ref) => RegisterRepository());

// final registerList = FutureProvider.autoDispose<Root>((ref) async {
//   final repository = ref.watch(registerRepositoryProvider);
//   final result = await repository.fetchRegisterList();
//   return [result]; // Wrap the single Root object in a list
// });

final registerList = FutureProvider.autoDispose<List<Root>>((ref) async {
  final repository = ref.watch(registerRepositoryProvider);
  final result = await repository.fetchRegisterList();
  return result;
});

// final registerList = FutureProvider.autoDispose<Root>((ref) async {
//   final repository = ref.watch(registerRepositoryProvider);
//   final result = await repository.fetchRegisterList();
//   return result;
// });

// class RegisterFormNotifier extends Notifier<int> {
//   RegisterFormNotifier(int state) : super(state);
// }
//
//
// final registerFormProvider = ChangeNotifierProvider.autoDispose<RegisterFormNotifier>((ref) {
//   return RegisterFormNotifier(ref);
// });