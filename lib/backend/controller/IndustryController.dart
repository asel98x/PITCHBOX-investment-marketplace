import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/industry.dart';
import 'package:pitchbox/backend/service/industryService.dart';
import 'package:pitchbox/backend/utility/IndustryInterface.dart';


class IndustryController {
  final IndustryInterface _industryService = IndustryService();

  Future<List<Industry>> getIndustries() async {
    return await _industryService.getIndustries();
  }

  Future<List<Industry>> getIndustry(String industryName) async {
    return await _industryService.getIndustry(industryName);
  }


  Future<List<String>> getIndustryNames() async {
    return await _industryService.getIndustryNames();
  }
}
