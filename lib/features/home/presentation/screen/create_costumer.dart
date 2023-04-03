import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClienteFormScreen extends StatefulWidget {
  static const route = "/home/create/client";
  @override
  _ClienteFormScreenState createState() => _ClienteFormScreenState();
}

class _ClienteFormScreenState extends State<ClienteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _tipoCliente;
  late String _nombres;
  late String _apellidos;
  late String _razonSocial;
  late String _identificacion;
  late String _ruc;
  late String _contrasenaMarangatu;
  late List<String> _obligaciones = [];
  late String _actividadEconomica;
  late DateTime _fechaVencimientoMensual = DateTime.now();
  late DateTime _fechaVencimientoAnual = DateTime.now();
  late DateTime _fechaConstitucion = DateTime.now();
  late DateTime _fechaInicioDASE = DateTime.now();
  late String _correoMarangatu;
  late String _contrasenaCorreo;
  late String _celular;
  late String _direccion;
  late String _referencia;
  late String _barrioCiudad;
  late String _ubicacion;
  late Map<String, String> _otrosDatos = {};
  late List<String> _descripcionesVarias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Cliente'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Tipo de cliente'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el tipo de cliente';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tipoCliente = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombres'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese sus nombres';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nombres = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Apellidos'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese sus apellidos';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _apellidos = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Razón social'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la razón social';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _razonSocial = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Identificación'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la identificación';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _identificacion = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'RUC'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el RUC';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _ruc = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Contraseña de Marangatu'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la contraseña de Marangatu';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _contrasenaMarangatu = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Obligaciones (separadas por comas)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese las obligaciones';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _obligaciones =
                        value!.split(',').map((e) => e.trim()).toList();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Actividad económica'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la actividad económica';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _actividadEconomica = value!;
                  },
                ),
                SizedBox(height: 16.0),
                Text('Fechas:'),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Fecha de vencimiento mensual'),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _fechaVencimientoMensual,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() {
                        _fechaVencimientoMensual = picked;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                      text: DateFormat('dd/MM/yyyy')
                          .format(_fechaVencimientoMensual)),
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Fecha de vencimiento anual'),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _fechaVencimientoAnual,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() {
                        _fechaVencimientoAnual = picked;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                      text: DateFormat('dd/MM/yyyy')
                          .format(_fechaVencimientoAnual)),
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Fecha de constitución'),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _fechaConstitucion,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        _fechaConstitucion = picked;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                      text:
                          DateFormat('dd/MM/yyyy').format(_fechaConstitucion)),
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Fecha de inicio DASE'),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _fechaInicioDASE,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        _fechaInicioDASE = picked;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                      text: DateFormat('dd/MM/yyyy').format(_fechaInicioDASE)),
                ),
                SizedBox(height: 16.0),
                Text('Contacto:'),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Correo de Marangatu'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el correo de Marangatu';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _correoMarangatu = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Contraseña del correo'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la contraseña del correo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _contrasenaCorreo = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Celular'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el celular';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _celular = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Dirección'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la dirección';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _direccion = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Referencia'),
                  onSaved: (value) {
                    _referencia = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Barrio o ciudad'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el barrio o ciudad';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _barrioCiudad = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ubicación (link de Google Maps)'),
                  onSaved: (value) {
                    _ubicacion = value!;
                  },
                ),
                SizedBox(height: 16.0),
                Text('Otros datos:'),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Descripciones varias (separadas por comas)'),
                  onSaved: (value) {
                    _descripcionesVarias =
                        value!.split(',').map((e) => e.trim()).toList();
                  },
                ),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText:
                //           'Datos adicionales (clave y valor, separados por comas)'),
                //   onSaved: (value) {
                //     final data =
                //         value!.split(',').map((e) => e.trim()).toList();
                //     _otrosDatos = Map.fromIterables(
                //         data.whereIndex((i) => i.isEven),
                //         data.whereIndex((i) => i.isOdd));
                //   },
                // ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // TODO: implementar guardado en Firebase Firestore
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('¡Formulario enviado con éxito!'),
                      ));
                    }
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
