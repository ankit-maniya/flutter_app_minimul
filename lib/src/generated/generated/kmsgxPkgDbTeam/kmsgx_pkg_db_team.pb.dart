//
//  Generated code. Do not modify.
//  source: kmsgx_pkg_db_team.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:kmsgx/google/protobuf/empty.pb.dart' as $0;
import 'kmsgx_pkg_db_team.enum.pbenum.dart' as $1;

export 'kmsgx_pkg_db_team.enum.pb.dart';
export 'kmsgx_pkg_db_team.pbenum.dart';

/// Request_Team_List
class Request_Team_List extends $pb.GeneratedMessage {
  factory Request_Team_List({
    $0.Empty? empty,
  }) {
    final $result = create();
    if (empty != null) {
      $result.empty = empty;
    }
    return $result;
  }
  Request_Team_List._() : super();
  factory Request_Team_List.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_Team_List.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_Team_List', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOM<$0.Empty>(1, _omitFieldNames ? '' : 'empty', subBuilder: $0.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_Team_List clone() => Request_Team_List()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_Team_List copyWith(void Function(Request_Team_List) updates) => super.copyWith((message) => updates(message as Request_Team_List)) as Request_Team_List;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_Team_List create() => Request_Team_List._();
  Request_Team_List createEmptyInstance() => create();
  static $pb.PbList<Request_Team_List> createRepeated() => $pb.PbList<Request_Team_List>();
  @$core.pragma('dart2js:noInline')
  static Request_Team_List getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_Team_List>(create);
  static Request_Team_List? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Empty get empty => $_getN(0);
  @$pb.TagNumber(1)
  set empty($0.Empty v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmpty() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmpty() => clearField(1);
  @$pb.TagNumber(1)
  $0.Empty ensureEmpty() => $_ensure(0);
}

/// message for basic team information
class team_info_basic extends $pb.GeneratedMessage {
  factory team_info_basic({
    $core.String? dbTeamId,
    $1.e_TEAM_TYPE? teamType,
    $core.String? friendlyName,
    $core.String? imageUrl,
  }) {
    final $result = create();
    if (dbTeamId != null) {
      $result.dbTeamId = dbTeamId;
    }
    if (teamType != null) {
      $result.teamType = teamType;
    }
    if (friendlyName != null) {
      $result.friendlyName = friendlyName;
    }
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    return $result;
  }
  team_info_basic._() : super();
  factory team_info_basic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory team_info_basic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'team_info_basic', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbTeamId')
    ..e<$1.e_TEAM_TYPE>(2, _omitFieldNames ? '' : 'teamType', $pb.PbFieldType.OE, defaultOrMaker: $1.e_TEAM_TYPE.PUBLIC, valueOf: $1.e_TEAM_TYPE.valueOf, enumValues: $1.e_TEAM_TYPE.values)
    ..aOS(3, _omitFieldNames ? '' : 'friendlyName')
    ..aOS(4, _omitFieldNames ? '' : 'imageUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  team_info_basic clone() => team_info_basic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  team_info_basic copyWith(void Function(team_info_basic) updates) => super.copyWith((message) => updates(message as team_info_basic)) as team_info_basic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static team_info_basic create() => team_info_basic._();
  team_info_basic createEmptyInstance() => create();
  static $pb.PbList<team_info_basic> createRepeated() => $pb.PbList<team_info_basic>();
  @$core.pragma('dart2js:noInline')
  static team_info_basic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<team_info_basic>(create);
  static team_info_basic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbTeamId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbTeamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbTeamId() => clearField(1);

  @$pb.TagNumber(2)
  $1.e_TEAM_TYPE get teamType => $_getN(1);
  @$pb.TagNumber(2)
  set teamType($1.e_TEAM_TYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeamType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeamType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get friendlyName => $_getSZ(2);
  @$pb.TagNumber(3)
  set friendlyName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFriendlyName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFriendlyName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get imageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set imageUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageUrl() => clearField(4);
}

/// Reply_Team_List is used to reply with team list
class Reply_Team_List extends $pb.GeneratedMessage {
  factory Reply_Team_List({
    $core.Iterable<team_info_basic>? teamInfo,
  }) {
    final $result = create();
    if (teamInfo != null) {
      $result.teamInfo.addAll(teamInfo);
    }
    return $result;
  }
  Reply_Team_List._() : super();
  factory Reply_Team_List.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_Team_List.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_Team_List', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..pc<team_info_basic>(1, _omitFieldNames ? '' : 'teamInfo', $pb.PbFieldType.PM, subBuilder: team_info_basic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_Team_List clone() => Reply_Team_List()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_Team_List copyWith(void Function(Reply_Team_List) updates) => super.copyWith((message) => updates(message as Reply_Team_List)) as Reply_Team_List;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_Team_List create() => Reply_Team_List._();
  Reply_Team_List createEmptyInstance() => create();
  static $pb.PbList<Reply_Team_List> createRepeated() => $pb.PbList<Reply_Team_List>();
  @$core.pragma('dart2js:noInline')
  static Reply_Team_List getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_Team_List>(create);
  static Reply_Team_List? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<team_info_basic> get teamInfo => $_getList(0);
}

/// Request_Team_Members is used to request for team members
class Request_Team_Members extends $pb.GeneratedMessage {
  factory Request_Team_Members({
    $core.String? dbTeamId,
  }) {
    final $result = create();
    if (dbTeamId != null) {
      $result.dbTeamId = dbTeamId;
    }
    return $result;
  }
  Request_Team_Members._() : super();
  factory Request_Team_Members.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_Team_Members.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_Team_Members', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbTeamId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_Team_Members clone() => Request_Team_Members()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_Team_Members copyWith(void Function(Request_Team_Members) updates) => super.copyWith((message) => updates(message as Request_Team_Members)) as Request_Team_Members;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_Team_Members create() => Request_Team_Members._();
  Request_Team_Members createEmptyInstance() => create();
  static $pb.PbList<Request_Team_Members> createRepeated() => $pb.PbList<Request_Team_Members>();
  @$core.pragma('dart2js:noInline')
  static Request_Team_Members getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_Team_Members>(create);
  static Request_Team_Members? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbTeamId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbTeamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbTeamId() => clearField(1);
}

/// message for basic team member information
class team_member_basic extends $pb.GeneratedMessage {
  factory team_member_basic({
    $core.String? dbUserId,
    $core.String? friendlyName,
    $core.String? imageUrl,
    $1.e_ROLE_STATUS? roleStatus,
  }) {
    final $result = create();
    if (dbUserId != null) {
      $result.dbUserId = dbUserId;
    }
    if (friendlyName != null) {
      $result.friendlyName = friendlyName;
    }
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    if (roleStatus != null) {
      $result.roleStatus = roleStatus;
    }
    return $result;
  }
  team_member_basic._() : super();
  factory team_member_basic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory team_member_basic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'team_member_basic', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbUserId')
    ..aOS(2, _omitFieldNames ? '' : 'friendlyName')
    ..aOS(3, _omitFieldNames ? '' : 'imageUrl')
    ..e<$1.e_ROLE_STATUS>(4, _omitFieldNames ? '' : 'roleStatus', $pb.PbFieldType.OE, defaultOrMaker: $1.e_ROLE_STATUS.OWNER, valueOf: $1.e_ROLE_STATUS.valueOf, enumValues: $1.e_ROLE_STATUS.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  team_member_basic clone() => team_member_basic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  team_member_basic copyWith(void Function(team_member_basic) updates) => super.copyWith((message) => updates(message as team_member_basic)) as team_member_basic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static team_member_basic create() => team_member_basic._();
  team_member_basic createEmptyInstance() => create();
  static $pb.PbList<team_member_basic> createRepeated() => $pb.PbList<team_member_basic>();
  @$core.pragma('dart2js:noInline')
  static team_member_basic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<team_member_basic>(create);
  static team_member_basic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get friendlyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set friendlyName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriendlyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriendlyName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => clearField(3);

  @$pb.TagNumber(4)
  $1.e_ROLE_STATUS get roleStatus => $_getN(3);
  @$pb.TagNumber(4)
  set roleStatus($1.e_ROLE_STATUS v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoleStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoleStatus() => clearField(4);
}

/// Reply_Team_Members is used to reply with team members
class Reply_Team_Members extends $pb.GeneratedMessage {
  factory Reply_Team_Members({
    $core.Iterable<team_member_basic>? teamList,
  }) {
    final $result = create();
    if (teamList != null) {
      $result.teamList.addAll(teamList);
    }
    return $result;
  }
  Reply_Team_Members._() : super();
  factory Reply_Team_Members.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_Team_Members.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_Team_Members', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..pc<team_member_basic>(1, _omitFieldNames ? '' : 'teamList', $pb.PbFieldType.PM, subBuilder: team_member_basic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_Team_Members clone() => Reply_Team_Members()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_Team_Members copyWith(void Function(Reply_Team_Members) updates) => super.copyWith((message) => updates(message as Reply_Team_Members)) as Reply_Team_Members;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_Team_Members create() => Reply_Team_Members._();
  Reply_Team_Members createEmptyInstance() => create();
  static $pb.PbList<Reply_Team_Members> createRepeated() => $pb.PbList<Reply_Team_Members>();
  @$core.pragma('dart2js:noInline')
  static Reply_Team_Members getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_Team_Members>(create);
  static Reply_Team_Members? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<team_member_basic> get teamList => $_getList(0);
}

/// Request_Team_Join is used to join the user to a specified team
class Request_Team_Join extends $pb.GeneratedMessage {
  factory Request_Team_Join({
    $core.String? dbUserId,
    $core.String? inviteCode,
    $core.String? friendlyName,
  }) {
    final $result = create();
    if (dbUserId != null) {
      $result.dbUserId = dbUserId;
    }
    if (inviteCode != null) {
      $result.inviteCode = inviteCode;
    }
    if (friendlyName != null) {
      $result.friendlyName = friendlyName;
    }
    return $result;
  }
  Request_Team_Join._() : super();
  factory Request_Team_Join.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_Team_Join.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_Team_Join', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbUserId')
    ..aOS(2, _omitFieldNames ? '' : 'inviteCode')
    ..aOS(3, _omitFieldNames ? '' : 'friendlyName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_Team_Join clone() => Request_Team_Join()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_Team_Join copyWith(void Function(Request_Team_Join) updates) => super.copyWith((message) => updates(message as Request_Team_Join)) as Request_Team_Join;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_Team_Join create() => Request_Team_Join._();
  Request_Team_Join createEmptyInstance() => create();
  static $pb.PbList<Request_Team_Join> createRepeated() => $pb.PbList<Request_Team_Join>();
  @$core.pragma('dart2js:noInline')
  static Request_Team_Join getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_Team_Join>(create);
  static Request_Team_Join? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get inviteCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set inviteCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInviteCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearInviteCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get friendlyName => $_getSZ(2);
  @$pb.TagNumber(3)
  set friendlyName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFriendlyName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFriendlyName() => clearField(3);
}

/// Reply_Team_Join is used to reply with team join
class Reply_Team_Join extends $pb.GeneratedMessage {
  factory Reply_Team_Join({
    $0.Empty? empty,
  }) {
    final $result = create();
    if (empty != null) {
      $result.empty = empty;
    }
    return $result;
  }
  Reply_Team_Join._() : super();
  factory Reply_Team_Join.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_Team_Join.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_Team_Join', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOM<$0.Empty>(1, _omitFieldNames ? '' : 'empty', subBuilder: $0.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_Team_Join clone() => Reply_Team_Join()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_Team_Join copyWith(void Function(Reply_Team_Join) updates) => super.copyWith((message) => updates(message as Reply_Team_Join)) as Reply_Team_Join;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_Team_Join create() => Reply_Team_Join._();
  Reply_Team_Join createEmptyInstance() => create();
  static $pb.PbList<Reply_Team_Join> createRepeated() => $pb.PbList<Reply_Team_Join>();
  @$core.pragma('dart2js:noInline')
  static Reply_Team_Join getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_Team_Join>(create);
  static Reply_Team_Join? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Empty get empty => $_getN(0);
  @$pb.TagNumber(1)
  set empty($0.Empty v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmpty() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmpty() => clearField(1);
  @$pb.TagNumber(1)
  $0.Empty ensureEmpty() => $_ensure(0);
}

/// Request_Team_Create is used to request to create a new team
class Request_Team_Create extends $pb.GeneratedMessage {
  factory Request_Team_Create({
    $core.String? friendlyName,
    $1.e_TEAM_TYPE? teamType,
    $core.bool? image,
  }) {
    final $result = create();
    if (friendlyName != null) {
      $result.friendlyName = friendlyName;
    }
    if (teamType != null) {
      $result.teamType = teamType;
    }
    if (image != null) {
      $result.image = image;
    }
    return $result;
  }
  Request_Team_Create._() : super();
  factory Request_Team_Create.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_Team_Create.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_Team_Create', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'friendlyName')
    ..e<$1.e_TEAM_TYPE>(2, _omitFieldNames ? '' : 'teamType', $pb.PbFieldType.OE, defaultOrMaker: $1.e_TEAM_TYPE.PUBLIC, valueOf: $1.e_TEAM_TYPE.valueOf, enumValues: $1.e_TEAM_TYPE.values)
    ..aOB(3, _omitFieldNames ? '' : 'image')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_Team_Create clone() => Request_Team_Create()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_Team_Create copyWith(void Function(Request_Team_Create) updates) => super.copyWith((message) => updates(message as Request_Team_Create)) as Request_Team_Create;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_Team_Create create() => Request_Team_Create._();
  Request_Team_Create createEmptyInstance() => create();
  static $pb.PbList<Request_Team_Create> createRepeated() => $pb.PbList<Request_Team_Create>();
  @$core.pragma('dart2js:noInline')
  static Request_Team_Create getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_Team_Create>(create);
  static Request_Team_Create? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get friendlyName => $_getSZ(0);
  @$pb.TagNumber(1)
  set friendlyName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFriendlyName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFriendlyName() => clearField(1);

  @$pb.TagNumber(2)
  $1.e_TEAM_TYPE get teamType => $_getN(1);
  @$pb.TagNumber(2)
  set teamType($1.e_TEAM_TYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeamType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeamType() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get image => $_getBF(2);
  @$pb.TagNumber(3)
  set image($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
}

/// Reply_Team_Create will be used to get reply of team creation
class Reply_Team_Create extends $pb.GeneratedMessage {
  factory Reply_Team_Create({
    $core.String? dbTeamId,
    $core.String? imageBucketId,
  }) {
    final $result = create();
    if (dbTeamId != null) {
      $result.dbTeamId = dbTeamId;
    }
    if (imageBucketId != null) {
      $result.imageBucketId = imageBucketId;
    }
    return $result;
  }
  Reply_Team_Create._() : super();
  factory Reply_Team_Create.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_Team_Create.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_Team_Create', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbTeamId')
    ..aOS(2, _omitFieldNames ? '' : 'imageBucketId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_Team_Create clone() => Reply_Team_Create()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_Team_Create copyWith(void Function(Reply_Team_Create) updates) => super.copyWith((message) => updates(message as Reply_Team_Create)) as Reply_Team_Create;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_Team_Create create() => Reply_Team_Create._();
  Reply_Team_Create createEmptyInstance() => create();
  static $pb.PbList<Reply_Team_Create> createRepeated() => $pb.PbList<Reply_Team_Create>();
  @$core.pragma('dart2js:noInline')
  static Reply_Team_Create getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_Team_Create>(create);
  static Reply_Team_Create? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbTeamId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbTeamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbTeamId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get imageBucketId => $_getSZ(1);
  @$pb.TagNumber(2)
  set imageBucketId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImageBucketId() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageBucketId() => clearField(2);
}

/// Request_Team_Invite is used to request to get/create refresh a new team invite
class Request_Team_Invite extends $pb.GeneratedMessage {
  factory Request_Team_Invite({
    $core.String? dbTeamId,
    $core.bool? createRefresh,
  }) {
    final $result = create();
    if (dbTeamId != null) {
      $result.dbTeamId = dbTeamId;
    }
    if (createRefresh != null) {
      $result.createRefresh = createRefresh;
    }
    return $result;
  }
  Request_Team_Invite._() : super();
  factory Request_Team_Invite.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_Team_Invite.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_Team_Invite', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbTeamId')
    ..aOB(3, _omitFieldNames ? '' : 'createRefresh')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_Team_Invite clone() => Request_Team_Invite()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_Team_Invite copyWith(void Function(Request_Team_Invite) updates) => super.copyWith((message) => updates(message as Request_Team_Invite)) as Request_Team_Invite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_Team_Invite create() => Request_Team_Invite._();
  Request_Team_Invite createEmptyInstance() => create();
  static $pb.PbList<Request_Team_Invite> createRepeated() => $pb.PbList<Request_Team_Invite>();
  @$core.pragma('dart2js:noInline')
  static Request_Team_Invite getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_Team_Invite>(create);
  static Request_Team_Invite? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbTeamId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbTeamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbTeamId() => clearField(1);

  /// if false, retrieves team_invite info
  /// if true, 1st time for creation, otherwise refresh.
  @$pb.TagNumber(3)
  $core.bool get createRefresh => $_getBF(1);
  @$pb.TagNumber(3)
  set createRefresh($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreateRefresh() => $_has(1);
  @$pb.TagNumber(3)
  void clearCreateRefresh() => clearField(3);
}

/// message for team invite
class team_invite extends $pb.GeneratedMessage {
  factory team_invite({
    $core.String? id,
    $core.String? url,
    $core.String? urlQrImage,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (url != null) {
      $result.url = url;
    }
    if (urlQrImage != null) {
      $result.urlQrImage = urlQrImage;
    }
    return $result;
  }
  team_invite._() : super();
  factory team_invite.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory team_invite.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'team_invite', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'urlQrImage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  team_invite clone() => team_invite()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  team_invite copyWith(void Function(team_invite) updates) => super.copyWith((message) => updates(message as team_invite)) as team_invite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static team_invite create() => team_invite._();
  team_invite createEmptyInstance() => create();
  static $pb.PbList<team_invite> createRepeated() => $pb.PbList<team_invite>();
  @$core.pragma('dart2js:noInline')
  static team_invite getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<team_invite>(create);
  static team_invite? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get urlQrImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set urlQrImage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrlQrImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrlQrImage() => clearField(3);
}

/// Reply_Team_Invite will be used to get reply of team invite
class Reply_Team_Invite extends $pb.GeneratedMessage {
  factory Reply_Team_Invite({
    team_invite? info,
  }) {
    final $result = create();
    if (info != null) {
      $result.info = info;
    }
    return $result;
  }
  Reply_Team_Invite._() : super();
  factory Reply_Team_Invite.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_Team_Invite.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_Team_Invite', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOM<team_invite>(1, _omitFieldNames ? '' : 'info', subBuilder: team_invite.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_Team_Invite clone() => Reply_Team_Invite()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_Team_Invite copyWith(void Function(Reply_Team_Invite) updates) => super.copyWith((message) => updates(message as Reply_Team_Invite)) as Reply_Team_Invite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_Team_Invite create() => Reply_Team_Invite._();
  Reply_Team_Invite createEmptyInstance() => create();
  static $pb.PbList<Reply_Team_Invite> createRepeated() => $pb.PbList<Reply_Team_Invite>();
  @$core.pragma('dart2js:noInline')
  static Reply_Team_Invite getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_Team_Invite>(create);
  static Reply_Team_Invite? _defaultInstance;

  @$pb.TagNumber(1)
  team_invite get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(team_invite v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  team_invite ensureInfo() => $_ensure(0);
}

/// Request_Team_Edit is used to request to edit a selected team information
class Request_Team_Edit extends $pb.GeneratedMessage {
  factory Request_Team_Edit({
    $core.String? dbTeamId,
    $core.String? friendlyName,
    $core.bool? image,
  }) {
    final $result = create();
    if (dbTeamId != null) {
      $result.dbTeamId = dbTeamId;
    }
    if (friendlyName != null) {
      $result.friendlyName = friendlyName;
    }
    if (image != null) {
      $result.image = image;
    }
    return $result;
  }
  Request_Team_Edit._() : super();
  factory Request_Team_Edit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_Team_Edit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_Team_Edit', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbTeamId')
    ..aOS(2, _omitFieldNames ? '' : 'friendlyName')
    ..aOB(3, _omitFieldNames ? '' : 'image')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_Team_Edit clone() => Request_Team_Edit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_Team_Edit copyWith(void Function(Request_Team_Edit) updates) => super.copyWith((message) => updates(message as Request_Team_Edit)) as Request_Team_Edit;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_Team_Edit create() => Request_Team_Edit._();
  Request_Team_Edit createEmptyInstance() => create();
  static $pb.PbList<Request_Team_Edit> createRepeated() => $pb.PbList<Request_Team_Edit>();
  @$core.pragma('dart2js:noInline')
  static Request_Team_Edit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_Team_Edit>(create);
  static Request_Team_Edit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbTeamId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbTeamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbTeamId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get friendlyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set friendlyName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriendlyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriendlyName() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get image => $_getBF(2);
  @$pb.TagNumber(3)
  set image($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
}

/// Reply_Team_Edit will be used to get reply of team edit
class Reply_Team_Edit extends $pb.GeneratedMessage {
  factory Reply_Team_Edit({
    $core.String? imageBucketId,
  }) {
    final $result = create();
    if (imageBucketId != null) {
      $result.imageBucketId = imageBucketId;
    }
    return $result;
  }
  Reply_Team_Edit._() : super();
  factory Reply_Team_Edit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_Team_Edit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_Team_Edit', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imageBucketId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_Team_Edit clone() => Reply_Team_Edit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_Team_Edit copyWith(void Function(Reply_Team_Edit) updates) => super.copyWith((message) => updates(message as Reply_Team_Edit)) as Reply_Team_Edit;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_Team_Edit create() => Reply_Team_Edit._();
  Reply_Team_Edit createEmptyInstance() => create();
  static $pb.PbList<Reply_Team_Edit> createRepeated() => $pb.PbList<Reply_Team_Edit>();
  @$core.pragma('dart2js:noInline')
  static Reply_Team_Edit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_Team_Edit>(create);
  static Reply_Team_Edit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageBucketId => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageBucketId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImageBucketId() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageBucketId() => clearField(1);
}

/// Request_Team_Action is used to request to perform an action on a team
class Request_Team_Action extends $pb.GeneratedMessage {
  factory Request_Team_Action({
    $core.String? dbUserId,
    $core.String? dbTeamId,
    $1.e_TEAM_ACTION? action,
  }) {
    final $result = create();
    if (dbUserId != null) {
      $result.dbUserId = dbUserId;
    }
    if (dbTeamId != null) {
      $result.dbTeamId = dbTeamId;
    }
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  Request_Team_Action._() : super();
  factory Request_Team_Action.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_Team_Action.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_Team_Action', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbUserId')
    ..aOS(2, _omitFieldNames ? '' : 'dbTeamId')
    ..e<$1.e_TEAM_ACTION>(3, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: $1.e_TEAM_ACTION.DELETE, valueOf: $1.e_TEAM_ACTION.valueOf, enumValues: $1.e_TEAM_ACTION.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_Team_Action clone() => Request_Team_Action()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_Team_Action copyWith(void Function(Request_Team_Action) updates) => super.copyWith((message) => updates(message as Request_Team_Action)) as Request_Team_Action;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_Team_Action create() => Request_Team_Action._();
  Request_Team_Action createEmptyInstance() => create();
  static $pb.PbList<Request_Team_Action> createRepeated() => $pb.PbList<Request_Team_Action>();
  @$core.pragma('dart2js:noInline')
  static Request_Team_Action getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_Team_Action>(create);
  static Request_Team_Action? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get dbTeamId => $_getSZ(1);
  @$pb.TagNumber(2)
  set dbTeamId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDbTeamId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDbTeamId() => clearField(2);

  @$pb.TagNumber(3)
  $1.e_TEAM_ACTION get action => $_getN(2);
  @$pb.TagNumber(3)
  set action($1.e_TEAM_ACTION v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => clearField(3);
}

/// Reply_Team_Action will be used to get reply of team action
class Reply_Team_Action extends $pb.GeneratedMessage {
  factory Reply_Team_Action({
    $0.Empty? empty,
  }) {
    final $result = create();
    if (empty != null) {
      $result.empty = empty;
    }
    return $result;
  }
  Reply_Team_Action._() : super();
  factory Reply_Team_Action.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_Team_Action.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_Team_Action', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbTeam'), createEmptyInstance: create)
    ..aOM<$0.Empty>(1, _omitFieldNames ? '' : 'empty', subBuilder: $0.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_Team_Action clone() => Reply_Team_Action()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_Team_Action copyWith(void Function(Reply_Team_Action) updates) => super.copyWith((message) => updates(message as Reply_Team_Action)) as Reply_Team_Action;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_Team_Action create() => Reply_Team_Action._();
  Reply_Team_Action createEmptyInstance() => create();
  static $pb.PbList<Reply_Team_Action> createRepeated() => $pb.PbList<Reply_Team_Action>();
  @$core.pragma('dart2js:noInline')
  static Reply_Team_Action getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_Team_Action>(create);
  static Reply_Team_Action? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Empty get empty => $_getN(0);
  @$pb.TagNumber(1)
  set empty($0.Empty v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmpty() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmpty() => clearField(1);
  @$pb.TagNumber(1)
  $0.Empty ensureEmpty() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
