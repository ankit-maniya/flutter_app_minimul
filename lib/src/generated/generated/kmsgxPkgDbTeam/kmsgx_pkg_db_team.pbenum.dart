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

export 'kmsgx_pkg_db_team.enum.pbenum.dart';

/// Define kmsgx Request ID values, representing a kmsgx Requests/Reply ID
class e_Request extends $pb.ProtobufEnum {
  static const e_Request NoneRequest = e_Request._(0, _omitEnumNames ? '' : 'NoneRequest');
  static const e_Request Team_List = e_Request._(1, _omitEnumNames ? '' : 'Team_List');
  static const e_Request Team_Members = e_Request._(2, _omitEnumNames ? '' : 'Team_Members');
  static const e_Request Team_Join = e_Request._(3, _omitEnumNames ? '' : 'Team_Join');
  static const e_Request Team_Create = e_Request._(4, _omitEnumNames ? '' : 'Team_Create');
  static const e_Request Team_Invite = e_Request._(5, _omitEnumNames ? '' : 'Team_Invite');
  static const e_Request Team_Edit = e_Request._(6, _omitEnumNames ? '' : 'Team_Edit');
  static const e_Request Team_Action = e_Request._(7, _omitEnumNames ? '' : 'Team_Action');

  static const $core.List<e_Request> values = <e_Request> [
    NoneRequest,
    Team_List,
    Team_Members,
    Team_Join,
    Team_Create,
    Team_Invite,
    Team_Edit,
    Team_Action,
  ];

  static final $core.Map<$core.int, e_Request> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_Request? valueOf($core.int value) => _byValue[value];

  const e_Request._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
