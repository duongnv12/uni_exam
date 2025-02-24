class DataValidationUtils {
  static bool isValidEmail(String email) {
    // Regular expression đơn giản để kiểm tra email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email); // Sử dụng hasMatch() để kiểm tra sự trùng khớp
  }

  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }
}