# Get X

## RxInt 란?
Get X에서 제공하는 반응형 상태 관리 객체로 
### .obs를 통해 초기화됩니다.
#### ex) RxInt counter = 0.obs;

counter.value++;를 통해 직접적으로 값의 변화를 줍니다.
이를 별도의 setState 호출 없이도 RxInt의 변화가 자동으로 UI에 반영됩니다.

## Obx
원래는 단순히 위젯만 사용했지만, 이제는 변화가 필요한 위젯을 Obx 함수로 감싸서 사용합니다.
Obx는 Get X에서 제공하는 반응형 프로그래밍을 위한 위젯으로, 내부의 Rx 타입 변수가 변공될  때 마다 자동으로 해당 위젯을 다시 빌드하도록 만듭니다.
#### ex) child : Obx(()=> Text("카운터 : $counter")),

## GetController
또한, RxInt로 선언한 counter 변수는 반드시 _MyCounterState(선언한 class) 내부에서만 존재해야 하는 변수가 아닙니다.

GetxController를 상속 받는 별도의 클래스에 선언하여 사용할 수 있으며, 이는 상태 관리의 유연성을 대폭 향상시킵니다.
#### ex)
import 'package:get/get.dart';
class CounterController extends GetxControleer{
    var counter=0.obs;

    void increment(){
        counter++;
    }
}

여기서 counter 변수는 .obs를 사용해 반응형 변수로 선언되었습니다. increment 메서드는 counter의 값을 증가시키며, 이 메서드는 UI에서 직접 호출될 수 있습니다.

## 라우트 관리
플러터에서 기본저긍로 제공하는 Navigator와 NavigationRoute를 사용하여 페이지 간의 이동을 구현하는 코드 대신에 Get X 라이브러리를 사용하면 Navigation, Snackbar, Dialogs, BottomSheets 등을 간단하고 직관적인 방법으로 호출할 수 있으며, 라우트 관리에 있어서 큰 이점을 제공합니다.

기존의 NavigationRoute는 코드가 길어지고 복잡해지며 유지 보수를 어렵게 한다.

#### ex) Get X를 이용한 route
Get.to(() => NewPage());

이는 코드를 휠씬 간결하게 줄여주며 코드의 가독성을 크게 향상시킵니다.
또한 Get X는 이름을 기반으로 한 라우트 관리, 매개변수 전달, 동적 URL 등 고급 라우팅 기능도 지원합니다.

Navigator.of(context).pop() => Get.back()
Navigator.of(context).pushReplacement() => Get.off()
Navigator.of(context).pushReplacementNamed() => Get.offNamed()
Navigator.of(context).pushAndRemoveUntil() => Get.offAll()
Navigator.of(context).pushNamedAndRemoveUntil() => Get.offAllNamed()

## 의존성

간결성과 유연성 : Get X를 사용하면 외존성을 관리하는 코드가 간결 해지며 다양한 방식으로 외존성을 주입하고 관리할 수 있는 유연성을 제공합니다.

자동 메모리 관리 : Get X는 사용하지 않는 컨트롤러와 바인딩을 자동으로 메모리에서 제거하는 스마트 관리 기능을 제공하여, 메모리 누수를 방지하고 애플리케이션 성능을 최적화합니다.

간편화 테스트 : 의존성을 명확히 관리함으로써 테스트 코드 작성이 용이해지고, 의존성 주입을 통해 모의 객체를 쉽게 사용할 수 있어 테스트 과정을 간소화 할 수 있습니다.

Get.put() : 의존성을 즉시 초기화하고 애플리케이션 전체에서 접근할 수 있게 합니다. 이 방법은 주로 애플리케이션이 시작할 때 필요한 핵심 의존성을 등록할 때 사용합니다.

Get.lazyPut() : 의존성을 처음 사용할 때 초기화하는 지연 로딩 방식을 사용합니다. 이는 리소스를 효율적으로 사용하고 시작 시간을 단축하는 데 도움이 됩니다.

Get.find : 이미 등록된 의존성을 검색하여 반환합니다. 이 방법은 컨트롤러나 다른 서비스 등을 다른 곳에서 필요로 할 때 사용됩니다.

Bindings : 특정 페이지나 라우트에 의존성을 자동으로 연결하는 방법으로, 페이지가 로드될 때 필요한 외존성을 자동으로 설정하고 페이지가 사라질 때 해당 의존성을 메모리에서 제거하는 등의 관리를 자동화합니다.

