import 'dart:convert';

import 'package:intesasoft_demo/app/constants/app_constants.dart';
import 'package:intesasoft_demo/app/enums/viewstate.dart';
import 'package:intesasoft_demo/app/init/network/network_manager.dart';

import '../../app/base/base_model.dart';
import 'detail_model.dart';

class DetailViewModel extends BaseModel {
  DetailModel? detailModel;

  String _cityId = '';
  String get cityId => _cityId;

  void changeCityId(String i) {
    _cityId = i;
    notifyListeners();
  }

  Future getCity(String id) async {
    setViewState(ViewState.Busy);
    Map<String, dynamic> res =
        await NetworkManager.instance.getCity(url: CITIES_API + id);
    detailModel = DetailModel.fromJson(
        jsonDecode(jsonEncode(res)) as Map<String, dynamic>);
    setViewState(ViewState.Idle);
    notifyListeners();
  }
}
