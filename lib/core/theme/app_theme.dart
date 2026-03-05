import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const gold = Color(0xFFD4AF37);
  static const sand = Color(0xFFF3E2A2);
  static const navy = Color(0xFF1A2230);
  static const navyAlt = Color(0xFF0F172A);
  static const slate = Color(0xFF334155);
  static const slateAlt = Color(0xFF1F2937);
  static const textPrimary = Color(0xFF1F2A37);
  static const textSecondary = Color(0xFF64748B);
  static const textSecondaryAlt = Color(0xFF475569);
  static const success = Color(0xFF22C55E);
  static const danger = Color(0xFFF43F5E);
  static const fieldFill = Color(0xFFFCFAF5);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceElevated = Color(0xFFFFFCF2);
  static const surfaceHover = Color(0xFFFAF5E6);
  static const border = Color(0xFFE8DDB6);

  // Backward-compatible aliases.
  static const cocoa = navy;
  static const cocoaDark = navyAlt;
  static const cocoaDeep = navyAlt;
  static const goldDark = sand;
  static const cream = Color(0xFFFFFDF8);
  static const sheet = surfaceElevated;
  static const glassFill = Color(0x7AFFFFFF);
  static const glassBorder = border;
  static const textOnDark = textPrimary;
  static const divider = border;
}

class AppGradients {
  static const background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFDF8), Color(0xFFFFF8EA), Color(0xFFFFFDF5)],
  );

  static const header = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFEF7E1), Color(0xFFF9E7B4)],
  );

  static const button = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.gold, AppColors.sand],
  );

  static const glass = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xEFFFFFFF), Color(0xD9FFF8E8)],
  );
}

class AppShadows {
  static const card = [
    BoxShadow(color: Color(0x15000000), blurRadius: 8, offset: Offset(0, 3)),
  ];

  static const focus = [
    BoxShadow(color: Color(0x26D4AF37), blurRadius: 8, offset: Offset.zero),
  ];
}

class AppTheme {
  static ThemeData build() {
    final base = ThemeData(useMaterial3: true, brightness: Brightness.light);
    final textTheme = _buildTextTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      fontFamily: 'Cairo',
      colorScheme: const ColorScheme.light(
        primary: AppColors.gold,
        secondary: AppColors.sand,
        surface: AppColors.surface,
        error: AppColors.danger,
        onPrimary: AppColors.navy,
        onSecondary: AppColors.navy,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: textTheme.titleMedium,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceElevated,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.border),
        ),
        shadowColor: Colors.black54,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.gold,
          side: const BorderSide(color: AppColors.gold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.fieldFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        floatingLabelStyle: textTheme.labelMedium?.copyWith(
          color: AppColors.gold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.gold, width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.danger, width: 1.2),
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.textSecondaryAlt,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.navyAlt,
          disabledBackgroundColor: Color(0xFFE5E7EB),
          disabledForegroundColor: AppColors.textSecondary,
          textStyle: textTheme.labelLarge?.copyWith(color: AppColors.navyAlt),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.gold,
          textStyle: textTheme.labelMedium,
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: AppColors.surfaceElevated,
        selectedColor: AppColors.gold.withAlpha(64),
        side: const BorderSide(color: AppColors.border),
        labelStyle: textTheme.labelMedium?.copyWith(
          color: AppColors.textPrimary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      dataTableTheme: DataTableThemeData(
        headingRowColor: const MaterialStatePropertyAll(Color(0xFFF8EFCF)),
        headingTextStyle: textTheme.labelSmall?.copyWith(
          color: AppColors.textSecondaryAlt,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
        dataTextStyle: textTheme.bodyMedium,
        dataRowColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return AppColors.surfaceHover;
          }
          return AppColors.surface;
        }),
        dividerThickness: 1,
        headingRowHeight: 44,
        dataRowMinHeight: 44,
        dataRowMaxHeight: 56,
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
        ),
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: Color(0x3AD4AF37),
      ),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    final body = GoogleFonts.manropeTextTheme(base);

    TextStyle heading(
      TextStyle? source, {
      double? size,
      FontWeight? weight,
      Color? color,
      double? letterSpacing,
    }) {
      return GoogleFonts.marcellus(
        textStyle: source,
        fontSize: size ?? source?.fontSize,
        fontWeight: weight ?? source?.fontWeight,
        color: color ?? source?.color ?? AppColors.textPrimary,
        letterSpacing: letterSpacing ?? source?.letterSpacing,
      ).copyWith(fontFamilyFallback: const ['Cairo']);
    }

    TextStyle bodyStyle(
      TextStyle? source, {
      double? size,
      FontWeight? weight,
      Color? color,
      double? height,
      double? letterSpacing,
    }) {
      return GoogleFonts.manrope(
        textStyle: source,
        fontSize: size ?? source?.fontSize,
        fontWeight: weight ?? source?.fontWeight,
        color: color ?? source?.color ?? AppColors.textPrimary,
        height: height ?? source?.height,
        letterSpacing: letterSpacing ?? source?.letterSpacing,
      ).copyWith(fontFamilyFallback: const ['Cairo']);
    }

    return body.copyWith(
      displayLarge: heading(base.displayLarge, weight: FontWeight.w500),
      displayMedium: heading(base.displayMedium, weight: FontWeight.w500),
      displaySmall: heading(base.displaySmall, weight: FontWeight.w600),
      headlineLarge: heading(base.headlineLarge, weight: FontWeight.w600),
      headlineMedium: heading(base.headlineMedium, weight: FontWeight.w600),
      headlineSmall: heading(base.headlineSmall, weight: FontWeight.w700),
      titleLarge: heading(base.titleLarge, weight: FontWeight.w700),
      titleMedium: heading(base.titleMedium, weight: FontWeight.w700),
      titleSmall: heading(base.titleSmall, weight: FontWeight.w700),
      bodyLarge: bodyStyle(
        base.bodyLarge,
        color: AppColors.textPrimary,
        height: 1.6,
        weight: FontWeight.w500,
      ),
      bodyMedium: bodyStyle(
        base.bodyMedium,
        color: AppColors.textPrimary,
        height: 1.6,
      ),
      bodySmall: bodyStyle(
        base.bodySmall,
        color: AppColors.textSecondary,
        height: 1.6,
      ),
      labelLarge: bodyStyle(
        base.labelLarge,
        color: AppColors.textPrimary,
        weight: FontWeight.w700,
        letterSpacing: 0.25,
      ),
      labelMedium: bodyStyle(
        base.labelMedium,
        color: AppColors.textSecondaryAlt,
        weight: FontWeight.w600,
      ),
      labelSmall: bodyStyle(
        base.labelSmall,
        color: AppColors.textSecondaryAlt,
        weight: FontWeight.w600,
      ),
    );
  }
}
