# Transfer class acts a space for a transaction between 
# two instances of the bank account class 
class Transfer
  attr_accessor :status
  attr_reader :receiver, :amount, :sender

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount

  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
    reject_amount    
  end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
    end
  end

  def reject_amount
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
