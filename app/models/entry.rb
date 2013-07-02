class Entry < ActiveRecord::Base
  attr_accessible :done, :name, :priority
  
  after_create :init
  
  def init
    self.done = false
    priority = 1 
  end
  
end
