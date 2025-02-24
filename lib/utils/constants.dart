class Constants {
  static const String dateFormat = 'dd/MM/yyyy';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';

  static const int maxRetryAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 1);
}