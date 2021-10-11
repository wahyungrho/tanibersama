part of 'models.dart';

class PortfolioModel {
  final String? invoice;
  final String? name;
  final String? phone;
  final String? unit;
  final String? payback;
  final String? costInvest;
  final String? orderAt;
  final String? statusOrder;
  final String? nameBorrower;
  final String? location;
  final String? programName;
  final String? description;
  final String? image;
  final String? margin;
  final String? periodeMargin;
  final String? contractDuration;
  final String? status;

  PortfolioModel({
    this.invoice,
    this.name,
    this.phone,
    this.unit,
    this.payback,
    this.costInvest,
    this.orderAt,
    this.statusOrder,
    this.nameBorrower,
    this.location,
    this.programName,
    this.description,
    this.image,
    this.margin,
    this.periodeMargin,
    this.contractDuration,
    this.status,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      invoice: json['invoice'],
      name: json['name'],
      phone: json['phone'],
      unit: json['unit'],
      payback: json['payback'],
      costInvest: json['cost_invest'],
      orderAt: json['order_at'],
      statusOrder: json['status_order'],
      nameBorrower: json['name_borrower'],
      location: json['location'],
      programName: json['program_name'],
      description: json['description'],
      image: json['image'],
      margin: json['margin'],
      periodeMargin: json['periode_margin'],
      contractDuration: json['contract_duration'],
      status: json['status'],
    );
  }
}
