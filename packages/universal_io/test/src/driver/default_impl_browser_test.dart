import 'package:test/test.dart';
import 'package:universal_io/src/constants/operating_system_constants.dart';
import 'package:universal_io/src/driver/default_impl_browser.dart';

void main() {
  group('IODriver', () {
    const iosAgent = 'iPhone; CPU iPhone OS 12_2 like Mac OS X';
    const windowsAgent = 'Windows NT 10.0; Win64; x64';
    const linuxAgent = 'X11; Linux x86_64';
    const androidAgent = 'Linux; Android 7.1.2; AFTMM Build/NS6265; wv';
    const macAgent = 'Macintosh; Intel Mac OS X 10_11_6';

    test(
      '.driverFromUserAgent() detects an iOS, if the user agent contains iOS info',
      () {
        final driver = driverFromUserAgent(iosAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OSConstants.iOS));
      },
      testOn: 'chrome',
    );

    test(
      '.driverFromUserAgent() detects a windows, if the user agent contains windows info',
      () {
        final driver = driverFromUserAgent(windowsAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OSConstants.windows));
      },
      testOn: 'chrome',
    );

    test(
      '.driverFromUserAgent() detects a linux, if the user agent contains linux info',
      () {
        final driver = driverFromUserAgent(linuxAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OSConstants.linux));
      },
      testOn: 'chrome',
    );

    test(
      '.driverFromUserAgent() detects an android, if the user agent contains android info',
      () {
        final driver = driverFromUserAgent(androidAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OSConstants.android));
      },
      testOn: 'chrome',
    );

    test(
      '.driverFromUserAgent() detects a macOS, if the user agent contains macOS info',
      () {
        final driver = driverFromUserAgent(macAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OSConstants.macOS));
      },
      testOn: 'chrome',
    );
  });
}
