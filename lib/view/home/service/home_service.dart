import 'package:movies_catalog/core/components/utility/service_helper.dart';
import 'package:movies_catalog/view/home/service/IHomeService.dart';
import 'package:vexana/vexana.dart';

class HomeService extends IHomeService with ServiceHelper {
  HomeService(INetworkManager manager) : super(manager: manager);
  
}
