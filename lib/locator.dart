import 'package:get_it/get_it.dart';
import 'package:intesasoft_demo/views/home/home_viewmodel.dart';
import 'package:intesasoft_demo/views/qr/qr_viewmodel.dart';

import 'views/detail/detail_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => DetailViewModel());
  locator.registerLazySingleton(() => QRViewModel());
}
