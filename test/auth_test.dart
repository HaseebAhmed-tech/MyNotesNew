import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/auth_provider.dart';
import 'package:mynotes/services/auth/auth_user.dart';

void main() {
  group('Mock Authentication', () {
    final provider = MockAuthProvider();
    test('Should not be Initialized to begin with', () {
      expect(provider.isInilzialized, false);
    });
    test('Cannot Logout if Not Initialized', () {
      expect(
        provider.logout(),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
    test("Should be able to be Initialized", () async {
      await provider.initialize();
      expect(provider.isInilzialized, true);
    });
    test("User Should be Null After Initialization", () {
      expect(provider.currentUser, null);
    });
    test(
      "Should be Able To Initialize in Less Then 2 Sceonds",
      () async {
        await provider.initialize();
        expect(provider.isInilzialized, true);
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );
    test("Test User sgould Delegate to Login user", () async {
      final user = await provider.createUser(
        email: "foo",
        password: "bar",
      );
      expect(provider.currentUser, user);
      expect(user.isEmailVerified, false);
    });
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _isInitailized = false;
  bool get isInilzialized => _isInitailized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInilzialized) {
      throw NotInitializedException();
    }
    await Future.delayed(const Duration(seconds: 1));

    return logIn(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    _isInitailized = true;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) {
    if (!isInilzialized) {
      throw NotInitializedException();
    }
    const user = AuthUser(isEmailVerified: false);
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logout() async {
    if (!isInilzialized) {
      throw NotInitializedException();
    }
    if (_user == null) {
      UserNotFoundAuthException();
    }
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInilzialized) {
      throw NotInitializedException();
    }
    final user = _user;
    if (user == null) {
      throw UserNotFoundAuthException();
    }
    const newUser = AuthUser(isEmailVerified: true);
    _user = newUser;
  }
}
