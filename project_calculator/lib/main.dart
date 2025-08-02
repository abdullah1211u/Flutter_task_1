import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const CalculatorApp(),
    ),
  );
}

// Theme colors
class AppColors {
  static const Color lightBg = Color(0xFFF7F8FB);
  static const Color lightPrimaryText = Color(0xFF333333);
  static const Color lightSecondaryText = Color(0xFF666666);
  static const Color lightButtonBg = Colors.white;
  static const Color lightAccent = Color(0xFF4A90E2);
  static const Color lightAccentRed = Color(0xFFD0021B);

  static const Color darkBg = Color(0xFF17181A);
  static const Color darkPrimaryText = Colors.white;
  static const Color darkSecondaryText = Color(0xFFB0B0B0);
  static const Color darkButtonBg = Color(0xFF2E2F38);
  static const Color darkAccent = Color(0xFF5ED3F3);
  static const Color darkAccentGreen = Color(0xFF26D367);
}

// Theme switcher
class ThemeNotifier extends ChangeNotifier {
  //inheritance
  bool _isDarkMode = true;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

// App root
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBg,
        primaryColor: AppColors.lightPrimaryText,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: AppColors.lightPrimaryText,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(color: AppColors.lightSecondaryText),
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.lightAccent,
          secondary: AppColors.lightAccentRed,
          onPrimary: Colors.white,
          surface: AppColors.lightButtonBg,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBg,
        primaryColor: AppColors.darkPrimaryText,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: AppColors.darkPrimaryText,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(color: AppColors.darkSecondaryText),
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.darkAccentGreen,
          secondary: AppColors.darkAccent,
          onPrimary: Colors.black,
          surface: AppColors.darkButtonBg,
        ),
      ),
      themeMode: themeNotifier.themeMode,
      home: const CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Calculator Page
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _history = '';
  String _expression = '0';
  String _operation = '';
  double _firstNum = 0;
  bool _waitingForSecondOperand = false;

  void _onButtonPressed(String text) {
    setState(() {
      if ('0123456789.'.contains(text)) {
        if (_waitingForSecondOperand) {
          _expression = (text == '.') ? '0.' : text;
          _waitingForSecondOperand = false;
        } else {
          if (_expression == '0' && text != '.') {
            _expression = text;
          } else if (_expression.contains('.') && text == '.') {
            // Ignore multiple decimals
          } else {
            _expression += text;
          }
        }
      } else if (text == 'AC') {
        _history = '';
        _expression = '0';
        _firstNum = 0;
        _operation = '';
        _waitingForSecondOperand = false;
      } else if (text == '⌫') {
        if (_expression.length > 1) {
          _expression = _expression.substring(0, _expression.length - 1);
        } else {
          _expression = '0';
        }
      } else if (text == '%') {
        double currentValue = double.tryParse(_expression) ?? 0;
        _expression = (currentValue / 100).toString();
        _history = _expression;
      } else if ('÷×−+-'.contains(text)) {
        _firstNum = double.tryParse(_expression) ?? 0;
        _operation = text.replaceFirst('−', '-');
        _history = '${_formatNumber(_firstNum)} $_operation';
        _waitingForSecondOperand = true;
      } else if (text == '=') {
        if (_operation.isNotEmpty) {
          double secondNum = double.tryParse(_expression) ?? 0;
          _history += ' ${_formatNumber(secondNum)}';
          double result = _calculate(_firstNum, secondNum, _operation);
          _expression = _formatNumber(result);
          _firstNum = result;
          _operation = '';
        }
      }
    });
  }

  double _calculate(double a, double b, String op) {
    switch (op) {
      case '÷':
        return b != 0 ? a / b : double.infinity;
      case '×':
        return a * b;
      case '-':
        return a - b;
      case '+':
        return a + b;
      default:
        return b;
    }
  }

  String _formatNumber(double num) {
    final format = NumberFormat("#,###.######");
    if (num == num.toInt()) {
      return num.toInt().toString();
    }
    return format.format(num);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          final displayFontSize = isWide ? 80.0 : 60.0;
          final buttonFontSize = isWide ? 36.0 : 28.0;
          final buttonHeight = isWide ? 90.0 : 70.0;
          final buttonSpacing = isWide ? 12.0 : 6.0;

          return SafeArea(
            child: Column(
              children: [
                // Theme toggle
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? 40 : 20,
                    vertical: 10,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.wb_sunny,
                            color:
                                themeNotifier.themeMode == ThemeMode.light
                                    ? theme.colorScheme.primary
                                    : theme.primaryColor.withOpacity(0.5),
                          ),
                          onPressed: () {
                            if (themeNotifier.themeMode != ThemeMode.light) {
                              themeNotifier.toggleTheme();
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.nightlight_round,
                            color:
                                themeNotifier.themeMode == ThemeMode.dark
                                    ? theme.colorScheme.secondary
                                    : theme.primaryColor.withOpacity(0.5),
                          ),
                          onPressed: () {
                            if (themeNotifier.themeMode != ThemeMode.dark) {
                              themeNotifier.toggleTheme();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Display
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWide ? 40 : 25,
                      vertical: 20,
                    ),
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _history,
                          style: theme.textTheme.headlineSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _expression,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontSize: displayFontSize,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ],
                    ),
                  ),
                ),

                // Buttons
                Padding(
                  padding: EdgeInsets.all(isWide ? 20 : 15),
                  child: Column(
                    children: [
                      _buildButtonRow(
                        ['AC', '⌫', '%', '÷'],
                        buttonFontSize,
                        buttonHeight,
                        buttonSpacing,
                      ),
                      _buildButtonRow(
                        ['7', '8', '9', '×'],
                        buttonFontSize,
                        buttonHeight,
                        buttonSpacing,
                      ),
                      _buildButtonRow(
                        ['4', '5', '6', '−'],
                        buttonFontSize,
                        buttonHeight,
                        buttonSpacing,
                      ),
                      _buildButtonRow(
                        ['1', '2', '3', '+'],
                        buttonFontSize,
                        buttonHeight,
                        buttonSpacing,
                      ),
                      _buildButtonRow(
                        ['0', '.', '='],
                        buttonFontSize,
                        buttonHeight,
                        buttonSpacing,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildButtonRow(
    List<String> texts,
    double fontSize,
    double height,
    double spacing,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            texts.map((text) {
              int flex = text == '0' ? 2 : 1;
              return Expanded(
                flex: flex,
                child: CalculatorButton(
                  text: text,
                  onPressed: _onButtonPressed,
                  fontSize: fontSize,
                  height: height,
                ),
              );
            }).toList(),
      ),
    );
  }
}

// Calculator Button
class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) onPressed;
  final double fontSize;
  final double height;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 28,
    this.height = 70,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Color getTextColor() {
      if ('÷×−+='.contains(text)) {
        return isDark ? AppColors.darkAccent : AppColors.lightAccentRed;
      }
      if ('AC⌫%'.contains(text)) {
        return isDark ? AppColors.darkAccentGreen : AppColors.lightAccent;
      }
      return theme.primaryColor;
    }

    return Container(
      margin: const EdgeInsets.all(6),
      height: height,
      child: ElevatedButton(
        onPressed: () => onPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 2,
          shadowColor: theme.scaffoldBackgroundColor.withOpacity(0.4),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: getTextColor(),
            ),
          ),
        ),
      ),
    );
  }
}
