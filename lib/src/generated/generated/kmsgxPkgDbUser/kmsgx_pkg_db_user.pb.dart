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

import 'package:kmsgx/google/protobuf/empty.pb.dart' as $0;

export 'kmsgx_pkg_db_user.pbenum.dart';

/// message for basic user information
class user_info_basic extends $pb.GeneratedMessage {
  factory user_info_basic({
    $core.String? dbUserId,
    $core.String? dbSessionId,
    $core.String? dbSessionSecret,
    $core.String? name,
    $core.String? email,
  }) {
    final $result = create();
    if (dbUserId != null) {
      $result.dbUserId = dbUserId;
    }
    if (dbSessionId != null) {
      $result.dbSessionId = dbSessionId;
    }
    if (dbSessionSecret != null) {
      $result.dbSessionSecret = dbSessionSecret;
    }
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  user_info_basic._() : super();
  factory user_info_basic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory user_info_basic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'user_info_basic', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbUser'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbUserId')
    ..aOS(2, _omitFieldNames ? '' : 'dbSessionId')
    ..aOS(3, _omitFieldNames ? '' : 'dbSessionSecret')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  user_info_basic clone() => user_info_basic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  user_info_basic copyWith(void Function(user_info_basic) updates) => super.copyWith((message) => updates(message as user_info_basic)) as user_info_basic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static user_info_basic create() => user_info_basic._();
  user_info_basic createEmptyInstance() => create();
  static $pb.PbList<user_info_basic> createRepeated() => $pb.PbList<user_info_basic>();
  @$core.pragma('dart2js:noInline')
  static user_info_basic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<user_info_basic>(create);
  static user_info_basic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get dbSessionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set dbSessionId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDbSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDbSessionId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dbSessionSecret => $_getSZ(2);
  @$pb.TagNumber(3)
  set dbSessionSecret($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDbSessionSecret() => $_has(2);
  @$pb.TagNumber(3)
  void clearDbSessionSecret() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => clearField(5);
}

/// Request_User_Login
class Request_User_Login extends $pb.GeneratedMessage {
  factory Request_User_Login({
    $core.String? email,
    $core.String? password,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  Request_User_Login._() : super();
  factory Request_User_Login.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_User_Login.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_User_Login', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbUser'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_User_Login clone() => Request_User_Login()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_User_Login copyWith(void Function(Request_User_Login) updates) => super.copyWith((message) => updates(message as Request_User_Login)) as Request_User_Login;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_User_Login create() => Request_User_Login._();
  Request_User_Login createEmptyInstance() => create();
  static $pb.PbList<Request_User_Login> createRepeated() => $pb.PbList<Request_User_Login>();
  @$core.pragma('dart2js:noInline')
  static Request_User_Login getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_User_Login>(create);
  static Request_User_Login? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

/// Reply_User_Login is used to reply with user information
class Reply_User_Login extends $pb.GeneratedMessage {
  factory Reply_User_Login({
    user_info_basic? userInfo,
  }) {
    final $result = create();
    if (userInfo != null) {
      $result.userInfo = userInfo;
    }
    return $result;
  }
  Reply_User_Login._() : super();
  factory Reply_User_Login.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_User_Login.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_User_Login', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbUser'), createEmptyInstance: create)
    ..aOM<user_info_basic>(1, _omitFieldNames ? '' : 'userInfo', subBuilder: user_info_basic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_User_Login clone() => Reply_User_Login()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_User_Login copyWith(void Function(Reply_User_Login) updates) => super.copyWith((message) => updates(message as Reply_User_Login)) as Reply_User_Login;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_User_Login create() => Reply_User_Login._();
  Reply_User_Login createEmptyInstance() => create();
  static $pb.PbList<Reply_User_Login> createRepeated() => $pb.PbList<Reply_User_Login>();
  @$core.pragma('dart2js:noInline')
  static Reply_User_Login getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_User_Login>(create);
  static Reply_User_Login? _defaultInstance;

  @$pb.TagNumber(1)
  user_info_basic get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo(user_info_basic v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => clearField(1);
  @$pb.TagNumber(1)
  user_info_basic ensureUserInfo() => $_ensure(0);
}

/// Request_User_Register
class Request_User_Register extends $pb.GeneratedMessage {
  factory Request_User_Register({
    $core.String? name,
    $core.String? email,
    $core.String? password,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  Request_User_Register._() : super();
  factory Request_User_Register.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_User_Register.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_User_Register', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbUser'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_User_Register clone() => Request_User_Register()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_User_Register copyWith(void Function(Request_User_Register) updates) => super.copyWith((message) => updates(message as Request_User_Register)) as Request_User_Register;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_User_Register create() => Request_User_Register._();
  Request_User_Register createEmptyInstance() => create();
  static $pb.PbList<Request_User_Register> createRepeated() => $pb.PbList<Request_User_Register>();
  @$core.pragma('dart2js:noInline')
  static Request_User_Register getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_User_Register>(create);
  static Request_User_Register? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

/// Reply_User_Register is used to reply with user information
class Reply_User_Register extends $pb.GeneratedMessage {
  factory Reply_User_Register({
    user_info_basic? userInfo,
  }) {
    final $result = create();
    if (userInfo != null) {
      $result.userInfo = userInfo;
    }
    return $result;
  }
  Reply_User_Register._() : super();
  factory Reply_User_Register.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_User_Register.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_User_Register', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbUser'), createEmptyInstance: create)
    ..aOM<user_info_basic>(1, _omitFieldNames ? '' : 'userInfo', subBuilder: user_info_basic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_User_Register clone() => Reply_User_Register()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_User_Register copyWith(void Function(Reply_User_Register) updates) => super.copyWith((message) => updates(message as Reply_User_Register)) as Reply_User_Register;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_User_Register create() => Reply_User_Register._();
  Reply_User_Register createEmptyInstance() => create();
  static $pb.PbList<Reply_User_Register> createRepeated() => $pb.PbList<Reply_User_Register>();
  @$core.pragma('dart2js:noInline')
  static Reply_User_Register getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_User_Register>(create);
  static Reply_User_Register? _defaultInstance;

  @$pb.TagNumber(1)
  user_info_basic get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo(user_info_basic v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => clearField(1);
  @$pb.TagNumber(1)
  user_info_basic ensureUserInfo() => $_ensure(0);
}

/// Request_User_Logout
class Request_User_Logout extends $pb.GeneratedMessage {
  factory Request_User_Logout({
    $core.String? dbSessionId,
  }) {
    final $result = create();
    if (dbSessionId != null) {
      $result.dbSessionId = dbSessionId;
    }
    return $result;
  }
  Request_User_Logout._() : super();
  factory Request_User_Logout.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request_User_Logout.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request_User_Logout', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbUser'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbSessionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request_User_Logout clone() => Request_User_Logout()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request_User_Logout copyWith(void Function(Request_User_Logout) updates) => super.copyWith((message) => updates(message as Request_User_Logout)) as Request_User_Logout;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request_User_Logout create() => Request_User_Logout._();
  Request_User_Logout createEmptyInstance() => create();
  static $pb.PbList<Request_User_Logout> createRepeated() => $pb.PbList<Request_User_Logout>();
  @$core.pragma('dart2js:noInline')
  static Request_User_Logout getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request_User_Logout>(create);
  static Request_User_Logout? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbSessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbSessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDbSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbSessionId() => clearField(1);
}

/// Reply_User_Logout is used to reply with empty message
class Reply_User_Logout extends $pb.GeneratedMessage {
  factory Reply_User_Logout({
    $0.Empty? empty,
  }) {
    final $result = create();
    if (empty != null) {
      $result.empty = empty;
    }
    return $result;
  }
  Reply_User_Logout._() : super();
  factory Reply_User_Logout.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply_User_Logout.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply_User_Logout', package: const $pb.PackageName(_omitMessageNames ? '' : 'kmsgxPkgDbUser'), createEmptyInstance: create)
    ..aOM<$0.Empty>(1, _omitFieldNames ? '' : 'empty', subBuilder: $0.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply_User_Logout clone() => Reply_User_Logout()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply_User_Logout copyWith(void Function(Reply_User_Logout) updates) => super.copyWith((message) => updates(message as Reply_User_Logout)) as Reply_User_Logout;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply_User_Logout create() => Reply_User_Logout._();
  Reply_User_Logout createEmptyInstance() => create();
  static $pb.PbList<Reply_User_Logout> createRepeated() => $pb.PbList<Reply_User_Logout>();
  @$core.pragma('dart2js:noInline')
  static Reply_User_Logout getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply_User_Logout>(create);
  static Reply_User_Logout? _defaultInstance;

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
