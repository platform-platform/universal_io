import 'package:test/test.dart';
import 'package:universal_io/src/constants/operating_system_constants.dart';
import 'package:universal_io/src/driver/default_impl_browser.dart';

void main() {
  group('IODriverFactory', () {
    const iosAgent = 'iPhone; CPU iPhone OS 12_2 like Mac OS X';
    const windowsAgent = 'Windows NT 10.0; Win64; x64';
    const linuxAgent = 'X11; Linux x86_64';
    const androidAgent = 'Linux; Android 7.1.2; AFTMM Build/NS6265; wv';
    const macAgent = 'Macintosh; Intel Mac OS X 10_11_6';

    test('ios', () {
      final driver = driverFromUserAgent(iosAgent);
      final operatingSystem = driver.platformOverrides.operatingSystem;

      expect(operatingSystem, equals(OSConstants.iOS));
    }, testOn: 'chrome');

    test('windows', () {
      final driver = driverFromUserAgent(windowsAgent);
      final operatingSystem = driver.platformOverrides.operatingSystem;

      expect(operatingSystem, equals(OSConstants.windows));
    }, testOn: 'chrome');

    test('linux', () {
      final driver = driverFromUserAgent(linuxAgent);
      final operatingSystem = driver.platformOverrides.operatingSystem;

      expect(operatingSystem, equals(OSConstants.linux));
    }, testOn: 'chrome');

    test('android', () {
      final driver = driverFromUserAgent(androidAgent);
      final operatingSystem = driver.platformOverrides.operatingSystem;

      expect(operatingSystem, equals(OSConstants.android));
    }, testOn: 'chrome');

    test('mac', () {
      final driver = driverFromUserAgent(macAgent);
      final operatingSystem = driver.platformOverrides.operatingSystem;

      expect(operatingSystem, equals(OSConstants.macOS));
    }, testOn: 'chrome');
  });
}
