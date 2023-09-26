/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 44 (22 per locale)
///
/// Built on 2023-09-26 at 03:07 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	viVn(languageCode: 'vi', countryCode: 'VN', build: _StringsViVn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String hello({required Object name}) => 'Hello ${name}';
	String get save => 'Save';
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	late final _StringsSignUpEn signUp = _StringsSignUpEn._(_root);
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get success => 'Logged in successfully';
	String get fail => 'Logged in failed';
	String get title => 'Login';
	String get email => 'Email';
	String get password => 'Password';
	String get emailRequired => 'Email is required';
	String get passwordRequired => 'Password is required';
	String get emailHint => 'Enter your email';
	String get passwordHint => 'Enter your password';
	String get emailInvalid => 'Email is invalid';
}

// Path: signUp
class _StringsSignUpEn {
	_StringsSignUpEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Sign Up';
	String get success => 'Signed up successfully';
	String get fail => 'Signed up failed';
	String get fullName => 'Full Name';
	String get fullNameHint => 'Enter your full name';
	String get fullNameRequired => 'Full name is required';
	String get confirmPassword => 'Confirm password';
	String get confirmPasswordHint => 'Re-enter your password';
	String get confirmPasswordRequired => 'Confirm password is required';
	String get passwordNotMatch => 'Password not match';
}

// Path: <root>
class _StringsViVn implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsViVn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.viVn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi-VN>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsViVn _root = this; // ignore: unused_field

	// Translations
	@override String hello({required Object name}) => 'Hallo ${name}';
	@override String get save => 'Speichern';
	@override late final _StringsLoginViVn login = _StringsLoginViVn._(_root);
	@override late final _StringsSignUpViVn signUp = _StringsSignUpViVn._(_root);
}

// Path: login
class _StringsLoginViVn implements _StringsLoginEn {
	_StringsLoginViVn._(this._root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get success => 'Logged in successfully';
	@override String get fail => 'Đăng nhập thất bại';
	@override String get title => 'Đăng nhập';
	@override String get email => 'Email';
	@override String get password => 'Mật khẩu';
	@override String get emailRequired => 'Bạn chưa nhập email';
	@override String get passwordRequired => 'Bạn chưa nhập mật khẩu';
	@override String get emailHint => 'Nhập email của bạn';
	@override String get passwordHint => 'Nhập mật khẩu của bạn';
	@override String get emailInvalid => 'Vui lòng nhập đúng email';
}

// Path: signUp
class _StringsSignUpViVn implements _StringsSignUpEn {
	_StringsSignUpViVn._(this._root);

	@override final _StringsViVn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Đăng ký';
	@override String get success => 'Đăng ký tài khoản thành công';
	@override String get fail => 'Đăng ký tài khoản không thành công';
	@override String get fullName => 'Họ tên';
	@override String get fullNameHint => 'Nhập họ tên của bạn';
	@override String get fullNameRequired => 'Bạn chưa nhập họ tê ';
	@override String get confirmPassword => 'Xác nhận mật khẩu';
	@override String get confirmPasswordHint => 'Nhập lại mật khẩu';
	@override String get confirmPasswordRequired => 'Bạn chưa xác nhận mật khẩu';
	@override String get passwordNotMatch => 'Mật khẩu không khớp';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return ({required Object name}) => 'Hello ${name}';
			case 'save': return 'Save';
			case 'login.success': return 'Logged in successfully';
			case 'login.fail': return 'Logged in failed';
			case 'login.title': return 'Login';
			case 'login.email': return 'Email';
			case 'login.password': return 'Password';
			case 'login.emailRequired': return 'Email is required';
			case 'login.passwordRequired': return 'Password is required';
			case 'login.emailHint': return 'Enter your email';
			case 'login.passwordHint': return 'Enter your password';
			case 'login.emailInvalid': return 'Email is invalid';
			case 'signUp.title': return 'Sign Up';
			case 'signUp.success': return 'Signed up successfully';
			case 'signUp.fail': return 'Signed up failed';
			case 'signUp.fullName': return 'Full Name';
			case 'signUp.fullNameHint': return 'Enter your full name';
			case 'signUp.fullNameRequired': return 'Full name is required';
			case 'signUp.confirmPassword': return 'Confirm password';
			case 'signUp.confirmPasswordHint': return 'Re-enter your password';
			case 'signUp.confirmPasswordRequired': return 'Confirm password is required';
			case 'signUp.passwordNotMatch': return 'Password not match';
			default: return null;
		}
	}
}

extension on _StringsViVn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return ({required Object name}) => 'Hallo ${name}';
			case 'save': return 'Speichern';
			case 'login.success': return 'Logged in successfully';
			case 'login.fail': return 'Đăng nhập thất bại';
			case 'login.title': return 'Đăng nhập';
			case 'login.email': return 'Email';
			case 'login.password': return 'Mật khẩu';
			case 'login.emailRequired': return 'Bạn chưa nhập email';
			case 'login.passwordRequired': return 'Bạn chưa nhập mật khẩu';
			case 'login.emailHint': return 'Nhập email của bạn';
			case 'login.passwordHint': return 'Nhập mật khẩu của bạn';
			case 'login.emailInvalid': return 'Vui lòng nhập đúng email';
			case 'signUp.title': return 'Đăng ký';
			case 'signUp.success': return 'Đăng ký tài khoản thành công';
			case 'signUp.fail': return 'Đăng ký tài khoản không thành công';
			case 'signUp.fullName': return 'Họ tên';
			case 'signUp.fullNameHint': return 'Nhập họ tên của bạn';
			case 'signUp.fullNameRequired': return 'Bạn chưa nhập họ tê ';
			case 'signUp.confirmPassword': return 'Xác nhận mật khẩu';
			case 'signUp.confirmPasswordHint': return 'Nhập lại mật khẩu';
			case 'signUp.confirmPasswordRequired': return 'Bạn chưa xác nhận mật khẩu';
			case 'signUp.passwordNotMatch': return 'Mật khẩu không khớp';
			default: return null;
		}
	}
}
