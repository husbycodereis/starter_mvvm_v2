import 'package:movies_catalog/core/constants/app/app_constants.dart';

class SettingsDynamicModel {
  final String? url;
  final String title;
  SettingsDynamicModel({
    this.url,
    required this.title,
  });

  factory SettingsDynamicModel.fakeArchitecturePR() {
    return SettingsDynamicModel(title: 'Project Contributors', url: ApplicationConstants.APP_WEB_SITE);
  }
  factory SettingsDynamicModel.fakeNull() {
    return SettingsDynamicModel(title: 'Project Owner');
  }
}
