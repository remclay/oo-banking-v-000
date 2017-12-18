require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    #if transaction pending, AND valid?, execute. If not valid, "Sorry"
    if valid? && (sender.balance > self.amount) && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end


  #  if self.status != "pending"
  #    "Transaction rejected. Please check your account balance."
  #  elsif self.status == "pending"
  #    if self.valid?
  #      sender.balance -= amount
  #      receiver.balance += amount
  #      self.status = "complete"
  #    end
  #  end
  #end

end
