import 'package:pitchbox/backend/model/loan.dart';

import '../model/mainUser.dart';
import '../service/loanService.dart';

class LoanController {
  final _loanService = LoanService();

  Future<void> addLoan({
    required String loanId,
    required String userId,
    required String businessId,
    required String loanAmount,
    required String loanDescription,
    required String status,

  })async {
    final loan = Loan(
        loanId: loanId,
        userId: userId,
        businessId: businessId,
        loanAmount: loanAmount,
        loanDescription: loanDescription,
        status: status,
    );

    await _loanService.addLoan(loan);

  }
}