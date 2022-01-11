import 'package:flutter/widgets.dart';
import 'package:intesasoft_demo/app/constants/app_constants.dart';
import 'package:intesasoft_demo/app/enums/viewstate.dart';
import 'package:intesasoft_demo/app/init/network/network_manager.dart';
import 'package:intesasoft_demo/views/home/home_model.dart';

import '../../app/base/base_model.dart';

class HomeViewModel extends BaseModel {
  HomeModel? homeModel;
  List<HomeModel> res = [];
  List<HomeModel> filteredList = [];
  String _cityId = '';
  String get cityId => _cityId;
  String _qrText = '';
  String get qrText => _qrText;
  TextEditingController qrTextEditingController = TextEditingController();

  void changeCityId(String i) {
    _cityId = i;
    notifyListeners();
  }

  void getQrText(String i) {
    _qrText = i;
    notifyListeners();
  }

  int _homeView = 0;
  int get homeView => _homeView;

  setHomeView(int i) {
    _homeView = i;
    notifyListeners();
  }

  Future getCityList() async {
    setViewState(ViewState.Busy);
    res = [];
    res = await NetworkManager.instance.getCities(url: CITIES_API);
    filteredList = res;
    setViewState(ViewState.Idle);
    notifyListeners();
  }

  filterCities(String? enteredKeyword) {
    filteredList = res
        .where((element) =>
            element.name.toLowerCase().contains(enteredKeyword!.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
