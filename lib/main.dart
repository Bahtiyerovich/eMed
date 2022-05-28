import 'package:emed/core/components/Theme/theme_comp.dart';
import 'package:emed/core/routes/routes.dart';
import 'package:flutter/material.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-med',
      theme: ThemeComp.materialTheme,
      onGenerateRoute: Routes.instantce.onGeneralRoute,
      initialRoute: '/splashscreen',
    );
  }
}

//! text boshqattan yozish

//! font va mediaquery ni boshqa kod bilan yozish

//! button widget boshqattan qilish chetiga linya bilan

//! appBar boshqattan yozish kerak
//! appBar da hamma WIDGET ni rangini bir hil qilish

//! 04 08 video telefon cherez firebase
//! 02 25 video theme ranglarini
//! 02 23 video page.view
//! 02 21 video buttonnavbar

