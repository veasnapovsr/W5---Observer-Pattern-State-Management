///abstract to Define a method but not to Implement
abstract class RidePreferencesListener {
  void onPreferenceSelected(String selectedPreference);
}
///to manage List of RidePreferences Objects
class RidePreferencesService {
  final List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void removeListener(RidePreferencesListener listener) {
    _listeners.remove(listener);
  }

  void notifyListeners(String selectedPreference) {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(selectedPreference);
    }
  }

  void changePreference(String newPreference) {
    print("Preference changed to: $newPreference");
    notifyListeners(newPreference);
  }
}

///to implement
class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(String selectedPreference) {
    print("Console Logger: Preference changed to $selectedPreference");
  }
}

void main() {
  RidePreferencesService service = RidePreferencesService();
  ConsoleLogger logger = ConsoleLogger();

  service.addListener(logger);
  service.changePreference("Eco Mode");
  service.changePreference("Sport Mode");
}
