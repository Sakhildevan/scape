// import 'package:flutter/material.dart';
// import 'package:scape/core/utils/styles/app_colors.dart';

// class AnimatedCheckmark extends StatefulWidget {
//   final bool isChecked;
//   final double size;
//   final Color color;
//   final Duration duration;

//   const AnimatedCheckmark({
//     Key? key,
//     this.isChecked = false,
//     this.size = 50,
//     this.color = const Color(0xFF3A913D),
//     this.duration = const Duration(milliseconds: 400),
//   }) : super(key: key);

//   @override
//   _AnimatedCheckmarkState createState() => _AnimatedCheckmarkState();
// }

// class _AnimatedCheckmarkState extends State<AnimatedCheckmark>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _checkAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: widget.duration,
//       vsync: this,
//     );

//     _checkAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );

//     if (widget.isChecked) {
//       _controller.forward();
//     }
//   }

//   @override
//   void didUpdateWidget(AnimatedCheckmark oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.isChecked != oldWidget.isChecked) {
//       widget.isChecked ? _controller.forward() : _controller.reverse();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return !widget.isChecked
//         ? Container(
//             height: 30,
//             width: 30,
//             margin: const EdgeInsets.only(left: 5, right: 15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(3),
//               border: Border.all(
//                   color: AppColors.grey.withValues(alpha: 110), width: 2),
//             ),
//           )
//         : CustomPaint(
//             painter: CheckmarkPainter(
//               animation: _checkAnimation,
//               color: widget.color,
//               size: widget.size,
//             ),
//             child: SizedBox(
//               width: widget.size,
//               height: widget.size,
//             ),
//           );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// class CheckmarkPainter extends CustomPainter {
//   final Animation<double> animation;
//   final Color color;
//   final double size;

//   CheckmarkPainter({
//     required this.animation,
//     required this.color,
//     required this.size,
//   }) : super(repaint: animation);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = size.width * 0.08
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = this.size / 2.2;

//     final checkProgress = animation.value;
//     final path = Path();
//     final startPoint = Offset(
//       center.dx - radius * 0.6,
//       center.dy + radius * 0.2,
//     );
//     final midPoint = Offset(
//       center.dx - radius * 0.18, // Slight adjustment to reduce the angle
//       center.dy + radius * 0.5, // Slight adjustment to reduce the angle
//     );
//     final endPoint = Offset(
//       center.dx + radius * 0.55, // Slight adjustment to reduce the angle
//       center.dy - radius * 0.35, // Slight adjustment to reduce the angle
//     );

//     if (checkProgress <= 0.5) {
//       path.moveTo(startPoint.dx, startPoint.dy);
//       path.lineTo(
//         startPoint.dx + (midPoint.dx - startPoint.dx) * (checkProgress * 2),
//         startPoint.dy + (midPoint.dy - startPoint.dy) * (checkProgress * 2),
//       );
//     } else {
//       path.moveTo(startPoint.dx, startPoint.dy);
//       path.lineTo(midPoint.dx, midPoint.dy);
//       path.lineTo(
//         midPoint.dx + (endPoint.dx - midPoint.dx) * ((checkProgress - 0.5) * 2),
//         midPoint.dy + (endPoint.dy - midPoint.dy) * ((checkProgress - 0.5) * 2),
//       );
//     }

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
