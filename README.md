# sj_sdk_testing

A SDK to access XXX services such as login, sign-up, point exchange, ext..

## Setup

### Android

Go to `android/build.gradle` and add this line inside `repositories` block:

```kotlin
repositories {
    ...
    maven {
        url = uri("https://jitpack.io")
    }
}
```

and set kotlin version to `1.9.24` inside `buildScript` block:

```kotlin
ext.kotlin_version = '1.9.24'
```

Go to `android/app/build.gradle` and set `minSdkVersion` to 26

```kotlin
minSdkVersion 26
```

### IOS

Not implemented

## Using

Initialized `SjSdkTesting` while provide config:

```dart
final config = SjConfig(
  clientId: <provide-your-clientid>,
  language: Language.en,
  environment: Environment.stg,
);
await SjSdkTesting.init(config);
```

All available languages:
```dart
Language.vn
Language.en
```

All supported environments:
```dart
Environment.dev
Environment.stg
Environment.uat /// (default)
Environment.prod
```

Access all methods from `SjSdkTesting.instance` singleton:

```dart
await SjSdkTesting.instance.signIn();
await SjSdkTesting.instance.signUp();
```

Test commit
