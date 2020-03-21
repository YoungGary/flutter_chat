
// 键盘 输入 provider
import 'package:flutter/material.dart';
class ContentEditingProvider with ChangeNotifier {

  bool ifEdited;
  int times;
  TextEditingController txtController = TextEditingController();
  FocusNode focusNode;
  ContentEditingProvider(){
    ifEdited=false;
  }
  
  updateEditStatus(TextEditingController controller){
    if(controller.text!=null && controller.text.length>0){
      ifEdited=true;
    }
    else{
      ifEdited=false;
    }
    notifyListeners();
  }
}