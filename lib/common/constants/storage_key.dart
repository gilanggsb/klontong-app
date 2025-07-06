enum StorageKeys {
  baseUrl('BASE_URL_KEY'),
  theme('THEME_KEY'),
  loginCredentials('LOGIN_CREDENTIALS'),
  user('USER_KEY');

  final String value;
  const StorageKeys(this.value);
}
