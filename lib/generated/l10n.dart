// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `User Name`
  String get hintUserName {
    return Intl.message('User Name', name: 'hintUserName', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get passwordConfirm {
    return Intl.message(
      'Confirm Password',
      name: 'passwordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Already Have An Account?`
  String get haveAccount {
    return Intl.message(
      'Already Have An Account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have An Account?`
  String get noHaveAccount {
    return Intl.message(
      'Don\'t Have An Account?',
      name: 'noHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Add Task`
  String get titleAddTask {
    return Intl.message('Add Task', name: 'titleAddTask', desc: '', args: []);
  }

  /// `Title`
  String get hintTextTitle {
    return Intl.message('Title', name: 'hintTextTitle', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `There are no tasks yet\nPress the button \nTo add a New Task`
  String get noTasks {
    return Intl.message(
      'There are no tasks yet\nPress the button \nTo add a New Task',
      name: 'noTasks',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To\n \t Do It!`
  String get welcome {
    return Intl.message(
      'Welcome To\n \t Do It!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Ready to conquer your tasks? Let's Do \n  It together.`
  String get titleOnBoarding {
    return Intl.message(
      'Ready to conquer your tasks? Let\'s Do \n  It together.',
      name: 'titleOnBoarding',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Start`
  String get letsStart {
    return Intl.message('Let’s Start', name: 'letsStart', desc: '', args: []);
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Old  Password`
  String get oldPassword {
    return Intl.message(
      'Old  Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New  Password`
  String get newPassword {
    return Intl.message(
      'New  Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
