

import 'package:freckled_zelda/services/api_service.dart';


class APICalls {
 

  checkEmailExists(email) async {
    var req = await ApiService.getData("user/check_email/$email");
    return req;
  }

  
}
