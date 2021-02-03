import 'package:demo/core/domain/evenement.dart';


class Jury {
  final int jury_id;

  final String jury_nom;

  final String jury_code;
  final String jury_telephone;
  final String jury_email;
  final Evenement evenement;
  Jury(
      {this.jury_id,
        this.jury_code,
        this.jury_nom,
        this.jury_telephone,
        this.evenement,
        this.jury_email,
      });

  factory Jury.fromJson(Map<String, dynamic> json) {
    return Jury(
      jury_id: json['juryId'],
      jury_nom: json['juryNomComplet'],
      jury_code: json['juryCode'],
      jury_email: json['juryEmail'],
      evenement: Evenement.fromJson(json['evenement']),
    );
  }
}
