run:
	flutter run -t lib/main_development.dart --flavor development

loc: 
	flutter gen-l10n

tools:
	dart pub global run devtools

format:
	dart format --line-length=80 .

check-rules:
	sg scan

codegen:
	flutter pub run build_runner build --delete-conflicting-outputs

codegen-watch:
	flutter pub run build_runner watch --delete-conflicting-outputs

coverage:
	flutter test --coverage

coverage-html:
	genhtml coverage/lcov.info -o coverage/html

