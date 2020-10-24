import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  // if there is an auth token and it isnt expired user is authenticated
  bool get isAuth {
    return token != null;
  }

  //return the token if user has token and it isnt expired
  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlText) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlText?key=AIzaSyCiyGa1ouC8aUch85YX6DRizWJOEvi_jkA';

    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    final responseData = json.decode(response.body);
    //setting token and other fields from response. Documentation:
    // https://firebase.google.com/docs/reference/rest/auth#section-create-email-password
    _token = responseData['idToken'];
    _userId = responseData['localId'];
    // convert expiration string of seconds and add to current time
    _expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ),
    );
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
