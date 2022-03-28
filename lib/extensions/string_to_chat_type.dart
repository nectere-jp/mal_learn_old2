import 'package:mal_learn/models/room_summary_model.dart';

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
