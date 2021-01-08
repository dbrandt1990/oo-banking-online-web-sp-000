class Transfer
  attr_reader :sender, :reciever, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @reciever = receiver
    @amount = amount
    @status = "pending"
  end
  
end
