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