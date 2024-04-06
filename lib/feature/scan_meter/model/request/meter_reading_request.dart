import 'dart:io';

class MeterReadingRequest {
  final String? id;
  final String? meterReading;
  final String? meterId;
  final String? imgPath;

  MeterReadingRequest({
    this.id,
    this.meterReading,
    this.meterId,
    this.imgPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'meterReading': meterReading,
      'meterId': meterId,
      'imgPath': imgPath,
    };
  }
}
