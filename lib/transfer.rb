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
    if self.status == "pending" && @sender.balance > 0
      @sender.balance = @sender.balance - self.amount
      @receiver.balance = @receiver.balance + self.amount
      self.amount = 0
      self.status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
    end

  end
  # your code here
end
