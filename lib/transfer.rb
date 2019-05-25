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
    if @sender.balance <= 0
      return "Transaction rejected. Please check your account balance."
    else
      # self.status == "pending" && self.valid? == true
      @sender.balance = @sender.balance - self.amount
      @receiver.balance = @receiver.balance + self.amount
      self.status = "complete"
      self.amount = 0
    end

  end
  # your code here
end
