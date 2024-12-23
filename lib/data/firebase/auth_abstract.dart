abstract class Auth<T> {
  T? authService;
  Future<void> signInWithEmailAndPassword({String email, String password});
  Future<void> signUpWithEmailAndPassword({
    String? email,
    String? password,
    String? phone,
    String? name,
  });
  Future<void> signOut();
}
