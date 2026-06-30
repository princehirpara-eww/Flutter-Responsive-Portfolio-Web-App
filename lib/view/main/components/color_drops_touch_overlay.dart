import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DropRipple {
  final Offset position;
  final Color color;
  final double maxRadius;
  double radius = 0;
  double progress = 0; // 0.0 to 1.0

  DropRipple({
    required this.position,
    required this.color,
    required this.maxRadius,
  });

  /// Updates ripple state. Returns false if the ripple is finished and should be removed.
  bool update(double dt) {
    progress += dt * 2.2; // fully expands in ~0.45s
    if (progress > 1.0) progress = 1.0;
    radius = maxRadius * progress;
    return progress < 1.0;
  }
}

class DropletParticle {
  Offset position;
  Offset velocity;
  final Color color;
  final double initialSize;
  double size;
  double life = 1.0; // 1.0 down to 0.0
  final double decayRate; // how fast life drains
  final double friction;
  final double gravity;

  DropletParticle({
    required this.position,
    required this.velocity,
    required this.color,
    required this.initialSize,
    required this.decayRate,
    this.friction = 0.95,
    this.gravity = 180.0,
  }) : size = initialSize;

  /// Updates particle state. Returns false if the particle is dead.
  bool update(double dt) {
    // Apply gravity (drips down)
    velocity = Offset(velocity.dx, velocity.dy + gravity * dt);
    // Apply friction (air resistance)
    velocity = velocity * (math.pow(friction, dt * 60).toDouble());
    // Update position
    position += velocity * dt;
    // Decaying life
    life -= decayRate * dt;
    if (life < 0) life = 0;
    // Update size based on life
    size = initialSize * life;
    return life > 0;
  }
}

class ColorDropsTouchOverlay extends StatefulWidget {
  final Widget child;

  const ColorDropsTouchOverlay({super.key, required this.child});

  @override
  State<ColorDropsTouchOverlay> createState() => _ColorDropsTouchOverlayState();
}

