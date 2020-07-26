import 'package:get_it/get_it.dart';
import 'package:flutter_project_accelerator/services/geodataservice.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';

GetIt iocContainer = GetIt();

void setupIocContainer() {
  iocContainer.registerSingleton(new GeoDataService());
  iocContainer.registerSingleton(new NavigationService());
}