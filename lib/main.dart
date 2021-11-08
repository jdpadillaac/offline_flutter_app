import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:offline_app/data/api_rest/data_source/product_api.dart';
import 'package:offline_app/data/havi/data_source/product.dart';
import 'package:offline_app/domain/usecase/product_usecase.dart';
import 'package:offline_app/presentation/constants/colors.dart';
import 'package:offline_app/presentation/pages/home/home_page.dart';
import 'domain/repository/product.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme(
          primary: AppColors.primary,
          primaryVariant: AppColors.primary,
          secondary: AppColors.primary,
          secondaryVariant: AppColors.primary,
          surface: AppColors.primary,
          background: AppColors.primary,
          error: AppColors.primary,
          onPrimary: Colors.white,
          onSecondary: AppColors.primary,
          onSurface: AppColors.primary,
          onBackground: AppColors.primary,
          onError: AppColors.primary,
          brightness: Brightness.light,
        ),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ProductRepository>(
            create: (_) => ProductApi(),
          ),
          RepositoryProvider<ProductUseCase>(
            create: (_) => ProductUseCase(
              localRepository: HaviProduct(),
              remoteRepository: ProductApi(),
            ),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
