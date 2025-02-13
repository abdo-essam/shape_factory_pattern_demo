import 'package:flutter/material.dart';
import '../factory/shape_factory.dart';
import '../models/shape.dart';
import '../widgets/shape_button.dart';
import '../widgets/shape_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ShapeFactory _shapeFactory = ShapeFactory();
  Shape? _currentShape;
  String? _error;
  bool _isLoading = false;

  Future<void> _createShape(String shapeType) async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
        _currentShape = null;
      });

      // Simulate delay for demo purposes
      await Future.delayed(const Duration(milliseconds: 400));

      final shape = _shapeFactory.getShape(shapeType);

      setState(() {
        _currentShape = shape;
        _isLoading = false;
      });

    } catch (e) {
      setState(() {
        _error = e.toString();
        _currentShape = null;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shape Factory Pattern Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showInfo,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildShapeSelector(),
            Expanded(
              child: _isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : ShapeDisplay(
                shape: _currentShape,
                error: _error,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShapeSelector() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select a Shape',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShapeButton(
                  onPressed: () => _createShape('circle'),
                  icon: Icons.circle_outlined,
                  label: 'Circle',
                  color: Colors.blue,
                ),
                ShapeButton(
                  onPressed: () => _createShape('rectangle'),
                  icon: Icons.rectangle_outlined,
                  label: 'Rectangle',
                  color: Colors.green,
                ),
                ShapeButton(
                  onPressed: () => _createShape('square'),
                  icon: Icons.square_outlined,
                  label: 'Square',
                  color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Factory Pattern'),
        content: const Text(
          'The Factory Pattern is a creational pattern that provides an interface '
              'for creating objects but allows subclasses to alter the type of '
              'objects that will be created.\n\n'
              'In this demo, we use the Factory Pattern to create different shapes '
              'without explicitly specifying their classes.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}