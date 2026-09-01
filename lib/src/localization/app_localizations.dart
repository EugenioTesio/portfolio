import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// My name
  ///
  /// In en, this message translates to:
  /// **'Eugenio Tesio'**
  String get name;

  /// Title of Home section
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeSectionTitle;

  /// Title of About section
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutSectionTitle;

  /// Title of About section
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutSectionTitleAlt;

  /// Title of Experience section
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experienceSectionTitle;

  /// Title of Projects section
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projectsSectionTitle;

  /// English language resume
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishLanguage;

  /// French language resume
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get spanishLanguage;

  /// Resume
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// Resume download dialog
  ///
  /// In en, this message translates to:
  /// **'Download resume'**
  String get downloadResume;

  /// Current job or education
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get resumePresent;

  /// My description
  ///
  /// In en, this message translates to:
  /// **'Passionate Software Developer'**
  String get description;

  /// My sub description
  ///
  /// In en, this message translates to:
  /// **'Senior Flutter and Python Enthusiast'**
  String get subDescription;

  /// My introduction
  ///
  /// In en, this message translates to:
  /// **'Hello! I\'m Eugenio Tesio, highly experienced Flutter Developer with 5+ year\'s expertise in designing and developing comprehensive applications using Java, Spring Boot, Python, and the Flutter framework. Skilled in leveraging powerful architecture patterns to create impressive software products that meet customer needs. Passionate about creating impactful solutions by optimizing complex technical solutions for businesses to achieve their objectives. Looking for innovative Python/Flutter projects where I can combine my strongest knowledge.'**
  String get about;

  /// Description of the Portfolio project
  ///
  /// In en, this message translates to:
  /// **'Yes, it\'s THIS portfolio! \nThis project follows a Riverpod-based Architecture, using a feature-first approach for its structure. It is fully responsive, and supports multiple themes and languages.'**
  String get portfolioDescription;

  /// Credit to
  ///
  /// In en, this message translates to:
  /// **'Design inspired by'**
  String get credit;

  /// Developer job title at ITTI / ueno bank
  ///
  /// In en, this message translates to:
  /// **'Mobile Expert'**
  String get ittiDevJobTitle;

  /// Developer job description at ITTI / ueno bank
  ///
  /// In en, this message translates to:
  /// **'<ul><li><strong>Architecture &amp; Scalability:</strong> Spearheaded the architectural migration of the <strong>ueno bank</strong> mobile platform from a monolith to a multi-repo <strong>Micro-App &amp; App Shell architecture</strong>, streamlining concurrent development for <strong>50+ Flutter engineers</strong>.</li><li><strong>Flagship Ecosystem Unification:</strong> Co-led consolidation of the <strong>Empresas</strong> (Corporate) and <strong>Individuos</strong> (Retail) banking apps, harmonizing <strong>BLoC</strong> and <strong>Riverpod</strong> architectures across <strong>300+ cross-functional stakeholders</strong>.</li><li><strong>AI-Augmented Engineering:</strong> Pioneered <strong>multi-agent AI development workflows</strong> with <strong>Cursor</strong> and <strong>GitHub Copilot</strong> to accelerate delivery, architectural refactoring, and code-review consistency.</li><li><strong>Release Engineering &amp; Store Deployments:</strong> Established a predictable <strong>15-day Release Train</strong> with automated <strong>Codemagic</strong> CD pipelines for multi-store signing and distribution to the <strong>Apple App Store</strong>, <strong>Google Play Store</strong>, and <strong>Huawei AppGallery</strong>.</li><li><strong>CI, Quality &amp; Security Automation:</strong> Built <strong>GitHub Actions</strong> CI on every push and PR across micro-repositories, enforcing unit tests, Dart analyzer, <strong>Sonar</strong>, and <strong>Checkmarx</strong> SAST gates.</li><li><strong>Fintech Security Hardening:</strong> Integrated <strong>RASP</strong> for real-time jailbreak/root detection, remediated core vulnerabilities, and engineered an enterprise-ready secure <strong>WebView</strong> component.</li><li><strong>Observability &amp; Reliability:</strong> Improved production uptime and triage by integrating <strong>Instabug</strong> and specialized <strong>New Relic</strong> mobile dashboards and telemetry queries.</li><li><strong>BFF &amp; Cloud Deployment:</strong> Built high-throughput Backend-for-Frontend services with <strong>Fastify (Node.js)</strong> on <strong>NullPlatform</strong>, optimizing payload efficiency and mobile network performance.</li><li><strong>Technical Leadership &amp; Culture:</strong> Championed <strong>Spec-Driven Development (SDD)</strong>, earned Hackathon Champion recognition, and led mobile engineering standards — resulting in promotion from <strong>Tech Lead</strong> to <strong>Mobile Expert</strong>.</li></ul>'**
  String get ittiDevJobDescription;

  /// Developer job title at Pairtree
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get pairtreeDevJobTitle;

  /// Developer job description at Pairtree
  ///
  /// In en, this message translates to:
  /// **'<ul><li><strong>Mobile Delivery:</strong> Built production <strong>Flutter</strong> apps on <strong>BLoC</strong>, with unit, widget, integration, and <strong>golden tests</strong> — raising UI regression safety.</li><li><strong>CI/CD Automation:</strong> Built <strong>GitHub Actions</strong> pipelines for test and deploy — shortening review feedback loops.</li><li><strong>Backend Quality:</strong> Contributed to <strong>FastAPI</strong> services with <strong>SQLAlchemy</strong> and <strong>Alembic</strong>, reaching <strong>100% code coverage</strong> using fixtures for functional and regression tests.</li><li><strong>Reliability:</strong> Tracked defects with <strong>Sentry</strong> and partnered with developers to diagnose and resolve production issues.</li></ul>'**
  String get pairtreeDevJobDescription;

  /// Developer job title at Tandamos
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get tandamosDevJobTitle;

  /// Developer job description at Tandamos
  ///
  /// In en, this message translates to:
  /// **'<ul><li><strong>Customer App:</strong> Delivered a customer-facing <strong>Flutter</strong> app with <strong>Riverpod</strong> and reusable UI components — improving consistency across screens.</li><li><strong>Backend Enhancement:</strong> Extended <strong>Nest.js</strong> / <strong>TypeScript</strong> services and a <strong>TypeORM</strong> layer over <strong>MySQL</strong> — simplifying data access.</li><li><strong>Quality &amp; Platform:</strong> Added automated unit, widget, and integration tests; used <strong>Firebase</strong> for auth and sync; extracted reusable <strong>Node.js</strong> functions — reducing redundancy.</li></ul>'**
  String get tandamosDevJobDescription;

  /// Developer job title at Valtech
  ///
  /// In en, this message translates to:
  /// **'Backend Developer'**
  String get valtechDevJobTitle;

  /// Developer job description at Valtech
  ///
  /// In en, this message translates to:
  /// **'<ul><li><strong>Email Platform:</strong> Built a <strong>Spring Boot</strong> service so internal systems could send email via <strong>Google Pub/Sub</strong> and <strong>Oracle Responsys</strong> — improving delivery reliability and scale.</li><li><strong>APIs &amp; Quality:</strong> Exposed <strong>RESTful APIs</strong>, added unit and integration tests, and resolved defects and third-party conflicts across the full application lifecycle.</li><li><strong>Collaboration:</strong> Partnered with developers and stakeholders to ship the service and adopt tools that improved functionality.</li></ul>'**
  String get valtechDevJobDescription;

  /// Developer job title at Freelance
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get freelanceDevJobTitle;

  /// Developer job description at Freelance
  ///
  /// In en, this message translates to:
  /// **'<ul><li><strong>Mobile &amp; Web Apps:</strong> Delivered Flutter apps using <strong>Provider</strong>, <strong>BLoC</strong>, <strong>Riverpod</strong>, and <strong>GetX</strong>, with unit, widget, golden, and integration tests.</li><li><strong>Java Backends:</strong> Built <strong>Spring Boot</strong> systems with Security, OAuth2, WebSockets, Actuator, Swagger, and <strong>GCP</strong> storage/messaging.</li><li><strong>Python Services:</strong> Built <strong>Flask</strong>/<strong>FastAPI</strong> backends with WebSockets, <strong>SQLAlchemy</strong>, asyncio, Pydantic, and <strong>Alembic</strong> migrations.</li><li><strong>Store Releases:</strong> Shipped mobile apps to <strong>Google Play</strong> and the <strong>App Store</strong> without rejection.</li><li><strong>Cloud DevOps:</strong> Operated <strong>GCP</strong> CI/CD with Cloud Run, App Engine Flexible, Cloud Build, and Artifact Registry.</li><li><strong>Firebase Platform:</strong> Used <strong>Firebase</strong> Auth (Google/Facebook), Firestore, Storage, Functions, Pub/Sub, Remote Config, and Elasticsearch full-text search.</li><li><strong>Observability:</strong> Tracked quality with <strong>Google Analytics</strong>, <strong>Crashlytics</strong>, and <strong>Sentry</strong>.</li><li><strong>Domain Delivery:</strong> Integrated <strong>OCPP 1.6</strong> EV chargers; gathered requirements; trained developers; led large-scale deployments.</li></ul>'**
  String get freelanceDevJobDescription;

  /// Vulletic project description
  ///
  /// In en, this message translates to:
  /// **'The purpose of the solution built is to integrate Electric Vehicle Charger with an online platform that manages them. The mobile application built in Flutter with GetX as the state management package connects the users with the Electric Vehicle Charger in order to charge their vehicles allowing them to pay through the platform. The web application built in Nuxt allows the Electric Vehicle Charger owner to manage them and get all the information they need. The chargers are connected in real-time using WebSocket connection with the backend built in Python. The platform and the mobile app was developed for the company Vulletic, which is the electrical vehicles chargers provider.'**
  String get vulleticProjectDescription;

  /// No description provided for @collectioProjectDescriptionHtml.
  ///
  /// In en, this message translates to:
  /// **'The purpose of the application is to facilitate monthly membership collection. It was builded thinking on how to help associations and clubs that collect the monthly membership manually with a collector person. With this application they can automate invoice delivery, remind users about which ones are still pending and help the collector to not miss anyone or repeat someone. The application is built in Flutter with the GetX framework. It uses Firebase as the authentication platform and Firestore as the real-time database'**
  String get collectioProjectDescriptionHtml;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
