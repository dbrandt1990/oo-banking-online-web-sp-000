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
    if @sender.balance - @amount >= 0 && @status == "pending"
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
