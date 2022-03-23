import 'package:flutter/material.dart';

class RoomSummaryModel {
  RoomSummaryModel({
    this.name,
    this.icon,
    this.lastMessageAt,
    this.lastMessage,
    this.id,
  });

  final String? name;
  final Image? icon;
  final DateTime? lastMessageAt;
  final String? lastMessage;
  final String? id;
}
