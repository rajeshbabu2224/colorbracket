class EmployeeModel {
  final String name, company, designation, company_logo;
  final int id;

  EmployeeModel({
    required this.company_logo,
    required this.designation,
    required this.company,
    required this.id,
    required this.name,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      name: json['name'],
      company: json['company'],
      company_logo: json['company_logo'],
      id: json['id'],
      designation: json['designation'],
    );
  }
}
