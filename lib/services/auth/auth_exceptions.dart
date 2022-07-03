//LOGIN Exceptions
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//REGISTER Exceptions
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

//GENERIC Exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
