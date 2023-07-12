import 'package:employee_attendance_getx/app/constrants/strings.dart';
import 'package:employee_attendance_getx/app/data/services/base_client.dart';

class HomeService {
  static Future<dynamic> getOfficeLocation({
    required String token,
  }) async {
    return await BaseClient.getData(api: ConstantStrings.kGetOfficeLocation, token:token );
  }
}
