//
//  Generated code. Do not modify.
//  source: kmsgx_sockets.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///  Define kmsgx Socket src / dst ID values
///  These are specific byte fields in a kmsgx header message.
///
///  For applications, e_SOCKETS values src/dst help identify the source and destination of a kmsgx.
///
///  Define a unique numeric value for all socket src/dst values we support.
class e_SOCKETS extends $pb.ProtobufEnum {
  static const e_SOCKETS NULL = e_SOCKETS._(0, _omitEnumNames ? '' : 'NULL');
  static const e_SOCKETS PORT_DB_BACKEND_CLIENT = e_SOCKETS._(32, _omitEnumNames ? '' : 'PORT_DB_BACKEND_CLIENT');
  static const e_SOCKETS KONNECT_DB_BACKEND = e_SOCKETS._(36, _omitEnumNames ? '' : 'KONNECT_DB_BACKEND');

  static const $core.List<e_SOCKETS> values = <e_SOCKETS> [
    NULL,
    PORT_DB_BACKEND_CLIENT,
    KONNECT_DB_BACKEND,
  ];

  static final $core.Map<$core.int, e_SOCKETS> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_SOCKETS? valueOf($core.int value) => _byValue[value];

  const e_SOCKETS._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
