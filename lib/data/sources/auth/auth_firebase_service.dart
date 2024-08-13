import 'package:avis/data/models/auth/create_user_req.dart';
import 'package:avis/data/models/auth/signin_user_req.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserReq signinUserReq);

  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right('Signup was Successful');
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      FirebaseFirestore.instance
          .collection('Users')
          .add({'name': createUserReq.fullName, 'email': data.user?.email});

      return const Right('Login Successful !!');
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    }
  }
}
