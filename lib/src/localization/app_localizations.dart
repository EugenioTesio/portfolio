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

  /// Developer job title at Pairtree
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get pairtreeDevJobTitle;

  /// Developer job description at Pairtree
  ///
  /// In en, this message translates to:
  /// **'<ul> <li>Developed applications using Flutter and BLoC architecture.</li> <li>Used GitHub Actions for testing and deployment.</li> <li>Performed unit, widget, and integration testing.</li> <li>Implemented golden testing for UI development.</li> <li>Assisted in Python backend development using FastAPI.</li> <li>Utilized SQLAlchemy and Alembic migrations for database operations.</li> <li>Achieved 100% code coverage for all tests in Python Backend.</li> <li>Utilized fixtures to create test data for functional and regression tests.</li> <li>Modified existing test cases to improve coverage and accuracy.</li> <li>Worked with developers to troubleshoot and resolve software issues.</li> <li>Developed and improved CI/CD pipelines.</li> <li>Identified and tracked issues with Sentry.</li> </ul>'**
  String get pairtreeDevJobDescription;

  /// Developer job title at Tandamos
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get tandamosDevJobTitle;

  /// Developer job description at Tandamos
  ///
  /// In en, this message translates to:
  /// **'<ul> <li>Developed a customer-facing mobile application using Flutter.</li> <li>Enhanced existing backend services built with Next.js using TypeScript.</li> <li>Developed a TypeORM framework to manage data access from a MySQL database.</li> <li>Utilized the Riverpod state management library to store and manage application state.</li> <li>Developed custom reusable UI components using Flutter.</li> <li>Developed automated unit, widget, and integration tests to ensure application stability.</li> <li>Developed reusable functions in Node.js to reduce code redundancy.</li> <li>Utilized Firebase for authentication, authorization, and data synchronization.</li> </ul>'**
  String get tandamosDevJobDescription;

  /// Developer job title at Valtech
  ///
  /// In en, this message translates to:
  /// **'Backend Developer'**
  String get valtechDevJobTitle;

  /// Developer job description at Valtech
  ///
  /// In en, this message translates to:
  /// **'<ul> <li>Developed a Java Spring Boot app that allowed other internal services to send emails using Google Pub/Sub</li> <li>The service used Oracle Responsys to enable the delivery of emails Improved reliability and scalability of the email delivery system.</li> <li>Created unit and integration tests to ensure the app met the requirements.</li> <li>Investigated and resolved any bugs or errors encountered</li> <li>Developed RESTful APIs to enable the app to communicate with other services.</li> <li>Collaborated with other developers and stakeholders to ensure success.</li> <li>Managed the development of the app through its full life cycle.</li> <li>Identified and deployed new tools to improve the app functionality.</li> <li>Resolved conflicts between the app and third-party services.</li> </ul>'**
  String get valtechDevJobDescription;

  /// Developer job title at Freelance
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get freelanceDevJobTitle;

  /// Developer job description at Freelance
  ///
  /// In en, this message translates to:
  /// **'<ul> <li> Worked on web and mobile applications using Flutter with State Management such as Provider, BloC, Riverpod, GetX. Unit Test, Widget test, Golden test, and integration test. </li> <li>Developed software applications with Java using SpringBoot implementing Spring Web, Hibernate, Spring Data JPA, Spring Security, OAuth2 Client, Spring JDBC, Spring. Data MongoDB, WebSockets, Spring Messaging, Scheduler, Spring Cache, Spring Boot Actuator, Swagger, GCP Storage, and GCP Messaging.</li> <li>Developed Python back-end components using Flask or FastAPI, WebSockets, SqlAlchemy, and REST API with Asyncio coroutine manager, Base Model (pydantic)</li> <li>Developed automatic&nbsp;database migration in Python backends&nbsp;with Alembic from SqlAlchemy.</li> <li>Deployed mobile applications in Google PlayStore and AppStore without being rejected.</li> <li>Performed DevOps operations in Google Cloud such as CI/CD using Cloud Run, Cloud App Engine Flexible Environment, Cloud Build, Cloud Artifacts</li> <li>Worked on modularization, creating multiple packages.</li> <li>Worked with Firebase as a back-end platform, and with Google and Facebook for authentication</li> <li>Worked with Firestore NoSQL database, Google Storage, Google Functions, Google Pub/Sub, and Remote Config.</li> <li>Performed Firebase full-text search Elastic Search.</li> <li>Used Google Analytics, Crashlytics, and Sentry for bugs and metrics follow-up.</li> <li>Worked with OCPP 1.6 (Open Charge Point Protocol), the vehicle electrical charger connection protocol.</li> <li>Monitored ongoing operation of assigned programs and responded to problems by diagnosing and correcting logic and coding errors.</li> <li>Discussed project progress with customers, collected feedback on different stages, and directly addressed concerns.</li> <li>Gathered and defined customer requirements to develop clear specifications for project plans</li> <li>Orchestrated efficient large-scale software deployments, including testing features and correcting code.</li> <li>Designed and documented systems based on the results of the analysis.</li> <li>Developed databases, programs, and processes for integration and implementation across the enterprise.</li> <li>Trained new developers and programmers on company standards for design and review.</li> <li>Reviewed user requirements, analyzed, designed, implemented, installed, and delivered training for new applications.</li> </ul>'**
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
