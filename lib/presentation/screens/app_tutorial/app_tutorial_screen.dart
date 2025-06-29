import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo{
  final String title;
  final String caction;
  final String imageUrl;

  SlideInfo({required this.title, required this.caction, required this.imageUrl});
}

final slides= <SlideInfo>[
  SlideInfo(title: 'Busca la comida', caction: 'Aqui va un texto para rellenar espacio', imageUrl: 'assets/Images/1.png'),
  SlideInfo(title: 'Entrega rapida', caction: 'Aqui va un texto para rellenar espacio', imageUrl: 'assets/Images/2.png'),
  SlideInfo(title: 'Disfruta de la comida', caction: 'Aqui va un texto para rellenar espacio', imageUrl: 'assets/Images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name= 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();

  bool endReach=false;
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if(!endReach && page >= (slides.length-1.5)){
        setState(() {
          endReach = true;
        });
      }
    },);
    
    
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData)=> _Slide(
              title: slideData.title, caption:slideData.caction, imageUrl:slideData.imageUrl)).toList(),
          ),
          Positioned(right: 20, top: 50,child: TextButton(onPressed: () => context.pop(), child: const Text('Salir'))),
          endReach ?
          Positioned(right: 20, bottom: 30,child: FadeInRight(from: 8, delay: const Duration(seconds: 1) ,child: FilledButton(onPressed: () => context.pop(), child: const Text('Empezar')))):const SizedBox(),

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide( {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title,style: titleStyle,),
            const SizedBox(height: 20),
            Text(caption,style: captionStyle,),

          ],
        ),
      ),
    );
  }
}