library SiaInterface.Daemon;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Abstract.dart';

class DaemonStop extends Abstract {
  bool Success;
  DaemonStop(Map jsonFormat, this.Success) : super(jsonFormat);
  DaemonStop copy() => new DaemonStop(jsonFormat, this.Success);

  static void stop(Function onFinish) {
      var url = "http://localhost:9980/daemon/stop";
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}

class DaemonUpdateApply extends Abstract{
  bool Success;
  DaemonUpdateApply(Map jsonFormat, this.Success) : super(jsonFormat);
  DaemonUpdateApply copy() => new DaemonUpdateApply(jsonFormat, this.Success);
  
  static void updateApply(Function onFinish) {
      var url = "http://localhost:9980/daemon/update/apply";
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}

class DaemonUpdateCheck extends Abstract{
  bool Available;
  String Version;

  DaemonUpdateCheck(Map jsonFormat,this.Available, this.Version) : super(jsonFormat);
  DaemonUpdateCheck copy() => new DaemonUpdateCheck(jsonFormat, this.Available, this.Version);
}




