errorHandler(String error) {
  switch (error) {
    case 'weak-password':
      return 'The password provided is too weak.';
    case 'email-already-in-use':
      return 'The email address is already in use by another account.';
    case 'invalid-email':
      return 'The email address is badly formatted.';

    default:
      return 'Unknown error, please contact support.';
  }
}
