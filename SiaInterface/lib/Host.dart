library SiaInterface.Host;

import 'package:http/http.dart' as http;
import "dart:convert";
import 'Abstract.dart';

class HostAnnounce extends Abstract {
  bool Success;
  HostAnnounce(Map jsonFormat, this.Success) : super(jsonFormat);
  HostAnnounce copy() => new HostAnnounce(jsonFormat, this.Success);
  
  static void announce(Function onFinish) {
    var url = "http://localhost:9980/host/announce";
             http.get(url).then((response) {
               print("Response status: ${response.statusCode}");
               print("Response body: ${response.body}"); 
               Map parsedMap = JSON.decode(response.body);
               onFinish(parsedMap["success"]);
              });
  }
}

class HostConfig extends Abstract {
  bool Success;
  HostConfig(Map jsonFormat, this.Success) : super(jsonFormat);
  HostConfig copy() => new HostConfig(jsonFormat, Success);
  
  static void config(String TotalStorage, String MinFilesize, String MaxFileSize, String MinDuration, String MaxDuration, String WindowSize, String Price, String Collateral, Function onFinish) {
    var url = "http://localhost:9980/host/config";
          url += '?TotalStorage=$TotalStorage&MinFilesize=$MinFilesize&MaxFileSize=$MaxFileSize&MinDuration=$MinDuration&MaxDuration=$MaxDuration&WindowSize=$WindowSize&Price=$Price&Collateral=$Collateral';    // Addition of Parameters
          http.get(url).then((response) {
            print("Response status: ${response.statusCode}");
            print("Response body: ${response.body}"); 
            Map parsedMap = JSON.decode(response.body);
            onFinish(parsedMap["success"]);
           });
  }
}

class HostStatus extends Abstract {
  int TotalStorage;
  int MinFilesize;
  int MaxFileSize;
  int MinDuration;
  int MaxDuration;
  int WindowSize;
  int Price;
  int Collateral;
  int StorageRemaining;
  int NumContracts;
  
  HostStatus(Map jsonFormat, this.TotalStorage, this.MinFilesize, this.MaxFileSize, this.MinDuration, this.MaxDuration, this.WindowSize, this.Price, this.Collateral, this.StorageRemaining, this.NumContracts) : super(jsonFormat);
  HostStatus copy() => new HostStatus(jsonFormat, this.TotalStorage, this.MinFilesize, this.MaxFileSize, this.MinDuration, this.MaxDuration, this.WindowSize, this.Price, this.Collateral, this.StorageRemaining, this.NumContracts);

  void parseUpdate(Map json){
    if(json == this.jsonFormat)
    this.jsonFormat = json;
    this.TotalStorage = json["TotalStorage"];
    this.MinFilesize  = json["MinFilesize"];
    this.MaxFileSize = json["MaxFileSize"];
    this.MinDuration = json["MinDuration"];
    this.MaxDuration = json["MaxDuration"];
    this.WindowSize = json["WindowSize"];
    this.Price = json["Price"];
    this.Collateral = json["Collateral"];
    this.StorageRemaining = json["StorageRemaining"];
    this.NumContracts = json["NumContracts"];
  }
}
class HostDBHostsActive extends Abstract {
  //unclear type
  List<String> Entries;   //  List<HostEntry> Entries = null;
  HostDBHostsActive(Map jsonFormat, this.Entries) : super(jsonFormat);
  HostDBHostsActive copy() => new HostDBHostsActive(jsonFormat, this.Entries);

  
}
