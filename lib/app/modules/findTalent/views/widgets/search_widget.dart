import 'package:employer_app/app/modules/findTalent/api/get_all_employee_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindTalendsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: GetAllEmployeeApi().searchEmployee(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length ?? 1,
          itemBuilder: (context, index) {
            if (snapshot.hasData) {
              return ListTile(
                title: Text(snapshot.data[index].allEmployee.title),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
