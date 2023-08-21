// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Match _$$_MatchFromJson(Map<String, dynamic> json) => _$_Match(
      matchId: json['match_id'] as String,
      authoritative: json['authoritative'] as bool,
      label: json['label'] as String,
      size: json['size'] as int? ?? 0,
      tickRate: json['tick_rate'] as int?,
      handlerName: json['handler_name'] as String?,
      presences: (json['presences'] as List<dynamic>?)
              ?.map((e) => UserPresence.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MatchToJson(_$_Match instance) => <String, dynamic>{
      'match_id': instance.matchId,
      'authoritative': instance.authoritative,
      'label': instance.label,
      'size': instance.size,
      'tick_rate': instance.tickRate,
      'handler_name': instance.handlerName,
      'presences': instance.presences,
    };
