//
//  Generated code. Do not modify.
//  source: kmsgx_pkg_db_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Define kmsgx Request ID values, representing a kmsgx Requests/Reply ID
class e_Request extends $pb.ProtobufEnum {
  static const e_Request NoneRequest = e_Request._(0, _omitEnumNames ? '' : 'NoneRequest');
  static const e_Request User_Login = e_Request._(1, _omitEnumNames ? '' : 'User_Login');
  static const e_Request User_Register = e_Request._(2, _omitEnumNames ? '' : 'User_Register');
  static const e_Request User_Logout = e_Request._(3, _omitEnumNames ? '' : 'User_Logout');

  static const $core.List<e_Request> values = <e_Request> [
    NoneRequest,
    User_Login,
    User_Register,
    User_Logout,
  ];

  static final $core.Map<$core.int, e_Request> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_Request? valueOf($core.int value) => _byValue[value];

  const e_Request._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
