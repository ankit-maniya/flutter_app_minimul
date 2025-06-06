//
//  Generated code. Do not modify.
//  source: kmsgx_pkg_db_team.enum.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// enum for team types
class e_TEAM_TYPE extends $pb.ProtobufEnum {
  static const e_TEAM_TYPE PUBLIC = e_TEAM_TYPE._(0, _omitEnumNames ? '' : 'PUBLIC');
  static const e_TEAM_TYPE PRIVATE = e_TEAM_TYPE._(1, _omitEnumNames ? '' : 'PRIVATE');

  static const $core.List<e_TEAM_TYPE> values = <e_TEAM_TYPE> [
    PUBLIC,
    PRIVATE,
  ];

  static final $core.Map<$core.int, e_TEAM_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_TEAM_TYPE? valueOf($core.int value) => _byValue[value];

  const e_TEAM_TYPE._($core.int v, $core.String n) : super(v, n);
}

/// enum for role status
class e_ROLE_STATUS extends $pb.ProtobufEnum {
  static const e_ROLE_STATUS OWNER = e_ROLE_STATUS._(0, _omitEnumNames ? '' : 'OWNER');
  static const e_ROLE_STATUS REGULAR_USER = e_ROLE_STATUS._(1, _omitEnumNames ? '' : 'REGULAR_USER');

  static const $core.List<e_ROLE_STATUS> values = <e_ROLE_STATUS> [
    OWNER,
    REGULAR_USER,
  ];

  static final $core.Map<$core.int, e_ROLE_STATUS> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_ROLE_STATUS? valueOf($core.int value) => _byValue[value];

  const e_ROLE_STATUS._($core.int v, $core.String n) : super(v, n);
}

/// enum for team actions
class e_TEAM_ACTION extends $pb.ProtobufEnum {
  static const e_TEAM_ACTION DELETE = e_TEAM_ACTION._(0, _omitEnumNames ? '' : 'DELETE');
  static const e_TEAM_ACTION LEAVE = e_TEAM_ACTION._(1, _omitEnumNames ? '' : 'LEAVE');
  static const e_TEAM_ACTION MUTE = e_TEAM_ACTION._(2, _omitEnumNames ? '' : 'MUTE');
  static const e_TEAM_ACTION UNMUTE = e_TEAM_ACTION._(3, _omitEnumNames ? '' : 'UNMUTE');

  static const $core.List<e_TEAM_ACTION> values = <e_TEAM_ACTION> [
    DELETE,
    LEAVE,
    MUTE,
    UNMUTE,
  ];

  static final $core.Map<$core.int, e_TEAM_ACTION> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_TEAM_ACTION? valueOf($core.int value) => _byValue[value];

  const e_TEAM_ACTION._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
