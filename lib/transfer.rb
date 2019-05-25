class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    @sender.balance = @sender.balance - self.amount
    @sender.balance
    @receiver.balance = @receiver.balance + self.amount
    @receiver.balance
    if self.status == "pending"
      self.status = "complete"
    end

  end
  # your code here
end
