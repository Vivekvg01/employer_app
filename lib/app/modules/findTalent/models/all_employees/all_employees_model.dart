import 'package:employer_app/app/modules/findTalent/models/all_employees/employee_model.dart';

class GetAllEmployee {
  GetAllEmployee({
    this.allEmplyees,
    this.page,
    this.pages,
  });

  List<AllEmployee?>? allEmplyees;
  int? page;
  int? pages;

  factory GetAllEmployee.fromJson(Map<String, dynamic> json) => GetAllEmployee(
        allEmplyees: json["allEmplyees"] == null
            ? []
            : List<AllEmployee?>.from(
                json["allEmplyees"]!.map(
                  (x) => AllEmployee.fromJson(x),
                ),
              ),
        page: json["page"],
        pages: json["pages"],
      );
}