class _ColorDropsTouchOverlayState extends State<ColorDropsTouchOverlay>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  final ValueNotifier<int> _paintNotifier = ValueNotifier<int>(0);
  
  final List<DropRipple> _ripples = [];
  final List<DropletParticle> _particles = [];
  
  Duration _lastElapsed = Duration.zero;
  final math.Random _random = math.Random();
  Offset _lastMovePos = Offset.zero;
  Offset _lastHoverPos = Offset.zero;

  // Curated list of vibrant, neon-like paint colors
  static const List<Color> _vibrantColors = [
    Color(0xFFFF2A6D), // Neon Pink
    Color(0xFF05D9E8), // Neon Cyan/Turquoise
    Color(0xFF3DDC84), // Android Green / Neon Green
    Color(0xFFFFEA00), // Neon Yellow/Gold
    Color(0xFF9D00FF), // Neon Purple/Violet
    Color(0xFF305CDE), // Royal Blue
    Color(0xFFFF5E00), // Neon Orange
  ];

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _paintNotifier.dispose();
    super.dispose();
  }

  void _startTicker() {
    if (!_ticker.isActive) {
      _lastElapsed = Duration.zero;
      _ticker.start();
    }
  }

  void _onTick(Duration elapsed) {
    if (_lastElapsed == Duration.zero) {
      _lastElapsed = elapsed;
      return;
    }
    final double dt = (elapsed.inMicroseconds - _lastElapsed.inMicroseconds) / 1000000.0;
    _lastElapsed = elapsed;

    _updateParticles(dt);
  }

  void _updateParticles(double dt) {
    // Limit dt to avoid physics exploding if frames drop or browser goes to sleep
    final double simulationDt = dt.clamp(0.0, 0.05);

    bool updated = false;

    // Update ripples
    for (int i = _ripples.length - 1; i >= 0; i--) {
      if (!_ripples[i].update(simulationDt)) {
        _ripples.removeAt(i);
      }
      updated = true;
    }

    // Update particles
    for (int i = _particles.length - 1; i >= 0; i--) {
      if (!_particles[i].update(simulationDt)) {
        _particles.removeAt(i);
      }
      updated = true;
    }

    if (updated) {
      _paintNotifier.value++;
    }

    // Stop ticker if lists are empty to consume 0% CPU when idle
    if (_ripples.isEmpty && _particles.isEmpty) {
      _ticker.stop();
    }
  }

  void _spawnTapDrops(Offset position) {
    _startTicker();
    
    // Pick a primary color for this splash
    final color = _vibrantColors[_random.nextInt(_vibrantColors.length)];

    // 1. Large expanding drop ripple
    _ripples.add(DropRipple(
      position: position,
      color: color,
      maxRadius: 55.0 + _random.nextDouble() * 35.0,
    ));

    // 2. High-velocity droplet splatter
    final int count = 10 + _random.nextInt(8); // 10 to 17 particles
    for (int i = 0; i < count; i++) {
      final double angle = _random.nextDouble() * 2 * math.pi;
      final double speed = 90.0 + _random.nextDouble() * 200.0;
      final double size = 4.5 + _random.nextDouble() * 5.5;
      final double decay = 1.2 + _random.nextDouble() * 1.4; // Lifespan 0.4s to 0.76s
      
      _particles.add(DropletParticle(
        position: position,
        velocity: Offset(math.cos(angle) * speed, math.sin(angle) * speed),
        color: color,
        initialSize: size,
        decayRate: decay,
        gravity: 140.0 + _random.nextDouble() * 100.0,
        friction: 0.94,
      ));
    }
  }

  void _spawnTrailDrops(Offset position, {required bool isHover}) {
    _startTicker();

    final color = _vibrantColors[_random.nextInt(_vibrantColors.length)];

    // Trail drops are smaller, fewer, and decay faster
    final int count = isHover ? 1 : 2;
    for (int i = 0; i < count; i++) {
      final double angle = _random.nextDouble() * 2 * math.pi;
      // Slightly lower speed, mostly gravity-led drip
      final double speed = 25.0 + _random.nextDouble() * 55.0;
      final double size = (isHover ? 2.0 : 3.0) + _random.nextDouble() * 3.0;
      final double decay = (isHover ? 2.2 : 1.6) + _random.nextDouble() * 1.2;

      _particles.add(DropletParticle(
        position: position,
        velocity: Offset(math.cos(angle) * speed, math.sin(angle) * speed),
        color: color,
        initialSize: size,
        decayRate: decay,
        gravity: 100.0 + _random.nextDouble() * 80.0,
        friction: 0.95,
      ));
    }
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      // Mouse/Trackpad scroll event
      _spawnTrailDrops(event.localPosition, isHover: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => _spawnTapDrops(event.localPosition),
      onPointerMove: (event) {
        final double dist = (event.localPosition - _lastMovePos).distance;
        if (dist > 15) {
          _spawnTrailDrops(event.localPosition, isHover: false);
          _lastMovePos = event.localPosition;
        }
      },
      onPointerHover: (event) {
        final double dist = (event.localPosition - _lastHoverPos).distance;
        if (dist > 25) {
          _spawnTrailDrops(event.localPosition, isHover: true);
          _lastHoverPos = event.localPosition;
        }
      },
      onPointerSignal: _onPointerSignal,
      child: Stack(
        children: [
          Positioned.fill(
            child: widget.child,
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: ColorDropsPainter(
                    ripples: _ripples,
                    particles: _particles,
                    repaint: _paintNotifier,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDropsPainter extends CustomPainter {
  final List<DropRipple> ripples;
  final List<DropletParticle> particles;

  ColorDropsPainter({
    required this.ripples,
    required this.particles,
    required super.repaint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Paint Ripples
    for (final ripple in ripples) {
      final double progress = ripple.progress;
      final double opacity = (1.0 - progress) * 0.45;
      
      // Radial glow effect
      final paintGlow = Paint()
        ..shader = RadialGradient(
          colors: [
            ripple.color.withValues(alpha: opacity),
            ripple.color.withValues(alpha: opacity * 0.4),
            ripple.color.withValues(alpha: 0.0),
          ],
          stops: const [0.0, 0.4, 1.0],
        ).createShader(Rect.fromCircle(
          center: ripple.position,
          radius: ripple.radius.clamp(0.01, double.infinity),
        ))
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(ripple.position, ripple.radius, paintGlow);

      // Fine expanding edge ring
      final paintRing = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0 * (1.0 - progress)
        ..color = ripple.color.withValues(alpha: (1.0 - progress) * 0.5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);
      
      canvas.drawCircle(ripple.position, ripple.radius, paintRing);
    }

    // 2. Paint Droplets
    for (final particle in particles) {
      final paint = Paint()
        ..color = particle.color.withValues(alpha: particle.life.clamp(0.0, 1.0))
        ..style = PaintingStyle.fill;

      // Add a slight blur filter for neon glowing drop appearance
      if (particle.size > 2.0) {
        paint.maskFilter = MaskFilter.blur(BlurStyle.normal, particle.size * 0.15);
      }
      
      canvas.drawCircle(particle.position, particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ColorDropsPainter oldDelegate) {
    return true; // repainting is handled by the repaint Listenable
  }
}
