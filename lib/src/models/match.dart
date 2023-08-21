// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nakama/nakama.dart';
import 'package:nakama/src/api/api.dart' as api;
import 'package:nakama/src/api/rtapi.dart' as rtpb;

part 'match.g.dart';
part 'match.freezed.dart';

@freezed
class Match with _$Match {
  const Match._();

  const factory Match({
    @JsonKey(name: 'match_id') required String matchId,
    required bool authoritative,
    required String label,
    @Default(0) int size,
    @JsonKey(name: 'tick_rate') int? tickRate,
    @JsonKey(name: 'handler_name') String? handlerName,
    @Default([]) List<UserPresence> presences,
  }) = _Match;

  factory Match.fromJson(Map<String, Object?> json) => _$MatchFromJson(json);

  factory Match.fromDto(api.Match dto) => Match(
        matchId: dto.matchId,
        authoritative: dto.authoritative,
        handlerName: dto.handlerName,
        label: dto.label.value,
        size: dto.size,
        tickRate: dto.tickRate,
        presences: [],
      );

  factory Match.fromRtpb(rtpb.Match dto) => Match(
        matchId: dto.matchId,
        authoritative: dto.authoritative,
        label: dto.label.value,
        size: dto.size,
        presences: dto.presences
            .map((e) => UserPresence.fromDto(e))
            .toList(growable: false),
      );
}

@freezed
class Party with _$Party {
  const Party._();

  const factory Party({
    /// Unique party identifier.
    required String partyId,

    /// Open flag.
    required bool open,

    /// Maximum number of party members.
    required int maxSize,

    /// Self.
    required UserPresence self,

    /// Leader.
    required UserPresence leader,

    /// All current party members.
    required List<UserPresence> presences,
  }) = _Party;

  factory Party.fromDto(rtpb.Party dto) => Party(
        partyId: dto.partyId,
        open: dto.open,
        maxSize: dto.maxSize,
        self: UserPresence.fromDto(dto.self),
        leader: UserPresence.fromDto(dto.leader),
        presences: dto.presences
            .map((e) => UserPresence.fromDto(e))
            .toList(growable: false),
      );
}
