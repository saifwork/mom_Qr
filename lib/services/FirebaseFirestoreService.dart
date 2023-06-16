import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/FirebaseUserModel.dart';

class FirebaseFirestoreService{

    Future<FirebaseUserModel?> getMerchant({required String collection ,required String uId}) async {
        print("inside get Merchant");
        try {
            CollectionReference merchant =
            FirebaseFirestore.instance.collection(collection);
            final snapshot = await merchant.doc(uId).get();
            FirebaseUserModel firebaseUserModel =
            FirebaseUserModel.fromJson(snapshot.data() as Map<String, dynamic>);
            return firebaseUserModel;
        } catch (e) {
            print(e.toString());
        }
        return null;
    }

    static List<String> splitQrData(String data){

        // Split the string into two parts based on the # character
        List<String> parts = data.split('#');

        // Extract the two parts
        String launcherUrl = parts[0];
        String userId = parts[1];

        print("First part: $launcherUrl");
        print("Second part: $userId");
        return parts;
    }
}