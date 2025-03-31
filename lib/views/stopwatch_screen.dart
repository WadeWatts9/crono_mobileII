import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/stopwatch_viewmodel.dart';
import '../widgets/lap_item.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<StopwatchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cronômetro de Voltas',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
        elevation: 10,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cronômetro
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                viewModel.elapsed.toString().substring(0, 10),
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            // Botões de controle (Iniciar/Pausar)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: viewModel.isRunning ? null : viewModel.start,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[400],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                  child: Text(
                    'Iniciar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: viewModel.isRunning ? viewModel.pause : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent[400],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                  child: Text(
                    'Pausar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Botão de registrar volta
            ElevatedButton(
              onPressed: viewModel.recordLap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent[700],
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
              child: Text(
                'Registrar Volta',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),

            // Lista de voltas
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.laps.length,
                itemBuilder: (context, index) {
                  final lap = viewModel.laps[index];
                  return LapItem(lap: lap);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
