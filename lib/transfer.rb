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
    
    if valid? && sufficient_funds && not_rejected
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
   end
  end
  
  def reverse_transfer 
    
  end
  
end
