//
//  Generated code. Do not modify.
//  source: kmsgx_common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///  Define kmsgx reply status codes
///  These can be used as status codes for all application operations, whether internal or external.
///  These are generic enough that they can apply to almost all systems.
/// 	A reply might have more data, which could provide further details on non-OK messages.
class e_STATUS extends $pb.ProtobufEnum {
  static const e_STATUS OK = e_STATUS._(0, _omitEnumNames ? '' : 'OK');
  static const e_STATUS INVALID_PACKAGE_ID = e_STATUS._(1, _omitEnumNames ? '' : 'INVALID_PACKAGE_ID');
  static const e_STATUS INVALID_REQ_EVT_ID = e_STATUS._(2, _omitEnumNames ? '' : 'INVALID_REQ_EVT_ID');
  static const e_STATUS INVALID_LENGTH = e_STATUS._(3, _omitEnumNames ? '' : 'INVALID_LENGTH');
  static const e_STATUS INVALID_PARAMETERS = e_STATUS._(4, _omitEnumNames ? '' : 'INVALID_PARAMETERS');
  static const e_STATUS REJECT_PARAMETERS = e_STATUS._(5, _omitEnumNames ? '' : 'REJECT_PARAMETERS');
  static const e_STATUS INVALID_STATE = e_STATUS._(6, _omitEnumNames ? '' : 'INVALID_STATE');
  static const e_STATUS INVALID_STATE_TRANSITION = e_STATUS._(7, _omitEnumNames ? '' : 'INVALID_STATE_TRANSITION');
  static const e_STATUS INVALID_STATUS = e_STATUS._(8, _omitEnumNames ? '' : 'INVALID_STATUS');
  static const e_STATUS TIMEOUT_OPERATION = e_STATUS._(9, _omitEnumNames ? '' : 'TIMEOUT_OPERATION');
  static const e_STATUS LIMIT_EXCEEDED = e_STATUS._(10, _omitEnumNames ? '' : 'LIMIT_EXCEEDED');
  static const e_STATUS OUTSIDE_OF_RANGE = e_STATUS._(11, _omitEnumNames ? '' : 'OUTSIDE_OF_RANGE');
  static const e_STATUS NO_PATH = e_STATUS._(12, _omitEnumNames ? '' : 'NO_PATH');
  static const e_STATUS INVALID_PATH = e_STATUS._(13, _omitEnumNames ? '' : 'INVALID_PATH');
  static const e_STATUS BUSY = e_STATUS._(14, _omitEnumNames ? '' : 'BUSY');
  static const e_STATUS OPERATION_FAILED = e_STATUS._(15, _omitEnumNames ? '' : 'OPERATION_FAILED');
  static const e_STATUS MALLOC_FAIL = e_STATUS._(16, _omitEnumNames ? '' : 'MALLOC_FAIL');
  static const e_STATUS NULL_POINTER = e_STATUS._(17, _omitEnumNames ? '' : 'NULL_POINTER');
  static const e_STATUS RESOURCE_UNAVAILABLE = e_STATUS._(18, _omitEnumNames ? '' : 'RESOURCE_UNAVAILABLE');
  static const e_STATUS INVALID_REPLY_LENGTH = e_STATUS._(19, _omitEnumNames ? '' : 'INVALID_REPLY_LENGTH');
  static const e_STATUS NOT_SUPPORTED = e_STATUS._(20, _omitEnumNames ? '' : 'NOT_SUPPORTED');
  static const e_STATUS DECODE_FAIL = e_STATUS._(21, _omitEnumNames ? '' : 'DECODE_FAIL');
  static const e_STATUS ENCODE_FAIL = e_STATUS._(22, _omitEnumNames ? '' : 'ENCODE_FAIL');
  static const e_STATUS NOT_SUPPORTED_PARAMETER = e_STATUS._(23, _omitEnumNames ? '' : 'NOT_SUPPORTED_PARAMETER');
  static const e_STATUS INVALID_CONTENTS = e_STATUS._(24, _omitEnumNames ? '' : 'INVALID_CONTENTS');
  static const e_STATUS INVALID_LENGTH_PATH = e_STATUS._(25, _omitEnumNames ? '' : 'INVALID_LENGTH_PATH');
  static const e_STATUS ITEM_DOES_NOT_EXIST = e_STATUS._(26, _omitEnumNames ? '' : 'ITEM_DOES_NOT_EXIST');
  static const e_STATUS AUTHENTICATION_FAILED = e_STATUS._(27, _omitEnumNames ? '' : 'AUTHENTICATION_FAILED');
  static const e_STATUS INVALID_OTHER = e_STATUS._(255, _omitEnumNames ? '' : 'INVALID_OTHER');

