import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextStyleCustom {
  static final textBtn = GoogleFonts.lato(
    color: Colors.white,
    fontSize: 23,
  );
  static final title = GoogleFonts.robotoCondensed(
    fontSize: 40,
    color: AppColors.primaryBase,
    fontWeight: FontWeight.w600,
  );
  static final titleRadio = GoogleFonts.robotoCondensed(
    fontSize: 23,
    color: AppColors.primaryBase,
    fontWeight: FontWeight.w600,
  );
  static final titleMin = GoogleFonts.robotoCondensed(
    fontSize: 35,
    color: AppColors.primaryBase,
    fontWeight: FontWeight.w600,
  );
  static final minimoTitle = GoogleFonts.robotoCondensed(
    fontSize: 30,
    color: AppColors.primaryBase,
    fontWeight: FontWeight.w600,
  );
  static final padrao = GoogleFonts.poppins(
    color: AppColors.primary,
  );
  static final padraoText = GoogleFonts.poppins(
    color: AppColors.primary,
    fontSize: 20,
  );
  static final padraoBranco = GoogleFonts.poppins(
    color: AppColors.branco,
    fontSize: 17,
  );
}
