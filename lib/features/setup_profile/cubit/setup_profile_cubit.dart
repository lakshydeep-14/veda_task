import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:veda_task/config/app_extensions.dart';
import 'package:veda_task/features/setup_profile/model/setup_profile_request_model.dart';

part 'setup_profile_state.dart';
part 'setup_profile_cubit.freezed.dart';

class SetupProfileCubit extends Cubit<SetupProfileState> {
  SetupProfileCubit() : super(const SetupProfileState.initial());

  SetupProfileReqModel setupProfileReqModel = SetupProfileReqModel();
  TextEditingController nameController = TextEditingController();
  int selectedPriority = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    emit(const Loading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return; // User cancelled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(Success(userCredential.user!));
      } else {
        emit(const Error("Sign-in failed"));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
