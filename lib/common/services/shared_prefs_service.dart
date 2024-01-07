import 'package:shared_preferences/shared_preferences.dart';
import 'logger_service.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();
  SharedPreferences? _prefs;

  SharedPreferencesService._internal() {
    LoggerService().simple("SHARED PREFS SERVICE CREATED");
    init();
  }

  factory SharedPreferencesService() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    LoggerService().simple("SHARED PREFS SERVICE INITIALIZED");
  }

  Future setIsFirstTimeLaunchingApp(bool isFirstTime) async {
    await _prefs!.setBool('isFirstTime', isFirstTime);
  }

  Future setTermsReaded(bool hasTermsReaded) async {
    await _prefs!.setBool('termsReaded', hasTermsReaded);
  }

  bool getIsFirstTime() {
    bool? isFirstTime = _prefs!.getBool('isFirstTime');
    return isFirstTime ?? true;
  }

  bool getTermsReaded() {
    bool? isTermsReaded = _prefs!.getBool('termsReaded');
    return isTermsReaded ?? false;
  }

  Future clearPrefs() async {
    await _prefs!.clear();
  }
}
