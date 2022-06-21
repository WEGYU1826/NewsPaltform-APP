import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

import 'user.dart';

// "email": "dagi@dagi.com",
// "password": "123123123"
// 'https://zena-api-dev.herokuapp.com/api/v1/customers/login'
// 'https://zena-api-dev.herokuapp.com/api/v1/customers/login'

class AuthModel extends Model {
  bool _loadingUser = false;
  bool _isAuthenticated = false;

  final url = 'https://zena-api-dev.herokuapp.com/api/v1/customers/';

  bool get loadingUser {
    return _loadingUser;
  }

  setUser(User user) {
    final usersBox = Hive.box('user');
    usersBox.put('loggedInUser', user);
  }

  User? currentUser() {
    final userBox = Hive.box('user');
    return userBox.get('loggedInUser');
  }

  setAuthentication(bool value) {
    final authentication = Hive.box('auth');
    authentication.put('isUserLoggedIn', value);
  }

  isAuthenticated() {
    final authentication = Hive.box('auth');
    return authentication.get('isUserLoggedIn') ?? false;
  }

  Future<void> registerWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    _loadingUser = true;
    notifyListeners();

    try {
      http.Response response =
          await http.post(Uri.parse('$url/register'), body: {
        'firstName': firstName,
        'lastName': lastName,
        'username': email,
        'password': password
      });

      final Map<String, dynamic> authResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        User user = User(
          id: authResponse['doc']['id'],
          email: email,
          firstName: authResponse['doc']['firstName'],
          lastName: authResponse['doc']['lastName'],
          token: authResponse['token'],
        );
        setUser(user);

        setAuthentication(true);
      }
      _loadingUser = false;
      notifyListeners();
    } catch (error) {
      print(error);
      _loadingUser = false;
      notifyListeners();
    }
  }

  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    _loadingUser = true;
    notifyListeners();

    try {
      http.Response response = await http.post(Uri.parse('$url/login'),
          body: {'username': email, 'password': password});

      final Map<String, dynamic> authResponse = json.decode(response.body);
      if (response.statusCode == 200 && authResponse['status'] == 'success') {
        User user = User(
          id: authResponse['doc']['id'],
          email: email,
          firstName: authResponse['doc']['firstName'],
          lastName: authResponse['doc']['lastName'],
          token: authResponse['token'],
        );
        setUser(user);

        setAuthentication(true);
      }
      _loadingUser = false;
      notifyListeners();
    } catch (error) {
      print(error);
      _loadingUser = false;
      notifyListeners();
    }
  }

  Future<void> logOut() async {
    http.Response response = await http.get(Uri.parse('$url/logout'));
    if (response.statusCode == 200) {
      final user = Hive.box('user');
      user.delete('loggedInUser');
      setAuthentication(false);
    }
  }
}
