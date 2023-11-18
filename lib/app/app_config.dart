class AppConfig {
  final String applicationName;

  static AppConfig _instance = AppConfig._internal('');

  factory AppConfig({
    required String applicationName,
  }) {
    _instance = AppConfig._internal(
      applicationName,
    );
    return _instance;
  }

  AppConfig._internal(
    this.applicationName,
  );

  static AppConfig get instance {
    return _instance;
  }

  // Environment Flavor Config
  static AppConfig dev() {
    return AppConfig(
      applicationName: 'GruChang Thai Gold Smith DEV',
    );
  }

  static AppConfig prod() {
    return AppConfig(
      applicationName: 'GruChang Thai Gold Smith',
    );
  }

  @override
  String toString() {
    return 'AppConfig{applicationName: $applicationName}';
  }
}
