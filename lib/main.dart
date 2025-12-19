import 'package:chella/features/Authentication/register/data/repositories/register_repository_impl.dart';
import 'package:chella/features/Authentication/register/data/service/register_service.dart';
import 'package:chella/features/Authentication/register/doamin/usecases/register_usecase.dart';
import 'package:chella/features/Authentication/register/presentation/providers/register_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chella/core/handlers/dio_client.dart';
import 'package:chella/core/theme/app_theme.dart';

import 'features/Authentication/login/data/services/auth_service.dart';
import 'features/Authentication/login/data/repository/login_repo_impl.dart';
import 'features/Authentication/login/domain/usecases/login_usecase.dart';
import 'features/Authentication/login/presentation/provider/auth_provder.dart';
import 'features/Authentication/login/presentation/pages/login_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) {
            final dio = DioClient();
            final authService = AuthService(dio);
            final repository = AuthRepositoryImpl(authService);
            final loginUseCase = LoginUseCase(repository);
            return AuthProvider(loginUseCase);
          },
        ),

        ChangeNotifierProvider<RegisterProvider>(
          create: (_) {
            final dio = DioClient();
            final registerService = RegisterService(dio);
            final repository = RegisterRepositoryImpl(registerService);
            final registerUseCase = RegisterUseCase(repository);
            return RegisterProvider(registerUseCase);
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chella',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}


// 1. Enity 
// 2. complexity 
// 3. Error

