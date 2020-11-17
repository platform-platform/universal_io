@TestOn('browser')
import 'package:test/test.dart';
import 'package:universal_io/src/constants/operating_system.dart';
import 'package:universal_io/src/driver/default_impl_browser.dart';

void main() {
  group('IODriver', () {
    const unknownAgent = 'unknownAgent';
    const iosAgent = 'iPhone; CPU iPhone OS 12_2 like Mac OS X';
    const windowsAgent = 'Windows NT 10.0; Win64; x64';
    const linuxAgent = 'X11; Linux x86_64';
    const androidAgent = 'Linux; Android 7.1.2; AFTMM Build/NS6265; wv';
    const macAgent = 'Macintosh; Intel Mac OS X 10_11_6';

    test(
      '.driverFromUserAgent() detects an operating system as iOS, if the user agent contains iOS info',
      () {
        final driver = driverFromUserAgent(iosAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OperatingSystem.iOS));
      },
    );

    test(
      '.driverFromUserAgent() detects an operating system as windows, if the user agent contains windows info',
      () {
        final driver = driverFromUserAgent(windowsAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OperatingSystem.windows));
      },
    );

    test(
      '.driverFromUserAgent() detects an operating system as linux, if the user agent contains linux info',
      () {
        final driver = driverFromUserAgent(linuxAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OperatingSystem.linux));
      },
    );

    test(
      '.driverFromUserAgent() detects an operating system as android, if the user agent contains android info',
      () {
        final driver = driverFromUserAgent(androidAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OperatingSystem.android));
      },
    );

    test(
      '.driverFromUserAgent() detects an operating system as macOS, if the user agent contains macOS info',
      () {
        final driver = driverFromUserAgent(macAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OperatingSystem.macOS));
      },
    );

    test(
      '.driverFromUserAgent() detects an operating system as linux, if the user agent contains unknown info',
      () {
        final driver = driverFromUserAgent(unknownAgent);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OperatingSystem.linux));
      },
    );

    test(
      '.driverFromUserAgent() detects an operating system as linux, if the user agent is null',
      () {
        final driver = driverFromUserAgent(null);
        final operatingSystem = driver.platformOverrides.operatingSystem;

        expect(operatingSystem, equals(OperatingSystem.linux));
      },
    );
  });
}
