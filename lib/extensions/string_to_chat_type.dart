import 'package:mal_learn/models/chat_room_model.dart';

extension ToChatType on String {
  ChatType? toChatType() {
    switch (this) {
      case 'dm':
        return ChatType.dm;
      case 'group':
        return ChatType.group;
      default:
        return null;
    }
  }
}
