
import 'package:get/get.dart';

class ScheduleSlot {

  final String hora;
  final bool disponible;

  ScheduleSlot({required this.hora, required this.disponible});

} // class ScheduleSlot {

class PatientAppointmentSchedulesSelectionController extends GetxController {

  var fechas = ["Sáb\n25 Ene.", "Dom\n26 Ene.", "Lun\n27 Ene.", "Mar\n28 Ene."];
  var fechaSeleccionada = 0.obs;

  var horarios = <ScheduleSlot>[].obs;
  var horarioSeleccionado = ''.obs;

  final duracion = "50 minutos";
  final precio = "S/ 140.00 PEN";

  @override
  void onInit() {
    super.onInit();
    cargarHorarios();
  }

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

  void seleccionarHorario(String hora) {
    horarioSeleccionado.value = hora;
  }

} // class AppointmentSchedulesSelectionController extends GetxController {
