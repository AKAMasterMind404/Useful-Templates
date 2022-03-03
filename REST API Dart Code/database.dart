const SERVER_ERROR_CODE = 500;
const SUCCESS_CODE = 200;

// 200 401 404 500
// SUCCESS: 200
// BAD REQUEST: 401
// NOT FOUND: 404
// INTERNAL SEVER ERROR: 500
const endpoint = "https://enthem.herokuapp.com/";

/// FOR REAL DEVICE
// const endpoint = "http://10.0.2.2:9000/";

const bool kDebugMode = true;

const ErrorCodesCustom = {
  100: "Couldn't connect to the server!",
  999: "Miscellaneous error!"
};

final miscellaneousErrorMessage = {
  "flutter-caught-error": "Miscellaneous Exception",
  "message": ErrorCodesCustom[999],
  "errCode": 999 // Server connection error
};

final socketErrorMessage = {
  "flutter-caught-error": "Socket Exception",
  "message": ErrorCodesCustom[100],
  "errCode": 100 // Server connection error
};

Map unPackLocally(Map data, {bool toPrint = true}) {
  // "UNPACKS" OR RETURNS THE RESULT OF A REQUEST FROM A SERVER
  // SAMPLE OUTPUTS:
  /*
  {"success":0, "unpacked":{"message":"Upvote Failed"}, "status": 500}
  {"success":0, "unpacked":{"message":"SERVER ERROR", "status": 404}}
  {"success":1, "unpacked":{"message":"Upvote Successful", "status": 200}}
  */
  int status = 500;
  int success = 0;
  dynamic dataReceived;

  bool normalDataReceived = data["local_status"] == 200;
  bool dioErrorReceived = data["local_status"] == 404;

  Map localData = data["local_result"];

  if (normalDataReceived) {
    bool dataReceivedSuccessfully = localData["status"] == 200;

    if (dataReceivedSuccessfully) {
      var requestedSuccessData = localData["data"];

      if (toPrint) {
        print("Server responded! Status:${localData["status"]}");
        print("SUCCESS DATA:");
        print(requestedSuccessData);
        print("-----------------\n\n");
      }

      success = 1;
      status = 200;
      dataReceived = requestedSuccessData;
    }
  } else if (dioErrorReceived) {
    status = 404;
    success = 0;
    dataReceived = localData;
    if (toPrint) {
      print("Server Responded! Dio Error Received:");
      print(localData);
      print("-----------------\n\n");
    }
  } else {
    status = 500;
    success = 0;
    dataReceived = "Couldn't reach the servers!";
    if (toPrint) {
      print(localData);
      print("Server Down! Status:$localData");
      print("-----------------\n\n");
    }
  }
  return {"success": success, "unpacked": dataReceived, "status": status};
}
