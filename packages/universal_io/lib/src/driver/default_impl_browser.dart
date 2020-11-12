// Copyright 2020 terrier989@gmail.com.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library universal_io.browser_driver;

import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:universal_io/driver.dart';
import 'package:universal_io/driver_base.dart';
import 'package:universal_io/prefer_universal/io.dart';
import 'package:universal_io/src/constants/operating_system_constants.dart';

part 'browser/http_client.dart';

part 'browser/http_client_exception.dart';

part 'browser/http_client_request.dart';

part 'browser/http_client_response.dart';

/// Determines the default [IODriver] _BrowserIODriver_ in browser.
final IODriver defaultIODriver = driverFromUserAgent(
  html.window.navigator.userAgent,
);

/// Creates [IODriver] based on [userAgent].
IODriver driverFromUserAgent(String userAgent) {
  return IODriver(
    parent: null,
    httpOverrides: _BrowserHttpOverrides(),
    platformOverrides: _platformOverridesFromEnvironment(userAgent),
    networkInterfaceOverrides: NetworkInterfaceOverrides(),
  );
}

String _operatingSystemFromUserAgent(String userAgent) {
  if (userAgent.contains('iPhone')) {
    return OSConstants.iOS;
  }

  if (userAgent.contains('Mac OS X')) {
    return OSConstants.macOS;
  }

  if (userAgent.contains('Android')) {
    return OSConstants.android;
  }

  if (userAgent.contains('Windows')) {
    return OSConstants.windows;
  }

  return OSConstants.linux;
}

PlatformOverrides _platformOverridesFromEnvironment(String userAgent) {
  final languages = html.window.navigator.languages;
  final locale = languages.isNotEmpty ? languages.first : 'en';
  final operatingSystem = _operatingSystemFromUserAgent(userAgent);

  return PlatformOverrides(
    numberOfProcessors: html.window.navigator.hardwareConcurrency ?? 1,
    localeName: locale,
    operatingSystem: operatingSystem,
  );
}

class _BrowserHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return _BrowserHttpClient();
  }
}
