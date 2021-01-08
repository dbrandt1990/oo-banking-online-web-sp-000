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
    if @sender.balance - @amount >= 0 
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
   end
  end
  
  def reverse_transfer 
  end
  
end
