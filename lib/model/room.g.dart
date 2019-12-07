// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    json['id'] as String,
    json['name'] as String,
    json['author'] as String,
    members: (json['members'] as List)?.map((e) => e as String)?.toList(),
    lastMessageId: json['last_message_id'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'members': instance.members,
      'last_message_id': instance.lastMessageId,
      'timestamp': instance.timestamp,
    };
