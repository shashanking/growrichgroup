import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DepositSuccessCard extends StatelessWidget {
  final String depositId;

  const DepositSuccessCard({super.key, required this.depositId});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Device.screenType == ScreenType.mobile;
    return Stack(
      children: [
        Container(
          width:
              isMobile ? 100.w : 500, // 90% width on mobile, fixed on desktop
          height:
              isMobile ? 50.h : 300, // 90% height on mobile, fixed on desktop
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: Image.asset(
                'assets/images/grg.png',
                scale: 2,
              ).image, // Make sure to add grg.png in assets
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.1), // Faded look
                BlendMode.dstATop,
              ),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.yellow,
                blurRadius: 8.0,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 64, color: Colors.green),
              const SizedBox(height: 16),
              const Text(
                'Thank you for your deposit!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Deposit ID: $depositId',
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your deposit has been successfully recorded.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Note : Please request admin for verification',
                style: TextStyle(fontSize: 16, color: Colors.red[400]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () async {
                await context.maybePop();
                await context.maybePop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
