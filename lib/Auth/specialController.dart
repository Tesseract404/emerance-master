import 'package:get/get.dart';

class specialController extends GetxController{
  var selectedInsurance = "Car & Health Insurace".obs;


  get text  => selectedInsurance;

  onChangeinsurance(var insurance) {
    selectedInsurance.value= insurance;
}

}