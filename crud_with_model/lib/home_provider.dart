import 'package:crud_with_model/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  List<UserModel> userData = [];

  var globalKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  insertData() {
    userData.add(
      UserModel(name: nameController.text, phone: phoneController.text),
    );
    nameController.clear();
    phoneController.clear();
    notifyListeners();
  }

  updateData(int index) {
    userData[index] = UserModel(
      name: nameController.text,
      phone: phoneController.text,
    );
    notifyListeners();
  }

  deleteData(int index) {
    userData.removeAt(index);
    notifyListeners();
  }
}
