class DeviceSystemInfo {
  final String? osVersion;
  final String? deviceModel;
  final String? devicePlatform;
  final String? appVersion;
  final String? appName;

  const DeviceSystemInfo({
    this.osVersion,
    this.deviceModel,
    this.appVersion,
    this.appName,
    this.devicePlatform,
  });

  DeviceSystemInfo copyWith({
    String? osVersion,
    String? deviceModel,
    String? appVersion,
    String? appName,
    String? devicePlatform,
  }) {
    return DeviceSystemInfo(
      osVersion: osVersion ?? this.osVersion,
      deviceModel: deviceModel ?? this.deviceModel,
      appVersion: appVersion ?? this.appVersion,
      appName: appName ?? this.appName,
      devicePlatform: devicePlatform ?? this.devicePlatform,
    );
  }
}
