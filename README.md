# 본격 드립라이프를 위한 어플

나를 찾아 가는 여행에 낭만을 느낀 사람의 어플



## 개발자들을 위한 추가 설명

MVVM구조를 기반으로 화면간의 이동과 Dependencies Injection을 위해 Flow Coodinator를 도입한 구조

코드는 최대한 심플함을 유지하려고 노력중입니다.

개선점을 발견하시면 코멘트 부!탁! 드립니다! 적극 반영하겠습니다.



## Requirements

- Swift 4.0



## Package manager

[Carthage](https://github.com/Carthage/Carthage) 사용 설치방법은 링크 참고 (Homebrew 이용시 'brew install carthage'로 설치 가능)

**Homebrew:** You can use [Homebrew](http://brew.sh/) and install the `carthage` tool on your system simply by running `brew update` and `brew install carthage`. (note: if you previously installed the binary version of Carthage, you should delete `/Library/Frameworks/CarthageKit.framework`).'



Carthage 설치 후 터미널에서 아래 명령어 실행 (iOS용만 빌드)

```bash
$ carthage update --platform iOS
```

이후 프로젝트를 열면 실행 가능



