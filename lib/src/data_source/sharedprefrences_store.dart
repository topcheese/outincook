import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SharedPreferencesStore implements IPersistStore {
  late SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    // Initialize the plugging
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
