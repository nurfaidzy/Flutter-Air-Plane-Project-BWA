import "package:air_plane/models/user_model.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:air_plane/services/user_service.dart";

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = "",
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: name,
        hobby: hobby,
        balance: 280000000,
      );

      await UserService().setUser(user);
      return user;
    } catch (e) {
      throw e;
    }
  }
}
