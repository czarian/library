class Book < ActiveRecord::Base

  scope :activeById, -> (id){ where(:status => true, :id => id).first }

end
