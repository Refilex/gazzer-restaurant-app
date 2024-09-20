import 'package:flutter/material.dart';
import 'package:gazzer_vendorapp/interface/repository_interface.dart';

abstract class LanguageRepositoryInterface implements RepositoryInterface {
  void updateHeader(Locale locale);

  Locale getLocaleFromSharedPref();

  void saveLanguage(Locale locale);
}
