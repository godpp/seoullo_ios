# # 1km, 서울로 7017

'서울로 7017'에 대한 모든 관광 정보를 직관적으로 보여주고, 인증샷으로 서울로에 대한 커뮤니티를 구현한 애플리케이션


Blog : <https://godpp.github.io/2018/01/20/Seoullo-IOS-App/>

## # 개요

'서울시 앱 공모전' 출품작


많은 정보를 얻기 위해서 직접 검색을 하여 홈페이지에 들어가야 하는 번거로움을 없애고자 개발한 애플리케이션

## # 주요기능

* 로그인 & 회원가입
	- 유저이름, 이메일, 패스워드만 이용하여 누구나 간단히 회원가입 할 수 있도록 했습니다.

	```bash
	// 키보드가 올라왔을 때 입력창이 가리지 않도록 CenterConstraintY를 Outlet으로 생성해 임의로 중심을 조정해 주었습니다.
	func keyboardWillShow(notification: NSNotification) {
    	if check {
        	if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? 	NSValue)?.cgRectValue {
            	backCenterConstrainY.constant = -130
            	centerConstraintY.constant = 0
            	check = false
            	view.layoutIfNeeded()
    	    }
    	}
	}
	func keyboardWillHide(notification: NSNotification) {
    	if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        	centerConstraintY.constant = 130
        	backCenterConstrainY.constant = 0
        	check = true
        	view.layoutIfNeeded()
    	}
	}
	```

* 메인화면

	- 하단엔 '서울로 정보', '홈', '#서울로' 3가지 탭바로 구성되어 있습니다.
	- '시설', '조경', '주요지점' 지도 위 관광지 위치에 버튼이 자리하고 있어, 직관적으로 관광지 정보를 확인할 수 있도록 구현했습니다.
	- 서울로 7017의 좋아요 순위를 나타내 많은 사람들이 찾아가는 관광지를 볼 수 있습니다.

	```
	// 홈 화면을 탭바 중앙에 위치시키기위해 tabBar.items의 배열 defaultIndex를 1로 지정
	IBInspectable var defaultIndex: Int = 1
	```