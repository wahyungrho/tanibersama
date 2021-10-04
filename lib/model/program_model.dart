part of 'models.dart';

class ProgramModel {
  final String? idProgram;
  final String? idBorrower;
  final String? nameBorrower;
  final String? locationBorrower;
  final String? programName;
  final String? description;
  final String? price;
  final String? image;
  final String? unitRegistered;
  final String? unitAvailable;
  final String? margin;
  final String? periodeMargin;
  final String? contractDuration;
  final String? status;

  ProgramModel({
    this.idProgram,
    this.idBorrower,
    this.nameBorrower,
    this.locationBorrower,
    this.programName,
    this.description,
    this.price,
    this.image,
    this.unitRegistered,
    this.unitAvailable,
    this.margin,
    this.periodeMargin,
    this.contractDuration,
    this.status,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
      idProgram: json['id_program'],
      idBorrower: json['id_borrower'],
      nameBorrower: json['name_borrower'],
      locationBorrower: json['location_borrower'],
      programName: json['program_name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      unitRegistered: json['unit_registered'],
      unitAvailable: json['unit_available'],
      margin: json['margin'],
      periodeMargin: json['periode_margin'],
      contractDuration: json['contract_duration'],
      status: json['status'],
    );
  }
}
