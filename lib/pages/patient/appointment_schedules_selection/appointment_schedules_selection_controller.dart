// IMPORTACIÓN: SDK y externos
import 'package:get/get.dart';

// CLASE: Modelo de horario individual
class ScheduleSlot {

  // ATRIBUTOS
  final String hora;        // ATRIBUTO: Hora del slot (ej. "08:00")
  final bool disponible;    // ATRIBUTO: Disponibilidad del slot

  // CONSTRUCTOR
  ScheduleSlot({required this.hora, required this.disponible});

} // class ScheduleSlot {

// CLASE: Controlador para selección de horarios de citas
class PatientAppointmentSchedulesSelectionController extends GetxController {

  // ATRIBUTO: Lista de fechas disponibles para selección (simuladas)
  var fechas = ["Sáb\n25 Ene.", "Dom\n26 Ene.", "Lun\n27 Ene.", "Mar\n28 Ene."];

  // ATRIBUTO: Índice de la fecha seleccionada (Observable)
  var fechaSeleccionada = 0.obs;

  // ATRIBUTO: Lista de horarios para una fecha dada (Observable)
  var horarios = <ScheduleSlot>[].obs;

  // ATRIBUTO: Horario seleccionado (Observable)
  var horarioSeleccionado = ''.obs;

  // ATRIBUTO: Duración del servicio (fijo en esta vista)
  final duracion = "50 minutos";

  // ATRIBUTO: Precio del servicio (fijo en esta vista)
  final precio = "S/ 140.00 PEN";

  // MÉTODO: Inicialización
  @override
  void onInit() {
    super.onInit();
    cargarHorarios();
  }

  // MÉTODO: Cargar horarios simulados para la fecha seleccionada
  void cargarHorarios() {
    horarios.value = [
      ScheduleSlot(hora: "07:00", disponible: true),
      ScheduleSlot(hora: "07:30", disponible: false),
      ScheduleSlot(hora: "08:00", disponible: true),
      ScheduleSlot(hora: "08:30", disponible: true),
      ScheduleSlot(hora: "09:00", disponible: true),
      ScheduleSlot(hora: "09:30", disponible: true),
      ScheduleSlot(hora: "10:00", disponible: false),
      ScheduleSlot(hora: "10:30", disponible: true),
      ScheduleSlot(hora: "11:30", disponible: false),
      ScheduleSlot(hora: "12:00", disponible: true),
      ScheduleSlot(hora: "12:30", disponible: true),
      ScheduleSlot(hora: "14:00", disponible: true),
      ScheduleSlot(hora: "14:30", disponible: true),
      ScheduleSlot(hora: "15:00", disponible: true),
      ScheduleSlot(hora: "15:30", disponible: true),
      ScheduleSlot(hora: "16:00", disponible: true),
      ScheduleSlot(hora: "16:30", disponible: false),
      ScheduleSlot(hora: "17:00", disponible: true),
      ScheduleSlot(hora: "17:30", disponible: false),
      ScheduleSlot(hora: "18:00", disponible: true),
      ScheduleSlot(hora: "18:30", disponible: false),
      ScheduleSlot(hora: "19:00", disponible: true),
      ScheduleSlot(hora: "19:30", disponible: false),
    ];
  } // void cargarHorarios() {

  // MÉTODO: Establecer el horario seleccionado
  void seleccionarHorario(String hora) {
    horarioSeleccionado.value = hora;
  }

} // class PatientAppointmentSchedulesSelectionController extends GetxController {
