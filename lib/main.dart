import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/secrets/app_secrets.dart';
import 'package:supabase/supabase.dart';

import 'core/theme/theme.dart';
import 'features/auth/presentation/pages/sign_in.dart';

void main() async {
  //since we are running initialising supabase before running runApp we need to call this method
  WidgetsFlutterBinding.ensureInitialized();
  ///[AppSecrrets.supabaseUrl] and [AppSecrrets.supabaseSecretKey] this is coming from the local file the values can be taken from supabase
  final supabase = SupabaseClient(AppSecrrets.supabaseUrl, AppSecrrets.supabaseSecretKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const SignInPage(),
    );
  }
}
