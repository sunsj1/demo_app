import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeModeVariant { light, dark }

class FontTheme {
  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final _generalFontFamily = GoogleFonts.openSans();
  static final _headingsFontFamily = GoogleFonts.kanit();

  static final TextTheme textTheme = TextTheme(
    headlineLarge: _headingsFontFamily.copyWith(
      fontWeight: _semiBold,
      fontSize: 17.0,
    ),
    headlineMedium:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 14.0),
    headlineSmall:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 12.0),
    bodyLarge:
        _generalFontFamily.copyWith(fontWeight: _regular, fontSize: 14.0),
    bodyMedium:
        _generalFontFamily.copyWith(fontWeight: _regular, fontSize: 12.0),
    bodySmall: _generalFontFamily.copyWith(fontWeight: _light, fontSize: 10.0),
    displayLarge:
        _headingsFontFamily.copyWith(fontWeight: _bold, fontSize: 22.0),
    displayMedium:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 14.0),
    displaySmall:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 12.0),
    titleLarge:
        _generalFontFamily.copyWith(fontWeight: _medium, fontSize: 17.0),
    titleMedium:
        _generalFontFamily.copyWith(fontWeight: _regular, fontSize: 14.0),
    titleSmall:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 12.0),
    labelLarge:
        _generalFontFamily.copyWith(fontWeight: _medium, fontSize: 14.0),
    labelMedium:
        _generalFontFamily.copyWith(fontWeight: _semiBold, fontSize: 12.0),
    labelSmall:
        _generalFontFamily.copyWith(fontWeight: _regular, fontSize: 10.0),
  );
}

class AppThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static const _lightModeExtendedPallete = ExtendedPallete(
    variant1: Color(0xFF42A0C7),
    variant2: Color(0xFF48CCAD),
    variant3: Color(0xFF583977),
    variant4: Color(0xFFF45A36),
  );

  static const _darkModeExtendedPallete = ExtendedPallete(
    variant1: Color(0xFF42A0C7),
    variant2: Color(0xFFE53935),
    variant3: Color(0xFFA3EBDF),
    variant4: Color(0xFFA3EBDF),
  );

  static ThemeData lightThemeData = themeData(
    lightColorScheme,
    _lightFocusColor,
    <ThemeExtension<dynamic>>[_lightModeExtendedPallete],
    ThemeModeVariant.light,
  );
  static ThemeData darkThemeData = themeData(
    darkColorScheme,
    _darkFocusColor,
    <ThemeExtension<dynamic>>[_darkModeExtendedPallete],
    ThemeModeVariant.dark,
  );

  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
    List<ThemeExtension<dynamic>>? themeExtensions,
    ThemeModeVariant themeModeVariant,
  ) {
    final isLightTheme = themeModeVariant == ThemeModeVariant.light;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: FontTheme.textTheme,
      extensions: themeExtensions,
      appBarTheme: AppBarTheme(
        elevation: 16.0,
        surfaceTintColor: isLightTheme ? Colors.white : Colors.transparent,
        systemOverlayStyle: isLightTheme
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        shadowColor: colorScheme.shadow.withOpacity(0.3),
      ),
      iconTheme: IconThemeData(color: colorScheme.surfaceVariant),
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor:
          isLightTheme ? Colors.white : const Color(0xFF202020),
      highlightColor: isLightTheme ? Colors.white : Colors.transparent,
      focusColor: focusColor,
      shadowColor: colorScheme.shadow.withOpacity(0.4),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: colorScheme.primary.withOpacity(0.5),
        selectionHandleColor: colorScheme.primary,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.titleMedium!.apply(color: _darkFillColor),
      ),
      cardTheme: CardTheme(
        elevation: 1,
        color: isLightTheme ? Colors.white : const Color(0xFF232323),
        surfaceTintColor: isLightTheme ? Colors.white : const Color(0xFF464646),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(
            color: colorScheme.outline.withOpacity(0.75),
            width: 1.0,
          ),
        ),
        margin: const EdgeInsets.all(0.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        filled: true,
        fillColor: colorScheme.surfaceVariant.withOpacity(0.04),
        hintStyle: _textTheme.bodyMedium?.copyWith(
          fontWeight: _medium,
        ),
        prefixIconColor: colorScheme.primary,
        alignLabelWithHint: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.secondaryContainer,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.outline.withOpacity(0.75),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(colorScheme.primaryContainer),
          foregroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
          overlayColor: MaterialStateProperty.all(
            colorScheme.surfaceVariant.withOpacity(0.4),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(12.0),
          ),
          shadowColor: MaterialStateProperty.all(
            colorScheme.shadow.withOpacity(0.4),
          ),
          elevation: MaterialStateProperty.all(2.0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textStyle: MaterialStateProperty.all(
            _textTheme.bodyMedium?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: _semiBold,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(colorScheme.primary),
          overlayColor: MaterialStateProperty.all(
            colorScheme.surfaceVariant.withOpacity(0.04),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(12.0),
          ),
          surfaceTintColor: MaterialStateProperty.all(
            colorScheme.surfaceVariant.withOpacity(0.04),
          ),
          elevation: MaterialStateProperty.all(0.0),
          visualDensity: VisualDensity.compact,
          iconSize: MaterialStateProperty.all(18),
          textStyle: MaterialStateProperty.all(
            _textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: _semiBold,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(12.0),
          ),
          elevation: MaterialStateProperty.all(0.0),
          textStyle: MaterialStatePropertyAll(_textTheme.bodyMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w500,
          )),
          visualDensity: VisualDensity.compact,
        ),
      ),
      listTileTheme: ListTileThemeData(
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        selectedColor: colorScheme.onPrimary,
        selectedTileColor: colorScheme.primaryContainer,
        tileColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        horizontalTitleGap: 15.0,
        minVerticalPadding: 5.0,
        minLeadingWidth: 24.0,
        visualDensity: VisualDensity.compact,
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: colorScheme.primary,
        unselectedLabelStyle: GoogleFonts.montserratTextTheme()
            .headlineMedium
            ?.copyWith(color: colorScheme.primary),
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return states.contains(MaterialState.focused)
                ? colorScheme.primary.withOpacity(0.2)
                : Colors.transparent;
          },
        ),
        labelColor: colorScheme.background,
        indicator: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          color: colorScheme.primary,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        elevation: 4.0,
      ),
      dataTableTheme: DataTableThemeData(
        headingTextStyle: _textTheme.titleMedium?.copyWith(
          color: colorScheme.secondaryContainer,
        ),
        // headingRowColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
        dataTextStyle: _textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSecondary,
        ),
        headingRowHeight: 48,
        checkboxHorizontalMargin: 0.0,
        horizontalMargin: 0.0,
        dataRowHeight: 48,
        dividerThickness: 0,
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: Color(0xFFE5E5E5),
      ),
      scrollbarTheme: ScrollbarThemeData(
        radius: const Radius.circular(8.0),
        thumbVisibility: MaterialStateProperty.all(true),
        thickness: MaterialStateProperty.all(8.0),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    // Primary
    primary: Color(0xFF263252),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF1a56ce),
    onPrimaryContainer: Color(0xFFEBEBEB),
    // Secondary
    secondary: Color(0xFFf8b206),
    onSecondary: Color(0xFF232323),
    secondaryContainer: Color(0xFF2e0c36),
    onSecondaryContainer: Color(0xFFFFFFFF),
    // Tertiary
    tertiary: Color.fromARGB(255, 0, 194, 52),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC5E5FF),
    onTertiaryContainer: Color(0xFF232323),
    //fourth
    scrim: Color(0xFF8F9AA5),
    // Error
    error: Color(0xFFB3261E),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF410E0B),
    // Other
    outline: Color(0xFFeeeef7),
    background: Color(0xFFFAFAFA),
    onBackground: Color(0xFF232323),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF232323),
    surfaceVariant: Color(0xFF181d27),
    onSurfaceVariant: Color(0xFFF9F9F9),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFD0BCFF),
    shadow: Color(0xFF222222),
    surfaceTint: Color.fromARGB(255, 234, 234, 234),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Primary
    primary: Color(0xFF263252),
    onPrimary: Color(0xFFEADDFF),
    primaryContainer: Color(0xFF4F378B),
    onPrimaryContainer: Color(0xFFEADDFF),
    // Secondary
    secondary: Color(0xFFCCC2DC),
    onSecondary: Color(0xFF332D41),
    secondaryContainer: Color(0xFF4A4458),
    onSecondaryContainer: Color(0xFFE8DEF8),
    // Tertiary
    tertiary: Color(0xFFEFB8C8),
    onTertiary: Color(0xFF492532),
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD8E4),
    // Error
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFF9DEDC),
    // Other
    outline: Color(0xFF938F99),
    background: Color(0xFF1C1B1F),
    onBackground: Color(0xFFE6E1E5),
    surface: Color(0xFF1C1B1F),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF6750A4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFD0BCFF),
  );

  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
      fontWeight: _semiBold,
      fontSize: 17.0,
    ),
    headlineMedium: GoogleFonts.inter(fontWeight: _medium, fontSize: 14.0),
    headlineSmall: GoogleFonts.inter(fontWeight: _medium, fontSize: 12.0),
    bodyLarge: GoogleFonts.inter(fontWeight: _regular, fontSize: 14.0),
    bodyMedium: GoogleFonts.inter(fontWeight: _regular, fontSize: 12.0),
    bodySmall: GoogleFonts.inter(fontWeight: _light, fontSize: 10.0),
    displayLarge: GoogleFonts.inter(fontWeight: _bold, fontSize: 21.0),
    displayMedium: GoogleFonts.inter(fontWeight: _medium, fontSize: 14.0),
    displaySmall: GoogleFonts.inter(fontWeight: _medium, fontSize: 12.0),
    titleLarge: GoogleFonts.inter(fontWeight: _semiBold, fontSize: 17.0),
    titleMedium: GoogleFonts.inter(fontWeight: _semiBold, fontSize: 14.0),
    titleSmall: GoogleFonts.inter(fontWeight: _medium, fontSize: 12.0),
    labelLarge: GoogleFonts.inter(fontWeight: _medium, fontSize: 14.0),
    labelMedium: GoogleFonts.inter(fontWeight: _medium, fontSize: 12.0),
    labelSmall: GoogleFonts.inter(fontWeight: _regular, fontSize: 10.0),
  );
}

@immutable
class ExtendedPallete extends ThemeExtension<ExtendedPallete> {
  const ExtendedPallete({
    required this.variant1,
    required this.variant2,
    required this.variant3,
    required this.variant4,
  });

  final Color? variant1;
  final Color? variant2;
  final Color? variant3;
  final Color? variant4;

  @override
  ExtendedPallete copyWith(
      {Color? color1, Color? color2, Color? color3, Color? color4}) {
    return ExtendedPallete(
      variant1: color1 ?? variant1,
      variant2: color2 ?? variant2,
      variant3: color3 ?? variant3,
      variant4: color4 ?? variant4,
    );
  }

  @override
  ExtendedPallete lerp(ExtendedPallete? other, double t) {
    if (other is! ExtendedPallete) {
      return this;
    }
    return ExtendedPallete(
      variant1: Color.lerp(variant1, other.variant1, t),
      variant2: Color.lerp(variant2, other.variant2, t),
      variant3: Color.lerp(variant3, other.variant3, t),
      variant4: Color.lerp(variant4, other.variant4, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $variant1, danger: $variant2)';
}
