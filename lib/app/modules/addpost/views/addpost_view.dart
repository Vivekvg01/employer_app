import 'package:employer_app/app/common_widgets/rect_button.dart';
import 'package:employer_app/app/utils/app_colors.dart';
import 'package:employer_app/app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/addpost_controller.dart';

class AddpostView extends GetView<AddpostController> {
  AddpostView({Key? key}) : super(key: key);

  final addPostController = Get.put(AddpostController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kBlackColor,
        ),
        title: Text(
          'Add Post',
          style: TextStyle(color: kBlackColor),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: addPostController.titleController,
                decoration: const InputDecoration(
                  hintText: 'Title for your job',
                  border: OutlineInputBorder(),
                ),
              ),
              sizedheight(size.height * 0.03),
              TextFormField(
                controller: addPostController.descriptionController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: 'Add your detailed description of your job',
                  border: OutlineInputBorder(),
                ),
              ),
              sizedheight(size.height * 0.03),
              TextFormField(
                controller: addPostController.searchTagController,
                decoration: const InputDecoration(
                  hintText: 'Add Search tags',
                  border: OutlineInputBorder(),
                ),
              ),
              sizedheight(size.height * 0.03),
              TextFormField(
                controller: addPostController.budgetController,
                decoration: const InputDecoration(
                  hintText: "\$ Budget ",
                  border: OutlineInputBorder(),
                ),
              ),
              sizedheight(size.height * 0.03),
              TextFormField(
                controller: addPostController.deadlineController,
                decoration: const InputDecoration(
                  hintText: 'Number of days to finish',
                  border: OutlineInputBorder(),
                ),
              ),
              sizedheight(size.height * 0.03),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Advanced',
                  border: OutlineInputBorder(),
                ),
              ),
              sizedheight(size.height * 0.03),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.06,
                child: CustomRectButton(
                  buttonLabel: 'Post Jobs',
                  onButtonClicked: () {
                    addPostController.addPost();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
