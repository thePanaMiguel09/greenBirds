import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:green_birds/infraestructure/datasource/research_datasource_imp.dart';
import 'package:green_birds/infraestructure/repositories/research_repository_impl.dart';
import 'package:green_birds/presentation/providers/researchs_provider.dart';
import 'package:green_birds/presentation/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final researchRepository = ResearchRepositoryImpl(
      researchs: ResearchDatasourceImp(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              ResearchsProvider(researchRepository: researchRepository)
                ..loadResearchs(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('es', 'CO')],
        locale: const Locale('es', 'CO'),
        debugShowCheckedModeBanner: false,
        title: 'Green Birds',
        home: const MainScreen(),
      ),
    );
  }
}
