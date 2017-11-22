# 본격 드립라이프를 위한 어플

나를 찾아 가는 여행을 하기 위한 어플
사람과 사람을 모을 수 있는 기능을 하길 희망한다.



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

+ Swift 4.0.0 -> 4.0.2로 변경 됨에 따라서 Carthage에 빌드 된 파일을 인식할 수 없는 오류가 났을경우에는

```bash
$ carthage update --platform iOS --no-use-binaries
```

명령어로 재빌드 후 클린 - 실행하면 해결 됨


# MVVM + Coordinator with Storyboard Pattern

## 각 부분의 역할 정의
이 부분은 이 프로젝트가 추구하는 방향이다.
일반적으로 통용 되는 부분도 있고 개인적인 생각으로 제한하는 부분도 있다.


### Model

**Model이 기본적으로 가져가야 하는 일은 무엇이 있을까?**

데이터 구조를 선언 하는것이 Model이 해야 할 일이다. Entity... 더 이상 무슨 설명이 필요할까?
이 프로젝트에서는 모델정의를 위해 Domain이라는 타겟을 생성하여 관리 하고 있다.
Mapping의 경우 처리해야 하는 위치가 애메한데... 보통 다른 파트에서 담당하지만 편의를 위해서
모델에서 Mapping을 ObjectMapper를 통해 처리하고 있다. 이부분은 변경 여지가 많다.

**Model이 하지 말아야 할 것이 무엇이 있을까?**

구조 선언 이외의 것들은 하지 말아야 한다. 대표적으로 데이터 처리를 하려고 해서는 안된다. 

가끔 데이터 변형 또는 치장을 하는 경우가 있는데 이 부분은 다른 파츠에서 하는것이 관점 분리적인 측면에서 알맞다.

(치장이라 함은 형변환이나 문자열 데이터에 ,를 넣거나 숫자를 통화로 변경하는등등... )

### ViewModel

**ViewModel이 기본적으로 가져가야 하는 일은 무엇이 있을까?**



**ViewModel이 하지 말아야 할 것이 무엇이 있을까?**

ViewModel은 UI에 관한것을 가지고 있으면 안된다.
ViewModel은 다음 네비게이션에 대해서도 알지 못해야 한다. 
이를 구조적으로 막기 위해서 UIKit을 import 하지 않는다. (다른 개발자가 추천할 때 에러가 나도록..)
하지만 언제나 예외적인 상황은 발생 할 수 있다. 
예를 들면 편의성이나 비지니스적인 요청에 의해서 ViewModel에서 image를 반환해야 하는 경우가 생긴다면
제한 적으로 import UIKit.UIImage를 사용하기를 추천한다. 이는 다른 특수한 상황에서 의도치 않게 UIKit을 사용하는것을 막아준다. 

추가적으로 ViewModel을 구현 시 lifecycle을 항상 명심하시기 바란다.
예를 들면 비지니스 로직을 처리 하기 위해 RxSwift를 사용하는 경우 ViewModel에서는 DisposeBag을 사용하지 않도록 구현해야 한다.
예외사항이 있다면 ViewModel의 라이프 사이클에 바인딩을 걸어 뷰 모델에 따라 바뀌어야 할 로직...? 정도... 
다른 경우가 생각나면 지속적으로 추가 할 예정

### ViewController

**ViewController가 기본적으로 가져가야 하는 일은 무엇이 있을까?**

UI적인 요소와 View에 대한 초기 설정은 ViewController가 해야할 기본적인 일이다. 
여기에서 초기 설정이라 하면 UI적인 설정 부분도 있지만 Observable을 선언하고 이를 통해 ViewModel과 UI를 Binding하는 행위가 포함된다. 
이 핵심적인 부분을 벗어난 것은 extension을 활용하여 하는것이 좋다. 
extension에는 저장가능한 속성이 없으므로 class func을 통해 기.본.적.인 부분만 확장하도록 한다.
ViewController는 항상 BindableType(Protocol)을 준수하여 Observable 프로퍼티를 가지고 UI를 바인딩 해야 한다.



**ViewController가 하지 말아야 할 것이 무엇이 있을까?**

1. 네트워크를 직접 호출하는 행위 - 이런 행위는 View와 관련된게 아니기 때문에 다른쪽으로 넘겨야 한다.
2. 데이터 처리 - 가끔보면 ViewModel을 View의 하위 클래스처럼 쓰는 경우가 있긴 하더라... ViewModel에서 데이터를 가져와서 직접 처리하는 할 필요가 있을까? 이런 일은 ViewModel에게 넘겨야 한다.
3. Helper 구현 - UI에 관한 핼퍼나 데이터 변경 처리 등등.. 다양한 기능을 VC에서 하는 경우가 있는데 이 또한 따로 라이브러리를 만들어 쓰거나 UI에 한정하여 (저장 속성을 사용하지 않는..Property등.. ) extension으로 구현하는것을 추천한다





### Coordinator

구현중에 프로젝트가 파괴되어서 멘붕.. 글 써둔것도 날라가서...이하 생략
스토리보드의 기능과 유사성이 많아서 스토리 보드로 대체 하기로 함
내용이 정리가 안된 상태로 임시로 올림. 나중에 정리 예정.

-----------------------------------------
코디네이터: 스스로는 아무것도 연결 하지 않고 서로 알지 못하는 다른 두 부분을 결합하여 응용프로그램에 유동성을 주는 부분
 코디네이터는 왜 나와야 했을까?

몇가지 가정을 해보자. 

1. ViewController가 ViewModel의 로직이나 Binding 요소를 알고 있다면?
2. ViewModel이 ViewController가 어디로 가는지 알고 있다면? 
3. 둘다 서로를 알고 있다면? 

.

.



-----------------------------------------
Coordinator가 하는 일

1.  Scene(화면)을 밖으로 내보내다
2. VM과 VC의 쌍으로 구성 요소를 가진다
3. 바인딩 프로토콜을 통해 연결 된다
4. 화면 전환을 할 때는 라우팅 프로토콜을 준수한다
5. 라우팅을 할 때는 Observable할 수 있어야 한다

코디네이터는 ViewModel에게 Injection을 할 때 레퍼런스 참조 형태로 해야 한다.

-----------------------------------------
Coordinator 생성중에 예외적인 상황이 생길 수 있다.

바로 App의 시작지점이다. 

AppCoordinator는 window설정 및 기타 등등등 해야 한다.
-----------------------------------------

## MVVM의 연결 관계

그림으로 표현 하면 좋으나.. 시간도 없고 발그림인 관계로 말로 설명한다.



Model: 첫 글짜인 M입니다. 데이터 구조를 정의하고 있으며 ViewModel을 통해 활용 됩니다.

어떤 아키텍처에서도 비슷한 형태를 가지고 있으며 정의가 다르지 않습니다.



ViewController/Views: 두번째 V입니다. 이벤트를 받아 들이거나 화면에 정보를 뿌려주는 부분입니다.

사용자와 ViewModel사이에 위치하며 앱을 핸들링 하는 역할을 합니다.



ViewModel: VM에 해당합니다. 아키텍처에서 가장 중요한 부분으로 데이터를 가져와 가공하거나 비지니스 로직을 처리합니다.








