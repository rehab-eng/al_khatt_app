class AppEndpoints {
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.example.com',
  );

  static const apiV1 = '/api/v1';

  static const authToken = '$apiV1/auth/token';
  static const authTokenRefresh = '$apiV1/auth/token/refresh';
  static const authOtpRequest = '$apiV1/auth/otp/request';
  static const authOtpVerify = '$apiV1/auth/otp/verify';
  static const authProfile = '$apiV1/auth/me';
  static const deviceToken = '$apiV1/auth/device-token';

  static const contractorLicenseUpload = '$apiV1/profile/contractor/license';
  static const agentLicenseUpload = '$apiV1/profile/agent/license';
  static const driverLicenseUpload = '$apiV1/profile/driver/license';
  static const driverPhotoUpload = '$apiV1/profile/driver/photo';

  static const orders = '$apiV1/orders';
  static const messages = '$apiV1/messages';
  static const messageThreads = '$apiV1/messages/threads';

  static const walletSummary = '$apiV1/wallet/summary';
  static const walletWithdrawals = '$apiV1/wallet/withdrawals';
}
