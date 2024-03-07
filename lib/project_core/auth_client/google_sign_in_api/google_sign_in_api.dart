import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static GoogleSignInApi? _instance;
  late GoogleSignIn _googleSignIn;

  static const List<String> _scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  static Future<GoogleSignInApi> getInstance() async {
    _instance ??= await _init();
    return _instance!;
  }

  static Future<GoogleSignInApi> _init() async {
    GoogleSignInApi googleSignIn = GoogleSignInApi._();
    await googleSignIn._initialize();
    return googleSignIn;
  }

  GoogleSignInApi._();

  Future<void> _initialize() async {
    _googleSignIn = GoogleSignIn(
      scopes: _scopes,
    );
  }

  factory GoogleSignInApi() => _instance!;

  GoogleSignIn get googleClient => _googleSignIn;

  dispose() {
    _googleSignIn.disconnect();
  }
}
