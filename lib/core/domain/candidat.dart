import 'package:demo/core/domain/evenement.dart';


class Candidat {
  final int candidat_id;

  final String candidat_nom;
  final String candidat_prenom;
  final String candidat_code;
  final String image;
  final Evenement evenement;
  Candidat(
      {this.candidat_id,
        this.candidat_nom,
        this.candidat_prenom,
        this.candidat_code,
        this.image,
        this.evenement,
        });

  factory Candidat.fromJson(Map<String, dynamic> json) {
    return Candidat(
      candidat_id: json['candidatId'],
      candidat_nom: json['candidatNom'],
      candidat_prenom: json['candidatPrenoms'],
      candidat_code: json['candidatCode'],
      image: json['candidatPhoto'],
      evenement: Evenement.fromJson(json['evenement']),
    );
  }
}
