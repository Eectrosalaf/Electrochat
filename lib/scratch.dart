void main(){

 //Humanbeing().talk();
 Man().talk();

 Women().talk();
}
class Humanbeing{

 void talk(){
    print('i am human being');
  }
}
class Man extends Humanbeing{
  @override
  void talk(){

    super.talk();
    print('i am a man');
  }

}
class Women extends Humanbeing{
  @override
   void talk(){
    super.talk();
    print('i am a woman');
    Amaphhrodite().woman();
  }
}
mixin Canbeaman     {

  void man(){
    print('can be a man');
  }
}
mixin Canbeawoman{

  void woman(){
    print('can be a woman');
  }
}
class Amaphhrodite  with Canbeaman,Canbeawoman{}

// AnimatedTextKit(
//   animatedTexts: [
//     TypewriterAnimatedText(
//       'Hello world!',
//       textStyle: const TextStyle(
//         fontSize: 32.0,
//         fontWeight: FontWeight.bold,
//       ),
//       speed: const Duration(milliseconds: 2000),
//     ),
//   ],
//
//   totalRepeatCount: 4,
//   pause: const Duration(milliseconds: 1000),
//   displayFullTextOnTap: true,
//   stopPauseOnTap: true,
// )

// animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
//
// controller.forward();
// animation.addStatusListener((status) {
//   if (status == AnimationStatus.completed) {
//     controller.reverse(from: 1);
//   } else if (status == animation.isDismissed) {
//     controller.forward();
//   }
// });
// print(status);
// });