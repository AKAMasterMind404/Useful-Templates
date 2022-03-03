# Useful-Templates
A template folder for common widgets and useful scripts

Co-author: <a href="https://github.com/PratikJH153">PratikJH153</a>

1. REST API Dart Code: A ready to use repository containing code for calling GET, POST, DELETE and PATCH methods using the Dio package.

Working: 
a. database.dart: The file is where you specify the endpoint of your application. It contains variables for toggling between Debug mode and production as well as custom messages     made for various errors.
     
    unpackLocally: A function that takes in response body of a REST API call and returns a map containing two parameters: "success": 0/1 (0 for failure 1 for successful result)     and "unpacked": <response data>. In case of call failure "unpacked" will return a message corresponding to the type of error and the response data otherwise ie. in case of a     successful request.
  
  b. rest_apis.dart: The file containing the REQUEST function responsible for handling an asynchronous API call.
  
     Returns a Map containing local_result and local_status parameters.
     local_status: 200 If the server responds 500 in case of a Timeout
     
  c. apis.dart: A file containing all APIs you will be using throughout the project. These functions need to be custom made according to the project and yet follow a simple          pattern.
  
     Parameters: In case a request url consists of a parameter eg: endpoint/folder/innerfolder/$unique_variable, A single parameter can be used and passed along the request.
     
     Eg: 
     static Future<Map> getProductData(String id) async {
        if (kDebugMode) {
          print("CALLING getProductData(String id)");
        }
        String endpoint = "users/products/getProductData/$id";
        return GET(endpoint);
      }
    
      Similarly, String id can be replaced by Map? body for requests requiring a Request Body
    
    
