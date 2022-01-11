import 'package:intesasoft_demo/app/enums/viewstate.dart';
import 'package:intesasoft_demo/views/home/home_model.dart';

import '../../app/base/base_model.dart';

class QRViewModel extends BaseModel {
  Future getCityList() async {
    setViewState(ViewState.Busy);

    setViewState(ViewState.Idle);
  }
}
