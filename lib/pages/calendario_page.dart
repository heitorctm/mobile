import 'package:espaco_cultural_2/components/custom_calendar.dart';
import 'package:flutter/material.dart';
import 'package:espaco_cultural_2/components/custom_appbar.dart';
import 'package:espaco_cultural_2/components/custom_drawer.dart';
import 'package:espaco_cultural_2/components/evento.dart';
import 'package:espaco_cultural_2/services/add_evento.dart';
import 'package:espaco_cultural_2/services/database_service.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  CalendarioPageState createState() => CalendarioPageState();
}

class CalendarioPageState extends State<CalendarioPage> {
  final Map<DateTime, List<Evento>> _events = {};
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late AddEventoService _addEventoService;
  final DatabaseService _databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _addEventoService = AddEventoService(_events);
    _loadEventos();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  Future<void> _loadEventos() async {
    List<Evento> eventos = await _databaseService.getEventos();
    setState(() {
      for (var evento in eventos) {
        if (_events[evento.date] == null) {
          _events[evento.date] = [];
        }
        _events[evento.date]!.add(evento);
      }
    });
  }

  void _removeEvent(Evento evento) {
    setState(() {
      _events[evento.date]?.remove(evento);
      if (_events[evento.date]?.isEmpty ?? false) {
        _events.remove(evento.date);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Calendário',
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Calendario(
              focusedDay: _focusedDay,
              selectedDay: _selectedDay,
              events: _events,
              onDaySelected: _onDaySelected,
            ),
            _selectedDay != null
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _getEventsForDay(_selectedDay!).length,
                    itemBuilder: (context, index) {
                      Evento evento = _getEventsForDay(_selectedDay!)[index];
                      return Evento(
                        id: evento.id,
                        title: evento.title,
                        description: evento.description,
                        date: evento.date,
                        showRemoveIcon: true,
                        onRemove: () {
                          _addEventoService.removeEvent(context, evento, (_) {
                            _removeEvent(evento);
                          });
                        },
                      );
                    },
                  )
                : const Center(child: Text("Selecione um dia")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _addEventoService.addEvent(context, _selectedDay ?? DateTime.now(), (_) {
          setState(() {});
        }),
      ),
    );
  }

  List<Evento> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }
}
