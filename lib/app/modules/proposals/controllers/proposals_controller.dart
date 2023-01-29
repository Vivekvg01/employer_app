import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProposalsController extends GetxController {
  late TabController tabController;

  final List<Tab> tabs = [
    const Tab(text: "All Proposals"),
    const Tab(text: "Shortlisted"),
    const Tab(text: "Messaged"),
  ];
}
