import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../models/FirebaseUserModel.dart';
import '../services/FirebaseFirestoreService.dart';

class FeedbackFormViewModel extends ChangeNotifier {

  FeedbackFormViewModel({required String? merchantId}) {
    fetchUserData(merchantId);
    queRateVal = List.filled(que.length, 0);
  }

  final reviewController = TextEditingController();
  final feedbackController = TextEditingController();

  FirebaseUserModel? userModel;

  List<PickedFile>? images = [];
  int currentImagePreview = 0;
  int currentEmotion = 2;

  List<String> tempPostTags = [];
  List<String> que = [
    "How about the behaviour ?",
    "How about his nature ?",
    "Product Quality ?",
    "Product Availavility ?"
  ];
  int currentQue = 0;

  List<int> queRateVal = [];

  List<String> postTags = ["Support","vocal for local","good","boom","heigine","support local bussinesses"];

  void fetchUserData(String? id) async {
    userModel = await FirebaseFirestoreService().getMerchant(collection: 'A2MerchatQR', uId: id ?? '1000');
  }

  void changeEmotion(int val){
    currentEmotion = val;
  }

  final PageController queController = PageController(
    initialPage: 0,
    viewportFraction: 0.95,
  );

  Future<void> updateStarRating(int val) async {
    print(val);
    queRateVal[currentQue] = val;
    print(queRateVal);
    if(currentQue < que.length-1) {
      currentQue = (currentQue + 1);
      await Future.delayed(
        Duration(milliseconds: 150),
      );
      queController.animateToPage(
        currentQue+1,
        duration: Duration(milliseconds: 200), // animation duration
        curve: Curves.easeInOut, // animation curve
      );
    }
    notifyListeners();
    print(queRateVal);
  }

  bool isEachAnsGiven(){
    final bool isZeroPresent = queRateVal.any((element) => element == 0);
    return isZeroPresent;
  }

  void transferMainToTempTags(int index){
    tempPostTags.add(postTags[index]);
    postTags.removeAt(index);
    notifyListeners();
  }

  void transferTempToMainTags(int index){
    postTags.add(tempPostTags[index]);
    tempPostTags.removeAt(index);
    notifyListeners();
  }

  PageController imageController = PageController(
    initialPage: 0,
    // viewportFraction: 0.95,
  );

  void removeImageAtIndex(int index) {
    if (index >= 0 && index < images!.length) {
      images?.removeAt(index);
    }
    notifyListeners();
  }

  Future<void> getImage({bool isGallery = true}) async {
    if (isGallery) {
      List<PickedFile>? selectedImages = await ImagePicker().getMultiImage(
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 80,
      );
      if (selectedImages != null) {
        images?.addAll(selectedImages);
      }
    } else {
      PickedFile? selectedImage =
          await ImagePicker().getImage(source: ImageSource.camera);
      if (selectedImage != null) {
        images?.add(selectedImage);
      }
    }
    notifyListeners();
  }
}
