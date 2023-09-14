# Guide of Quantit UI System For Flutter

```
    Quantit standard UI System for Flutter
```

## 설치관련

1. Flutter SDK 설치 : https://docs.flutter.dev/get-started/install
2. 환경변수 설정 : export PATH="$PATH: `Flutter설치경로`/bin"
3. 설치 관련 체크 : flutter doctor

- 해당 부분에서 모두 정상이 아닌 경우 (1)을 참고하여 설정을 마쳡니다.

## Build & Debug

1. 패키지를 받아줍니다.

```
Command (root경로)
flutter pub get
```

2. 만들어진 컴포넌트는 `./example/lib/main.dart` 파일 경로에서 테스트 가능합니다.

```
Command
flutter run
```

3. 만약 iOS 에서 `pod install` 관련 문제가 나온다면?

```
cd ios
pod install --repo-update 또는 pod install
```

## Unit Test (TDD)

https://docs.flutter.dev/testing/overview 참고해주세요.

```
현재 진행하고 있지 않습니다.
하지만 개인적으로 진행을 하고 싶으시다면

lib폴더가 아닌 test 폴더에서 진행을 해주시면 됩니다.
기본적인 유닛테스트나 UI테스트는 진행하실 수 있습니다.
```
