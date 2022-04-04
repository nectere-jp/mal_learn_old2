import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/form_data_providers.dart';
import 'package:mal_learn/providers/repository_provider.dart';

final searchResultStreamProvider = StreamProvider((ref) {
  final repository = ref.watch(repositoryProvider);
  final id = ref.watch(searchIdProvider);

  return repository.getUserListWithId(id);
});
