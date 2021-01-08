class Transfer
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @reciever = receiver
    @amount = amount
    @status = "pending"
  end
  
end
