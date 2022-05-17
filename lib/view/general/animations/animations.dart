import 'package:flutter/material.dart';
import 'package:flutter_basic_components/export/export.dart';
import 'package:flutter_basic_components/view_model/home/animation/animation_view_model.dart';
import 'package:provider/provider.dart';

class Animations extends StatefulWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animationColor;
  late Animation<double> _sizeAnimation;
  bool _isFav = false;

  @override
  void initState(){
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    );

    _animationColor = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_animationController);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 50
        ),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 50, end: 30),
            weight: 50
        ),
      ]
    ).animate(_animationController);

    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState(() {
          _isFav=true;
        });
      }
      if(status == AnimationStatus.dismissed){
        setState(() {
          _isFav=false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimationViewModel(),
      child: Builder(
        builder: (context){
          AnimationViewModel animationViewModel = Provider.of<AnimationViewModel>(context);
          return Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: animationViewModel.width,
              color: animationViewModel.color,
              margin: EdgeInsets.all(animationViewModel.margin),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: ()=>{animationViewModel.margin=30},
                      child: Text(AppLocalizations.of(context)!.changeMargin)
                  ),
                  ElevatedButton(
                      onPressed: ()=>{animationViewModel.color=Colors.yellowAccent},
                      child: Text(AppLocalizations.of(context)!.changeTheme)
                  ),
                  ElevatedButton(
                      onPressed: ()=>{animationViewModel.width=300},
                      child: Text(AppLocalizations.of(context)!.changeWidth)
                  ),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, _){
                      return IconButton(
                        onPressed: (){
                          _isFav ? _animationController.reverse() : _animationController.forward();
                        },
                        color: _animationColor.value,
                        icon: Icon(
                            Icons.favorite,
                          size: _sizeAnimation.value,
                        )
                      );
                    }
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

