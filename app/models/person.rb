class Person < ActiveRecord::Base
  
  def hotness
    self.times_rated != 0 ? ((self.times_liked.to_f / self.times_rated) * 100).round(2) : 0.00
  end
  
end
