import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../components/CustomCard.dart';
import '../../../components/CustomTagButton.dart';
import '../../../components/DotIndicator.dart';
import '../../../utils/config/size_config.dart';
import '../../../utils/style/colors.dart';
import '../../../utils/style/style.dart';
import '../../../viewModel/FeedbackFormViewModel.dart';

class AddImage extends StatelessWidget {
  final BuildContext context;
  final FeedbackFormViewModel vm;

  const AddImage({Key? key, required this.context, required this.vm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryText(
                  text: "Add Image",
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w200,
                ),
                CustomTagButton(
                  title: '+',
                  Press: () {
                    showImagePickerBottomSheet(context, vm);
                  },
                  btnWidth: 50,
                  color: Colors.teal,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            if (vm.images!.isNotEmpty)
              Container(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: vm.images!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showSelectionOnImagePickerBottomSheet(
                            context, index, vm);
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: kIsWeb
                                ? NetworkImage(vm.images![index].path) as ImageProvider<Object>
                                : FileImage(File(vm.images![index].path)) as ImageProvider<Object>,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void updateImageControllerIndex(
      BuildContext context, int index, FeedbackFormViewModel _vm) {
    _vm.imageController = PageController(initialPage: index);
    showImagePreviewBottomSheet(context, _vm);
  }

  showImagePreviewBottomSheet(BuildContext context, FeedbackFormViewModel _vm) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      builder: (BuildContext context) {
        return Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! * 0.9,
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryText,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.secondaryText),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Post Preview",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBg,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: PageView.builder(
                        controller: _vm.imageController,
                        onPageChanged: (index) {
                          _vm.currentImagePreview = index;
                        },
                        itemBuilder: (_, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: kIsWeb
                                    ? NetworkImage(vm.images![index].path) as ImageProvider<Object>
                                    : FileImage(File(vm.images![index].path)) as ImageProvider<Object>,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        itemCount: _vm.que.length,
                      ),
                    ),
                    DotIndicator(
                        rightPosition: 20,
                        numOfDot: _vm.images!.length,
                        currentPage: _vm.currentImagePreview,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomCard(
                  title: 'Select Tags',
                  subWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: List.generate(
                          _vm.postTags.length,
                          (index) => InkWell(
                            onTap: () {
                              _vm.transferMainToTempTags(index);
                            },
                            child: Container(
                              margin: EdgeInsets.all(3.0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 6.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.teal),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                _vm.postTags[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        children: List.generate(
                          _vm.tempPostTags.length,
                          (index) => InkWell(
                            onTap: () {
                              _vm.transferTempToMainTags(index);
                            },
                            child: Container(
                              margin: EdgeInsets.all(3.0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 6.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.teal),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                _vm.tempPostTags[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomCard(
                  title: 'Your FeedBack',
                  subWidget: Text(
                    _vm.feedbackController.value.text,
                    style: TextStyle(
                        fontSize: 16, height: 1.4, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showImagePickerBottomSheet(BuildContext context, FeedbackFormViewModel _vm) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () {
                _vm.getImage(isGallery: false);
                Navigator.pop(context); // Close the bottom sheet
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                _vm.getImage();
                Navigator.pop(context); // Close the bottom sheet
                // Call the gallery-related functionality
                // ...
              },
            ),
          ],
        );
      },
    );
  }

  showSelectionOnImagePickerBottomSheet(
      BuildContext maincontext, int index, FeedbackFormViewModel _vm) {
    showModalBottomSheet(
      context: maincontext,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.preview_outlined),
              title: Text('Preview'),
              onTap: () {
                Navigator.pop(context);
                updateImageControllerIndex(maincontext, index, _vm);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_outline_outlined),
              title: Text('Delete'),
              onTap: () {
                _vm.removeImageAtIndex(index);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
