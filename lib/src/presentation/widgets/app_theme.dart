import 'package:flutter/services.dart';

import 'widgets.dart';

mixin AppTheme {
  static const _border = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(6.0),
    ),
  );

  static final theme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Palette.primary,
    // primaryColorBrightness: Brightness.dark,

    fontFamily: 'Poppins',
    colorScheme: const ColorScheme(
      secondary: Palette.primary,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      surface: Colors.white,
      // primaryVariant: Palette.primary,
      error: Colors.red,
      // secondaryVariant: Palette.primary,
      background: Palette.background,
      onSurface: Colors.white,
      primary: Palette.primary,
    ),
    

    inputDecorationTheme: const InputDecorationTheme(
      border: _border,
      focusedBorder: _border,
      errorBorder: _border,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      constraints: BoxConstraints(
        minHeight: 68,
        // maxHeight: 68,
      ),
      filled: true,

      fillColor: Palette.gray6,
      labelStyle: TextStyle(color: Colors.black, fontSize: 12),

      // fillColor: Colors.white,
    ),

    // backgroundColor: Colors.white,
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Palette.gray4,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3.0,
            color: Palette.gray3,
          ),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Palette.primary,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Palette.gray1,
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
      iconTheme: IconThemeData(
        color: Palette.primary,
      ),
      // brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFFFCFAF7),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Palette.green),
        // foregroundColor:
      ),
    ),
    
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(color: Palette.gray1);
          }
          return const IconThemeData(color: Palette.gray4);
        },
      ),
      // labelTextStyle: MaterialStateProperty.resolveWith(
      //   (states) {
      //     return switch (states) {
      //       MaterialState.selected =>
      //         const TextStyle(color: Colors.amber, letterSpacing: 1.3),
      //       _ => const TextStyle(color: Colors.amber, letterSpacing: 1.3),
      //     };
      //     // return ;
      //   },
      // ),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: Palette.gray5,
      selectedIconTheme: IconThemeData(
        color: Palette.primary,
      ),
      unselectedIconTheme: IconThemeData(
        color: Palette.gray2,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontFamily: 'Exo',
          fontSize: 14.0,
          letterSpacing: -.33,
        ),
      ),
    ),
    // colorScheme: ColorScheme.dark(
    //   primary: Palette.primary,
    //   // secondary: Palette.,
    // ),
    textTheme: const TextTheme(
        // headlineSmall: TextStyle(
        //   // fontFamily: 'Exo',
        //   fontSize: 20,
        //   fontWeight: FontWeight.w500,
        //   color: Colors.black,
        // ),
        // titleMedium: TextStyle(
        //   fontWeight: FontWeight.w500,
        //   color: Palette.gray1,
        // ),
        // titleSmall: TextStyle(
        //   fontWeight: FontWeight.normal,
        //   color: Palette.gray2,
        // ),
        ),

    splashColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Palette.background,
      // enableFeedback: false,
      selectedLabelStyle: TextStyle(fontSize: 14.0),
      unselectedLabelStyle: TextStyle(fontSize: 14.0),
      // elevation: 12.0,
      enableFeedback: false,
      elevation: 0,

      selectedIconTheme: IconThemeData(
        size: 24.0,
      ),
      unselectedIconTheme: IconThemeData(
        size: 24.0,
      ),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Palette.primary,
      unselectedItemColor: Palette.gray2,

      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Palette.primary,
    ),
  );
}
