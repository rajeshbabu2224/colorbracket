class EmployeeDetailsModel {
  final String name,
      company,
      designation,
      company_logo,
      interests,
      view_more,
      job_descripton,
      rating;
  final int id;

  EmployeeDetailsModel({
    required this.company_logo,
    required this.designation,
    required this.company,
    required this.id,
    required this.name,
    required this.job_descripton,
    required this.rating,
    required this.interests,
    required this.view_more,
  });

  factory EmployeeDetailsModel.fromJson(Map<String, dynamic> json) {
    return EmployeeDetailsModel(
      name: json['name'],
      company: json['company'],
      company_logo: json['company_logo'],
      id: json['id'],
      view_more: json['view_more'],
      interests: json['interests'],
      rating: json['rating'],
      job_descripton: json['job_descripton'],
      designation: json['designation'],
    );
  }
}
