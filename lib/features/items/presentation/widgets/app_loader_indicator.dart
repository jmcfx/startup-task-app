import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoaderIndicator extends StatelessWidget {
  const AppLoaderIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.blueAccent.withAlpha(0),
                    strokeWidth: 6,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.blueAccent,
                    ),
                  ),
                ),
                Icon(
                  Icons.grid_view_rounded,
                  size: 28.sp,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.sp),

          const Text(
            "Loading your items...",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Please wait a moment while we fetch your board.",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          Container(
            width: 120,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
