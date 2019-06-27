class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status== "pending"
      if valid? && @sender.balance < @amount
         @status = "rejected"
         return "Transaction rejected. Please check your account balance."
      else
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      end
    end
  end
  
  def reverse_transfer
    if valid? && @receiver.balance > @amount && @status=="complete"
       @receiver.balance -= @amount
       @sender.balance += @amount
       @status = "reversed"
    else
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
   
    end
  end

end
