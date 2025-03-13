import 'package:flutter/material.dart';
import 'package:your_snackbar/your_snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
          seedColor: Colors.blue,
          primary: Colors.black,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showYourSnackbar(
                context,
                height: 80,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.airplane_ticket, color: Colors.white),
                    SizedBox(width: 20),
                    Text(
                      'Ticket Added',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              child: const Text('Show snackbar'),
            ),
            ElevatedButton(
              onPressed: () => showYourSnackbar(
                context,
                height: 80,
                style: YourSnackbarStyle.error(context),
                direction: SnackbarDirection.bottom,
                duration: const Duration(seconds: 1),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi_off_rounded, color: Colors.white),
                    SizedBox(width: 20),
                    Text(
                      'No internet connection!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              child: const Text('Show error snackbar'),
            ),
            ElevatedButton(
              onPressed: () => showYourSnackbar(
                context,
                height: 80,
                style: YourSnackbarStyle.success(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done, color: Colors.white),
                    SizedBox(width: 20),
                    Text(
                      'Payment Confirmed',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              child: const Text('Show success snackbar'),
            ),
            ElevatedButton(
              onPressed: () => showYourSnackbar(
                context,
                style: YourSnackbarStyle.defaultStyle(context),
                direction: SnackbarDirection.bottom,
                duration: const Duration(seconds: 2),
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (context, index) => ColoredBox(
                      color: [
                        Colors.greenAccent,
                        Colors.redAccent,
                        Colors.blueAccent,
                        Colors.amberAccent,
                        Colors.cyanAccent,
                        Colors.purpleAccent,
                        Colors.blueAccent,
                        Colors.amberAccent,
                        Colors.cyanAccent,
                        Colors.purpleAccent,
                      ][index],
                      child: SizedBox(
                        height: index * 2 + 20,
                      ),
                    ),
                  ),
                ),
              ),
              child: const Text('Show listview snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}
