import 'package:flutter/material.dart';
import 'package:gazzer_vendorapp/features/language/domain/repositories/language_repository_interface.dart';
import 'package:gazzer_vendorapp/features/language/domain/services/language_service_interface.dart';

class LanguageService implements LanguageServiceInterface {
  final LanguageRepositoryInterface languageRepositoryInterface;

  LanguageService({required this.languageRepositoryInterface});

  @override
  updateHeader(Locale locale) {
    languageRepositoryInterface.updateHeader(locale);
  }

  @override
  Locale getLocaleFromSharedPref() {
    return languageRepositoryInterface.getLocaleFromSharedPref();
  }

  @override
  void saveLanguage(Locale locale) {
    languageRepositoryInterface.saveLanguage(locale);
  }
}
