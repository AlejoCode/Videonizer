var savingsAccount = {
    balance: 1000,
    interestRatePercent: 1,
    deposit: function addMoney(amount) {
      if (amount > 0) {
        savingsAccount.balance += amount;
      }
    },
    withdraw: function removeMoney(amount) {
        var verifyBalance = ((savingsAccount.balance - amount) >= 0 ? true : false);
        if ((amount > 0) && verifyBalance) {
            savingsAccount.balance -= amount;
        }
    },
    checkBalance: function printAccountSummary() {
        return "Welcome! \nYour balance is currently $" + savingsAccount.balance + " and your interest rate is " + savingsAccount.interestRatePercent + "%.";
    }
};