import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/repositories/auth_repository.dart';
import 'package:mal_learn/repositories/search_repository.dart';
import 'package:mal_learn/repositories/user_repository.dart';

class Repository {
  Repository(this.read, this.watch);

  final Reader read;
  final T Function<T>(AlwaysAliveProviderListenable<T>) watch;

  late final authRepository = AuthRepository(read, watch);
  late final userRepository = UserRepository(read, watch);

  late final searchRepository = SearchRepository(read, watch, userRepository);

  //auth
  late final signIn = authRepository.signIn;
  late final signUp = authRepository.signUp;

  //user
  late final fetchUserId = userRepository.fetchUserId;
  late final fetchUserName = userRepository.fetchUserName;
  late final fetchUserIcon = userRepository.fetchUserIcon;
  late final fetchUserBackgroundImage = userRepository.fetchUserBackgroundImage;
  late final makeFriendsWith = userRepository.makeFriendsWith;
  late final fetchJoinedChatRoomList = userRepository.fetchJoinedChatRoomList;

  //search
  late final searchUserById = searchRepository.searchUserById;
}
