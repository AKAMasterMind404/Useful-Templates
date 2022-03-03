import 'database.dart';
import 'rest_apis.dart';

class UserAPIS {
  static Future<Map> getUsers() async {
    if (kDebugMode) {
      print("CALLING getUsers()");
    }
    String endpoint = "users/getAllUsers/";
    return GET(endpoint);
  }

  static Future<Map> getSingleUserData(String id) async {
    // GETS USER DATA AND FILLS UserProvider
    if (kDebugMode) {
      print("CALLING getSingleUserData(String id)");
    }
    String endpoint = "users/getUserInfoAdmin/$id";
    return GET(endpoint);
  }

  static Future<Map> getRecommendations(String id) async {
    if (kDebugMode) {
      print("CALLING getRecommendations(String id)");
    }
    String endpoint = "users/getRecommendations/$id";
    return GET(endpoint);
  }

  static Future<Map> addUser(Map body) async {
    if (kDebugMode) {
      print("CALLING addUser(Map body)");
    }
    String endpoint = "users/addUser/";
    return POST(endpoint, body);
  }
  static Future<Map> addInterest(Map body) async {
    if (kDebugMode) {
      print("CALLING addInterest(Map body)");
    }
    String endpoint = "users/addInterest/";
    return POST(endpoint, body);
  }

  static Future<Map> deleteUser(String id) async {
    if (kDebugMode) {
      print("CALLING deleteUser(String id)");
    }
    String endpoint = "users/deleteSingleUser/$id";
    return DELETE(endpoint);
  }

  static Future<Map> patchUser(String id, Map body) async {
    if (kDebugMode) {
      print("CALLING patchUser(String id, Map body)");
    }
    String endpoint = "users/updateUserInfo/$id";
    return PATCH(endpoint, body);
  }

  static Future<Map> getCheckUserExists(String id) async {
    if (kDebugMode) {
      print("CALLING getCheckUserExists(String id)");
    }
    String endpoint = "users/checkUserExists/$id";
    return GET(endpoint);
  }

  static Future<Map> getCheckUsernameExists(String username) async {
    if (kDebugMode) {
      print("CALLING getCheckUsernameExists(String id)");
    }
    String endpoint = "users/checkUsername/$username";
    return GET(endpoint);
  }
}

class PostAPIS {
  static Future<Map> getPosts(Map body) async {
    if (kDebugMode) {
      print("CALLING getPosts(Map body)");
    }
    String endpoint = "posts/getAllPosts/";
    return POST(endpoint, body);
  }

  static Future<Map> getUserPosts(String userID) async {
    if (kDebugMode) {
      print("CALLING getUserPosts(String)");
    }
    String endpoint = "users/getUserPosts/$userID";
    return GET(endpoint);
  }

  static Future<Map> getRelatedPosts(Map body) async {
    if (kDebugMode) {
      print("CALLING getRelatedPosts(String tag)");
    }
    String endpoint = "posts/getRelatedPosts/";
    return POST(endpoint, body);
  }

  static Future<Map> getTrendingPosts() async {
    if (kDebugMode) {
      print("CALLING getTrendingPosts()");
    }
    String endpoint = "posts/getTrendingPosts/";
    return GET(endpoint);
  }

  static Future<Map> addPost(Map body) async {
    if (kDebugMode) {
      print("CALLING addPost(Map body)");
    }
    String endpoint = "posts/addPost/";
    return POST(endpoint, body);
  }

  static Future<Map> addComment(String pID, Map body) async {
    if (kDebugMode) {
      print("CALLING addComment(String pID, Map body)");
    }
    String endpoint = "posts/addComment/$pID";
    return POST(endpoint, body);
  }

  static Future<Map> deleteComment(Map body) async {
    if (kDebugMode) {
      print("CALLING deleteComment(Map body)");
    }
    String endpoint = "posts/deleteComment";
    return POST(endpoint, body);
  }

  static Future<Map> getComments(String id) async {
    if (kDebugMode) {
      print("CALLING getComments(String id)");
    }
    String endpoint = "posts/getComments/$id";
    return GET(endpoint);
  }

  static Future<Map> deletePost(String id) async {
    if (kDebugMode) {
      print("CALLING deletePost(String id)");
    }
    String endpoint = "posts/deletePost/$id";
    return DELETE(endpoint);
  }

  static Future<Map> searchPost(Map body) async {
    if (kDebugMode) {
      print("CALLING searchPost(Map body)");
    }
    String endpoint = "posts/search/";
    return POST(endpoint, body);
  }

  static Future<Map> upVote(Map body) async {
    if (kDebugMode) {
      print("CALLING upVote(Map body)");
    }
    String endpoint = "posts/upvote/";
    return POST(endpoint, body);
  }

  static Future<Map> downVote(Map body) async {
    if (kDebugMode) {
      print("CALLING downVote(Map body)");
    }
    String endpoint = "posts/downvote/";
    return POST(endpoint, body);
  }

  static Future<Map> cancelUpVote(Map body) async {
    if (kDebugMode) {
      print("CALLING cancelUpVote(Map body)");
    }
    String endpoint = "posts/cancelupvote/";
    return POST(endpoint, body);
  }

  static Future<Map> cancelDownVote(Map body) async {
    if (kDebugMode) {
      print("CALLING cancelDownVote(Map body)");
    }
    String endpoint = "posts/canceldownvote/";
    return POST(endpoint, body);
  }
}
