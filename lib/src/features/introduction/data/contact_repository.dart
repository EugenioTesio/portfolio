import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/features/introduction/domain/contact.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_repository.g.dart';

@riverpod
ContactRepository contactRepository(ContactRepositoryRef ref) {
  return ContactRepository();
}

class ContactRepository {
  List<Contact> fetchContacts() {
    return const [
      Contact(
        tooltip: 'LinkedIn',
        url: 'https://www.linkedin.com/in/eugenio-tesio/',
        icon: FontAwesomeIcons.linkedin,
      ),
      Contact(
        tooltip: 'Github',
        url: 'https://github.com/EugenioTesio',
        icon: FontAwesomeIcons.github,
      ),
      Contact(
        tooltip: 'eugeniotesio@gmail.com',
        url: 'mailto:eugeniotesio@gmail.com',
        icon: FontAwesomeIcons.solidEnvelope,
      ),
      Contact(
        tooltip: '+54 9 3564 59 9945',
        url: 'tel:+5493564599945',
        icon: FontAwesomeIcons.phone,
      ),
      Contact(
        tooltip: 'Medium',
        url: 'https://medium.com/@eugeniotesio',
        icon: FontAwesomeIcons.medium,
      ),
    ];
  }
}
