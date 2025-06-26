// IMPORTACIÓN: SDK y externos
import 'dart:convert';                  // SDK: Para codificar y decodificar datos JSON
import 'package:flutter/services.dart'; // FLUTTER: Para acceder a recursos como archivos locales (asset bundles)
import 'package:get/get.dart';          // GETX: Para manejo de estado, navegación y dependencias

// CLASE: Modelo de terapeuta
class Therapist {

  // ATRIBUTOS
  final String nombre;           // ATRIBUTO: Nombre completo del terapeuta
  final String cedula;           // ATRIBUTO: Número de cédula profesional
  final List<String> idiomas;    // ATRIBUTO: Idiomas que habla
  final String nacionalidad;     // ATRIBUTO: Nacionalidad del terapeuta
  final String enfoque;          // ATRIBUTO: Enfoque terapéutico
  final List<String> etiquetas;  // ATRIBUTO: Temas que trata (tags)
  final String imagen;           // ATRIBUTO: Ruta de imagen del terapeuta

  // CONSTRUCTOR
  Therapist({
    required this.nombre,
    required this.cedula,
    required this.idiomas,
    required this.nacionalidad,
    required this.enfoque,
    required this.etiquetas,
    required this.imagen,
  }); // Therapist({

  // FACTORY: Construye un objeto desde mapa JSON
  factory Therapist.fromJson(Map<String, dynamic> json) {
    return Therapist(
      nombre: json['nombre'],
      cedula: json['cedula'],
      idiomas: List<String>.from(json['idiomas']),
      nacionalidad: json['nacionalidad'],
      enfoque: json['enfoque'],
      etiquetas: List<String>.from(json['etiquetas']),
      imagen: json['imagen'],
    );
  } // factory Therapist.fromJson

} // class Therapist {

// CLASE: Controlador para búsqueda de terapeutas
class PatientHomeSearchAppointmentsController extends GetxController {

  // ATRIBUTO: Lista observable de terapeutas disponibles
  var terapeutas = <Therapist>[].obs;

  // MÉTODO: Se ejecuta al iniciar el controlador
  @override
  void onInit() {
    super.onInit();
    cargarTerapeutas();
  }

  // MÉTODO: Cargar lista de terapeutas desde archivo JSON
  Future<void> cargarTerapeutas() async {

    // LECTURA: Cargar contenido del archivo
    final String jsonStr = await rootBundle.loadString('assets/data/sample_therapists.json');

    // DECODIFICACIÓN: Convertir string JSON a lista dinámica
    final List data = json.decode(jsonStr);

    // PARSEO: Convertir cada elemento en objeto Therapist
    final lista = data.map((e) => Therapist.fromJson(e)).toList();

    // ACTUALIZACIÓN: Asignar lista al observable
    terapeutas.value = lista;

  } // Future<void> cargarTerapeutas

} // class PatientHomeSearchAppointmentsController extends GetxController {
