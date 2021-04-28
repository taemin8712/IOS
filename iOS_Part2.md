 # iOS 기본사항 

 > SwiftUI 기본적으로 부모/자식 형태로 계층구조를 형성한다.

 * VStack
 * HStack
 * ZStack
 
 </br>

 ## 수정자 ( ViewModifier )

  > 자신만의 커스텀 ViewModifier 생성 가능
  </br>
  struct HanTitle : ViewModifier {
   func body(content : Content) -> some View {
   		content
   			.font(.largeTitle)
   			.background(Color.white)
   			.boder(Color.gray, width : 0.2)
	 }
	}

	-> Text("CustomViewModifier").modifier(HanTitle())


	## Custom VIew 
	> 컨테이너 뷰의 content(=static 정적) == 뷰를 동적으로 지정할수 없고 최조 선언할떄 지정할 수 있다는 애기
	>> 이를 보완하기 위해서 ViewBuilder클로저를 이용하여 동적으로 설정할수 있도록 한다
<table>
	<th>
	 struct MyVstack : View {
	 var body : some View {
	 	Vstack( spacing : 10 ){
	 	 Text("Test1 ")
	 	 Text("Test2 ")
	 		}
		}
	}
	</th>
	<th>
		struct MyVStack<Content: view>: View {
			let content: () -> Content 
			init(@ViewBuilder content: @escaping () -> Content){
			self.content = content
		}
		var doby: some View {
		VStack( Spacing : 10) {
		content()
			}
			.font(.largeTitle)
		}
	}
	<br>
	MyVStack {
	Text("Test1 ")
	Text("Test2 ")
	HStack {
		Image(systemName : "star.fill")
		Image(systemName : "star.fill")
		Image(systemName : "star.fill")
}
}
	</th>
</table>
**View를 커스텀하게되면 위와같이 선언부에서 하위 뷰에 들어갈 것들을 선언해야하지만 ViewBuilder를 이용하게 되면 처럼 동적으로 선언이 가능하다 **


