

import 'package:pitchbox/backend/model/loan.dart';

abstract class loanInterface {
  void addLoan(Loan loan);
  Future<List<Loan>>getLoanList(String userId);
}