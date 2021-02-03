import 'package:demo/core/domain/evenement.dart';


class Groupe {
  final int groupe_id;

  final String groupe_nom;
  final String groupe_code;
  final String image;
  final Evenement evenement;
  Groupe(
      {this.groupe_id,
        this.groupe_nom,
        this.groupe_code,
        this.image,
        this.evenement,
      });

  factory Groupe.fromJson(Map<String, dynamic> json) {
    return Groupe(
      groupe_id: json['groupeId'],
      groupe_nom: json['groupeNom'],
      groupe_code: json['groupeCode'],
      image: json['groupePhoto'],
      evenement: Evenement.fromJson(json['evenement']),
    );
  }
}
