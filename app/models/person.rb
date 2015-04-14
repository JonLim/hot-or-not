class Person < ActiveRecord::Base
  validates :name, :imageurl, presence: true
  
  def hot
    self.increment!(:times_liked, by = 1)
    self.increment!(:times_rated, by = 1)
  end
  
  def not
    self.increment!(:times_rated, by = 1)
  end
  
  def hotness
    self.times_rated != 0 ? ((self.times_liked.to_f / self.times_rated) * 100).round(2) : 0.00
  end
  
end
