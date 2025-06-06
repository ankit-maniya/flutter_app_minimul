//
//  Generated code. Do not modify.
//  source: kmsgx_packages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Define kmsgx Packages ID values
class e_PACKAGES extends $pb.ProtobufEnum {
  static const e_PACKAGES kmsgxNone = e_PACKAGES._(0, _omitEnumNames ? '' : 'kmsgxNone');
  static const e_PACKAGES kmsgxPkgDbUser = e_PACKAGES._(16, _omitEnumNames ? '' : 'kmsgxPkgDbUser');
  static const e_PACKAGES kmsgxPkgDbTeam = e_PACKAGES._(17, _omitEnumNames ? '' : 'kmsgxPkgDbTeam');
  static const e_PACKAGES kmsgxAppDatabase = e_PACKAGES._(32, _omitEnumNames ? '' : 'kmsgxAppDatabase');

  static const $core.List<e_PACKAGES> values = <e_PACKAGES> [
    kmsgxNone,
    kmsgxPkgDbUser,
    kmsgxPkgDbTeam,
    kmsgxAppDatabase,
  ];

  static final $core.Map<$core.int, e_PACKAGES> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_PACKAGES? valueOf($core.int value) => _byValue[value];

  const e_PACKAGES._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
