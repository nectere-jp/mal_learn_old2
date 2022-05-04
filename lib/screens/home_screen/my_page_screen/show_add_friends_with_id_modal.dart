import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/models/other_user_model.dart';
import 'package:mal_learn/providers/form_data_providers.dart';
import 'package:mal_learn/providers/search_result_providers.dart';
import 'package:mal_learn/widgets/show_other_user_modal.dart';

final resultProvider = StreamProvider<List<OtherUserModel>>((_) {
  return StreamController<List<OtherUserModel>>().stream;
});

void addFriendsWithId(BuildContext context, WidgetRef ref) {
  ref.read(searchIdProvider.notifier).state = null;
  showModalBottomSheet<Ink>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Ink(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: const [
              Text(
                'IDで検索',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _SearchField(),
              _SearchResultList(),
            ],
          ),
        ),
      );
    },
  );
}

class _SearchResultList extends ConsumerWidget {
  const _SearchResultList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ref.watch(searchResultStreamProvider).when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            itemBuilder: (context, index) {
              final userModel = data[index];
              return _SearchResultListTile(userModel: userModel);
            },
          );
        },
        error: (error, _) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _SearchResultListTile extends StatelessWidget {
  const _SearchResultListTile({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final OtherUserModel userModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: Image(
            image: userModel.iconProvider!,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(userModel.userName ?? ''),
      subtitle: Text(userModel.id!),
      onTap: () {
        showOtherUserModal(context, userModel);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
    );
  }
}

class _SearchField extends ConsumerWidget {
  const _SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: '追加したい友達のIDを入力',
          contentPadding: const EdgeInsets.symmetric(vertical: 2),
        ),
        style: const TextStyle(fontSize: 16),
        onChanged: (id) {
          ref.read(searchIdProvider.notifier).state = id;
        },
      ),
    );
  }
}
