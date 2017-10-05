class BankAccount
	@@no_of_accounts = 0
	attr_reader :account_num, :checking_balance, :saving_balance

	def initialize
		@account_num = generate
		@checking_balance = 0
		@saving_balance = 0
		@total = @checking_balance + @saving_balance
		@@no_of_accounts += 1
		@interest_rate = 0.01
	end

	def account_num
		puts @account_num
		self
	end

	def checking_balance
		puts @checking_balance
		self
	end

	def saving_balance
		puts @saving_balance
		self
	end

	def deposit(amount, account)
		if account.downcase == "checking"
			@checking_balance += amount
		elsif account.downcase == "saving"
			@saving_balance += amount
		else
			puts "Invalid account"
		end
		self
	end

	def withdraw(amount, account)
		if account.downcase == "checking"
			if @checking_balance >= amount
				@checking_balance -= amount
			else
				puts "Insufficient funds"
			end
		elsif account.downcase == "saving"
			if @saving_balance >= amount
				@saving_balance -= amount
			else
				puts "Insufficient funds"
			end
		else
			puts "Invalid account"
		end
		self
	end

	def total
		puts "Checking Balance: #{@checking_balance}\nSaving Balance: #{@saving_balance}\nTotal Balance: #{@checking_balance + @saving_balance}"
		self
	end
			
	def account_information
		puts "Account Number: #{@account_num}\nInterest Rate: #{@interest_rate}\n#{self.total}"
		self 
	end

	def self.number_of_accounts
		puts @@no_of_accounts
	end

	private

		def generate
			string = ""
			10.times { string << rand(0..9).to_s }
			return string
		end

end

account1 = BankAccount.new
account1.account_num
account1.deposit(400, "checking").total
account1.checking_balance
BankAccount.number_of_accounts

account2 = BankAccount.new
account2.account_num
account2.deposit(400, "checking").withdraw(35, "CHEcking").withdraw(20, "saving").account_information
