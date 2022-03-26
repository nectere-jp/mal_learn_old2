import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/repositories/repository.dart';

final repositoryProvider = Provider((ref) => Repository(ref.read, ref.watch));
