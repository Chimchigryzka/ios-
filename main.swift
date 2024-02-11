class BankAccount {
    static var nextAccountNumber = 1
    
    let accountNumber: Int
    let accountOwner: String
    var balance: Double
    
    init(accountOwner: String, startingBalance: Double) {
        self.accountNumber = BankAccount.nextAccountNumber
        BankAccount.nextAccountNumber += 1
        self.accountOwner = accountOwner
        self.balance = startingBalance
    }

    func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
            print("Deposit successful. Current balance: \(balance)")
        } else {
            print("Invalid deposit amount. Please enter a positive amount.")
        }
    }

    func withdraw(amount: Double) {
        if amount > 0 {
            if balance >= amount {
                balance -= amount
                print("Withdrawal successful. Current balance: \(balance)")
            } else {
                print("Insufficient funds. Withdrawal failed.")
            }
        } else {
            print("Invalid withdrawal amount. Please enter a positive amount.")
        }
    }

    func getBalance() -> Double {
        return balance
    }

    func displayAccountInfo() {
        print("Account Information:")
        print("Account Number: \(accountNumber)")
        print("Account Owner: \(accountOwner)")
        print("Current Balance: \(balance)")
    }
}

// Function to create a new BankAccount with user input
func createNewAccount() -> BankAccount? {
    print("Enter the account owner's name:")
    guard let accountOwner = readLine(), !accountOwner.isEmpty else {
        print("Invalid input. Please enter a valid account owner name.")
        return nil
    }

    print("Enter the initial deposit amount:")
    guard let initialDeposit = Double(readLine() ?? ""), initialDeposit >= 0 else {
        print("Invalid input. Please enter a valid initial deposit amount.")
        return nil
    }

    return BankAccount(accountOwner: accountOwner, startingBalance: initialDeposit)
}

// Example usage with user input
let account1 = BankAccount(accountOwner: "John Doe", startingBalance: 1000.0)
account1.displayAccountInfo()

print("Enter the deposit amount:")
if let depositAmount = Double(readLine() ?? "") {
    account1.deposit(amount: depositAmount)
} else {
    print("Invalid input. Please enter a valid numeric amount.")
}

print("Enter the withdrawal amount:")
if let withdrawalAmount = Double(readLine() ?? "") {
    account1.withdraw(amount: withdrawalAmount)
} else {
    print("Invalid input. Please enter a valid numeric amount.")
}

account1.displayAccountInfo()

// Create a new account based on user input
if let newAccount = createNewAccount() {
    newAccount.displayAccountInfo()
}
