import 'package:flutter/material.dart';

class HomeScrfeen extends StatelessWidget {
  const HomeScrfeen({super.key});

  @override
  Widget build(BuildContext context) {
    double nextValue = 1.0;
    bool isRectangle = true;
    double position = 0.0;
    bool isToRight = true;

    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 100.0),
          duration: const Duration(seconds: 100),
          builder: (context, value, child) {
            print(value);

            if (value > nextValue) {
              ++nextValue;
              isRectangle = !isRectangle;
              isToRight = !isToRight;
            }

            position = isToRight
                ? (1 - (nextValue - value)) * 200
                : (nextValue - value) * 200;

            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: isRectangle ? Colors.black : Colors.grey.withOpacity(0.3),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape:
                            isRectangle ? BoxShape.rectangle : BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      left: position,
                      child: Container(
                        width: 10,
                        height: 200,
                        color: isRectangle ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