  static const $core.List<e_STATUS> values = <e_STATUS> [
    OK,
    INVALID_PACKAGE_ID,
    INVALID_REQ_EVT_ID,
    INVALID_LENGTH,
    INVALID_PARAMETERS,
    REJECT_PARAMETERS,
    INVALID_STATE,
    INVALID_STATE_TRANSITION,
    INVALID_STATUS,
    TIMEOUT_OPERATION,
    LIMIT_EXCEEDED,
    OUTSIDE_OF_RANGE,
    NO_PATH,
    INVALID_PATH,
    BUSY,
    OPERATION_FAILED,
    MALLOC_FAIL,
    NULL_POINTER,
    RESOURCE_UNAVAILABLE,
    INVALID_REPLY_LENGTH,
    NOT_SUPPORTED,
    DECODE_FAIL,
    ENCODE_FAIL,
    NOT_SUPPORTED_PARAMETER,
    INVALID_CONTENTS,
    INVALID_LENGTH_PATH,
    ITEM_DOES_NOT_EXIST,
    AUTHENTICATION_FAILED,
    INVALID_OTHER,
  ];

  static final $core.Map<$core.int, e_STATUS> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_STATUS? valueOf($core.int value) => _byValue[value];

  const e_STATUS._($core.int v, $core.String n) : super(v, n);
}

/// Define kmsgx flag bitmask values
class e_FLAG extends $pb.ProtobufEnum {
  static const e_FLAG TYPE_REQUEST = e_FLAG._(0, _omitEnumNames ? '' : 'TYPE_REQUEST');
  static const e_FLAG TYPE_REPLY = e_FLAG._(1, _omitEnumNames ? '' : 'TYPE_REPLY');
  static const e_FLAG TYPE_EVENT = e_FLAG._(2, _omitEnumNames ? '' : 'TYPE_EVENT');
  static const e_FLAG TYPE_STDX = e_FLAG._(3, _omitEnumNames ? '' : 'TYPE_STDX');
  static const e_FLAG ENCODED = e_FLAG._(4, _omitEnumNames ? '' : 'ENCODED');
  static const e_FLAG DECODED = e_FLAG._(8, _omitEnumNames ? '' : 'DECODED');
  static const e_FLAG EXTENDED = e_FLAG._(128, _omitEnumNames ? '' : 'EXTENDED');

  static const e_FLAG TYPE_BITMASK = TYPE_STDX;
  static const e_FLAG ENCODED_BITMASK = ENCODED;
  static const e_FLAG DECODED_BITMASK = DECODED;
  static const e_FLAG EXTENDED_BITMASK = EXTENDED;

  static const $core.List<e_FLAG> values = <e_FLAG> [
    TYPE_REQUEST,
    TYPE_REPLY,
    TYPE_EVENT,
    TYPE_STDX,
    ENCODED,
    DECODED,
    EXTENDED,
  ];

  static final $core.Map<$core.int, e_FLAG> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_FLAG? valueOf($core.int value) => _byValue[value];

  const e_FLAG._($core.int v, $core.String n) : super(v, n);
}

/// Define kmsgx message byte array position.
/// Note for e_REQUEST replies, the reply will have src/dst fields swapped
class e_POSITION extends $pb.ProtobufEnum {
  static const e_POSITION FLAG = e_POSITION._(0, _omitEnumNames ? '' : 'FLAG');
  static const e_POSITION SRC = e_POSITION._(1, _omitEnumNames ? '' : 'SRC');
  static const e_POSITION DST = e_POSITION._(2, _omitEnumNames ? '' : 'DST');
  static const e_POSITION PACKAGE = e_POSITION._(3, _omitEnumNames ? '' : 'PACKAGE');
  static const e_POSITION ID = e_POSITION._(4, _omitEnumNames ? '' : 'ID');
  static const e_POSITION STATUS = e_POSITION._(5, _omitEnumNames ? '' : 'STATUS');

  static const $core.List<e_POSITION> values = <e_POSITION> [
    FLAG,
    SRC,
    DST,
    PACKAGE,
    ID,
    STATUS,
  ];

  static final $core.Map<$core.int, e_POSITION> _byValue = $pb.ProtobufEnum.initByValue(values);
  static e_POSITION? valueOf($core.int value) => _byValue[value];

  const e_POSITION._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
