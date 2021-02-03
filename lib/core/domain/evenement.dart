class Evenement {
  final int evenement_id;
  final String evenement_date_debut;
  final String evenement_date_fin;
  final String evenement_nom;
  final String evenement_type;
  final int participant;

  Evenement(
      {this.evenement_id,
      this.evenement_date_debut,
      this.evenement_date_fin,
      this.evenement_nom,
      this.evenement_type,
      this.participant});

  factory Evenement.fromJson(Map<String, dynamic> json) {
    return Evenement(
      evenement_id: json['evenement_id'],
      evenement_date_debut: json['evenement_date_debut'],
      evenement_date_fin: json['evenement_date_fin'],
      evenement_nom: json['evenement_nom'],
      evenement_type: json['evenement_type'],
      participant: json['participant'],
    );
  }
}
