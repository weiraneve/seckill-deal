import 'dart:io';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:seckill_deal/res/zh-CN.dart';

import 'en-US.dart';

class StringResources extends Translations {
  static Locale? get locale {
    final local = Platform.localeName.split('_');
    return Locale.fromSubtags(
        languageCode: local[0],
        countryCode: local.length > 1 ? local[1] : null);
  }

  static const fallbackLocale = Locale('en', 'US');

  static final Map<String, String> _enUS =
      enUS.map((key, value) => MapEntry(key.name, value));
  static final Map<String, String> _zhCN =
      zhCN.map((key, value) => MapEntry(key.name, value));

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': _enUS,
        'zh_CN': _zhCN,
      };
}

stringRes(R key) => key.name.tr;

enum R {
  appName,
  loginTitle,
  registerTitle,
  login,
  register,
  loginHint,
  registerHint,
  passwordHint,
  needRegister,
  loginEmptyError,
  registerEmptyError,
  phoneFormatError,
  registerFormatError,
  serverError,
  otherError,
  passwordConfirmHint,
  logout,
  inProgress,
  aboutToStart,
  distantFuture,
  hasEnded,
  enterSeckillDetail,
  seckill,
  goodsDetail,
  orderPageTitle,
  updatePassword,
  oldPassword,
  newPassword,
  confirmPassword,
  cancel,
  summit,
  updateSuccess,
  updateError,
  networkError,
  unknownError,
  successful,
  fail,
  mismatchError,
}
