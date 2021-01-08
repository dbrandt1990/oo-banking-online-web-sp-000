class Transfer
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    sufficient_funds = @sender.balance > @amount ? true : false
    not_rejected =  self.status == "pending" ? true : false
    
    if sufficient_funds && valid? && not_rejected
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      puts "Transaction rejected. Please check your account balance."
      @status = "rejected"
   end
  end
  
  def reverse_transfer 
  end
  
end
