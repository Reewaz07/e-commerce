import 'dart:async';

import 'package:ecommerce_app/auth/model/user_model.dart';
import 'package:ecommerce_app/auth/riverpod/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends AsyncNotifier<UserModel?> {
  FirebaseAuth get _firebaseAuth => ref.read(firebaseAuthProvider);
  @override
  FutureOr<UserModel?> build() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      return UserModel(id: currentUser.uid, email: currentUser.email);
    } else {
      return null;
    }
  }

  void login(String email, String password) async {
    final Regiestereduser = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  void register(String email, String password) async {
    final NewUser = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
