// IMPORTACIÓN: SDK y externos
import 'dart:convert';                  // SDK: Para decodificar JSON
import 'package:flutter/services.dart'; // FLUTTER: Para acceder a archivos assets
import 'package:get/get.dart';          // GETX: Para manejo de estado
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// CLASE: Modelo de horario individual
class ScheduleSlot {

  // ATRIBUTOS
  final String hora;        // ATRIBUTO: Hora del slot (ej. "08:00")
  bool disponible;    // ATRIBUTO: Disponibilidad del slot

  // CONSTRUCTOR
  ScheduleSlot({required this.hora, required this.disponible});

  // FACTORY: Construye un objeto desde JSON
  factory ScheduleSlot.fromJson(Map<String, dynamic> json) {
    return ScheduleSlot(
      hora: json['hora'],
      disponible: json['disponible'],
    );
  }

} // class ScheduleSlot {

// CLASE: Controlador para selección de horarios de citas
class PatientAppointmentSchedulesSelectionController extends GetxController {

  // ATRIBUTO: Lista de fechas disponibles para selección (Observable)
  var fechas = <String>[].obs;

  // ATRIBUTO: Índice de la fecha seleccionada (Observable)
  var fechaSeleccionada = 0.obs;

  // ATRIBUTO: Lista de horarios para una fecha dada (Observable)
  var horarios = <ScheduleSlot>[].obs;

  // ATRIBUTO: Horario seleccionado (Observable)
  var horarioSeleccionado = ''.obs;

  // ATRIBUTO: Duración del servicio (fijo en esta vista) NOTA: TRAER DATA DE OTRO .DART ❗❗❗
  final duracion = "50 minutos";

  // ATRIBUTO: Duración del servicio (fijo en esta vista) NOTA: TRAER DATA DE OTRO .DART ❗❗❗
  final precio = "S/ 140.00 PEN";

  // MÉTODO: Inicialización
  @override
  void onInit() async {
    super.onInit();
    await cargarHorarios();
    filtrarHorasPasadasSiEsHoy(0);
  }

  // MÉTODO: Cargar horarios y fechas desde archivo JSON
  Future<void> cargarHorarios() async {

    // LECTURA: Obtener contenido del archivo JSON
    final String jsonStr = await rootBundle.loadString('assets/data/sample_schedules.json');

    // DECODIFICACIÓN: Convertir string JSON a mapa
    final Map<String, dynamic> data = json.decode(jsonStr);

    // PARSEO: Fechas
    fechas.value = generarFechasProximas();

    // PARSEO: Horarios
    final lista = (data['horarios'] as List)
      .map((e) => ScheduleSlot.fromJson(e))
      .toList();

    // ACTUALIZACIÓN: Asignar lista al observable
    horarios.value = lista;
  }

  // MÉTODO: Generar 4 fechas desde hoy
  List<String> generarFechasProximas() {

    final now = DateTime.now();
    final formato = DateFormat('EEE\ndd MMM.', 'es'); // Ej: "Lun\n24 Jun."

    return List.generate(4, (i) {
      final fecha = now.add(Duration(days: i));
      return formato.format(fecha);
    });

  }

  // MÉTODO: Cuando el usuario cambia de fecha
  void seleccionarFecha(int index) async {
    fechaSeleccionada.value = index;
    await cargarHorarios(); // Recarga horarios desde JSON
    filtrarHorasPasadasSiEsHoy(index); // Aplica filtro si es hoy
  }

  // MÉTODO: Marcar como false horas pasadas
  void filtrarHorasPasadasSiEsHoy(int indiceFecha) {

    // VERIFICACIÓN: Solo si el índice representa hoy (primer fecha)
    if (indiceFecha != 0) return;

    final ahora = TimeOfDay.now();

    for (var slot in horarios) {

      final partes = slot.hora.split(':');
      final hora = int.parse(partes[0]);
      final minuto = int.parse(partes[1]);

      final esPasado = hora < ahora.hour || (hora == ahora.hour && minuto < ahora.minute);
      if (esPasado) slot.disponible = false;
    }

    horarios.refresh();
  }

  // MÉTODO: Establecer el horario seleccionado
  void seleccionarHorario(String hora) {
    horarioSeleccionado.value = hora;
  }

} // class PatientAppointmentSchedulesSelectionController extends GetxController {
