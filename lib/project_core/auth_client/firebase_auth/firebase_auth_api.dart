import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthApi {
  static FirebaseAuthApi? _instance;
  late FirebaseAuth _firebaseAuth;

  static Future<FirebaseAuthApi> getInstance() async {
    _instance ??= await _init();
    return _instance!;
  }

  static Future<FirebaseAuthApi> _init() async {
    FirebaseAuthApi firebaseAuth = FirebaseAuthApi._();
    await firebaseAuth._initialize();
    return firebaseAuth;
  }

  FirebaseAuthApi._();

  Future<void> _initialize() async {
    _firebaseAuth = FirebaseAuth.instance;
  }

  factory FirebaseAuthApi() => _instance!;

  FirebaseAuth get fbAuth => _firebaseAuth;
}
